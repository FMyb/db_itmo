create or replace function FreeSeats(in FlightId integer)
    returns table
            (
                seats_no varchar(4)
            )
as
$$
begin
    return query
        select seats.seat_no
        from seats
        where plane_id = (select plane_id from flights where flight_id = FlightId)
          and seats.seat_no not in (select op.seat_no from OccupiedPlaces(FlightId) as op);
end;
$$
    language plpgsql;