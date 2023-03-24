create or replace function ExtendReservation(
    in UserId integer,
    in Pass varchar(64),
    in FlightId integer,
    in SeatNo varchar(4)
)
    returns boolean
as
$$
begin
    if (
            not check_user(UserId, Pass)
            or not exists(select flight_id from flights where flight_id = FlightId)
        )
    then
        return false;
    end if;

    if (
        exists(select flight_id
               from booked
               where flight_id = FlightId
                 and seat_no = SeatNo)
        ) then
        update tickets
        set booking_time = now() + interval '3 days'
        where flight_id = FlightId
          and seat_no = SeatNo;
        return true;
    end if;
    return false;
end;
$$ language plpgsql;