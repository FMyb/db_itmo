create or replace function FlightStat(in UserId integer, in Pass varchar(64), in FlightId integer)
    returns table
            (
                buy_available     boolean,
                reserve_available boolean,
                free_seats        bigint,
                reserved_seats    bigint,
                purchases_seats   bigint
            )
as
$$
begin
    if (not check_user(UserId, Pass)) then
        return;
    end if;

    return query
        select Statistics.free_seats + coalesce(BookedByUser.booked_seats, 0) > 0,
               Statistics.free_seats > 0,
               Statistics.free_seats,
               Statistics.reserved_seats,
               Statistics.purchased_seats
        from Statistics()
                 natural left join BookedByUser(UserId)
        where Statistics.flight_id = FlightId;
end;
$$ language plpgsql;