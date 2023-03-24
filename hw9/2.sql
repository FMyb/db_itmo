create or replace function Reserve(in UserId integer, in Pass varchar(64), in FlightId integer, in SeatNo varchar(4))
    returns boolean
as
$$
begin
    if (
            not check_user(UserId, Pass)
            or not exists(select flight_id from flights where flight_id = FlightId)
            or SeatNo not in (select seat_no from all_seats where flight_id = FlightId)
            or SeatNo in (select op.seat_no from OccupiedPlaces(FlightId) as op)
        )
    then
        return false;
    end if;

    insert into tickets (flight_id, seat_no, user_id, booking_time, status)
    values (FlightId, SeatNo, UserId, now() + interval '3 days', 'booked'::ticket_status)
    on conflict (flight_id, seat_no) do update
        set user_id      = UserId,
            booking_time = now() + interval '3 days';
    return true;
end;
$$
    language plpgsql;