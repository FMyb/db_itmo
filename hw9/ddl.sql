-- рейсы и самолеты исполняющие рейс
create table flights
(
    flight_id   integer   not null primary key,
    flight_time timestamp not null,
    plane_id    integer   not null
);

-- места в самолете
create table seats
(
    plane_id integer    not null,
    seat_no  varchar(4) not null
);

-- пользователи и хеши паролей с солью (crypt умеет запоминать соль в хеше)
create table users
(
    user_id   integer not null primary key,
    pass_hash text    not null
);

-- статус билета - куплено или забронировано
create type ticket_status as enum ('booked', 'sold');

-- проданые и забронированные места на рейсы (билеты)
create table tickets
(
    flight_id    integer       not null references flights (flight_id),
    seat_no      varchar(4)    not null,
    user_id      integer references users (user_id),
    booking_time timestamp,
    status       ticket_status not null,
    primary key (flight_id, seat_no)
);

-- представление для получения всех мест
create view all_seats as
select flight_id, flight_time, plane_id, seat_no
from flights
         natural join seats;

-- представление для получения мест и пользователей в самолете с действующим бронированием
create view booked as
select flight_id, seat_no, user_id
from tickets
where status = 'booked'::ticket_status
  and booking_time > now();

