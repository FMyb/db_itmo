-- занятые места в рейсе (без учета времени полета)
create or replace function OccupiedPlacesWithoutFlightTime(in FlightId integer)
    returns table
            (
                seat_no varchar(4)
            )
as
$$
begin
    return query
        select tickets.seat_no
        from tickets
        where flight_id = FlightId
          and (
                (status = 'booked'::ticket_status and booking_time > now())
                or status = 'sold'::ticket_status
            );
end;
$$ language plpgsql;

-- занятые места в рейсе с учетом того что рейс мог уже состояться
create or replace function OccupiedPlaces(in FlightId integer)
    returns table
            (
                seat_no varchar(4)
            )
as
$$
begin
    return query
        select opwt.seat_no
        from OccupiedPlacesWithoutFlightTime(FlightId) as opwt
        union
        select all_seats.seat_no
        from all_seats
        where flight_id = FlightId
          and flight_time < now();
end;
$$
    language plpgsql;

-- создать нового пользоватля с паролем
create or replace procedure create_new_user(in UserId integer, in Pass varchar(64))
as
$$
begin
    insert into users (user_id, pass_hash) values (UserId, crypt(Pass, gen_salt('md5')));
end;
$$
    language plpgsql;

-- проверить корректность пароля у пользователя
create or replace function check_user(in _user_id integer, in _pass varchar(64)) returns boolean
as
$$
begin
    return exists(select user_id from users where user_id = _user_id and pass_hash = crypt(_pass, pass_hash));
end;
$$
    language plpgsql;

-- свободные места без учета времени рейса
create or replace function FreeSeatsWithoutFlightTime(in FlightId integer)
    returns table
            (
                seat_no varchar(4)
            )
as
$$
begin
    return query
        select seats.seat_no
        from seats
        where plane_id = (select plane_id from flights where flight_id = FlightId)
          and seats.seat_no not in (select op.seat_no from OccupiedPlacesWithoutFlightTime(FlightId) as op);
end;
$$ language plpgsql;

-- общая статистика по рейсам - свободные места, забронированные места, купленые места
create or replace function Statistics()
    returns table
            (
                flight_id       integer,
                free_seats      bigint,
                reserved_seats  bigint,
                purchased_seats bigint
            )
as
$$
begin
    return query
        select flights.flight_id,
               count(freewft.seat_no),
               count(booked.seat_no),
               count(sold.seat_no)
        from flights
                 natural left join seats
                 natural left join FreeSeatsWithoutFlightTime(flights.flight_id) freewft
                 natural left join (select tickets.flight_id, tickets.seat_no from tickets where status = 'sold') sold
                 left join booked on booked.flight_id = flights.flight_id and booked.seat_no = seats.seat_no
        group by flights.flight_id;
end;
$$ language plpgsql;

-- количество мест в самолете забронированные пользователем
create or replace function BookedByUser(in UserId integer)
    returns table
            (
                flight_id    integer,
                booked_seats bigint
            )
as
$$
begin
    return query
        select booked.flight_id, count(booked.seat_no)
        from booked
        where booked.user_id = UserId
        group by booked.flight_id;
end;
$$ language plpgsql;