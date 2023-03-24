create or replace function BuyReserved(
    in UserId integer,
    in Pass varchar(64),
    in FlightId integer,
    in SeatNo varchar(4)
) returns boolean
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
                 and seat_no = SeatNo
                 and user_id = UserId
            )
        ) then
        update tickets
        set status       = 'sold',
            booking_time = null,
            user_id      = null
        where flight_id = FlightId
          and seat_no = SeatNo;
        return true;
    end if;
    return false;
end;
$$ language plpgsql;