create or replace function BuyFree(in FlightId integer, in SeatNo varchar(4))
    returns boolean
as
$$
begin
    if (
            not exists(select flight_id from flights where flight_id = FlightId)
            or SeatNo not in (select seat_no from all_seats where flight_id = FlightId)
            or SeatNo in (select op.seat_no from OccupiedPlaces(FlightId) as op)
        )
    then
        return false;
    end if;

    insert into tickets (flight_id, seat_no, status)
    values (FlightId, SeatNo, 'sold'::ticket_status)
    on conflict (flight_id, seat_no)
        do update
        set status       = 'sold'::ticket_status,
            user_id      = null,
            booking_time = null;

    return true;
end;
$$ language plpgsql;