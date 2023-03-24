create or replace function FlightsStatistics(in UserId integer, in Pass varchar(64))
    returns table
            (
                flight_id         integer,
                buy_available     boolean,
                reserve_available boolean,
                free_seats        bigint,
                reserved_seats    bigint,
                purchases_seats   bigint
            )
as
$$
declare
    booked_by_user bigint;
begin
    if (not check_user(UserId, Pass)) then
        return;
    end if;

    booked_by_user = (select count(seat_no) from booked where user_id = UserId);
    return query
        select Statistics.flight_id,
               Statistics.free_seats + booked_by_user > 0,
               Statistics.free_seats > 0,
               Statistics.free_seats,
               Statistics.reserved_seats,
               Statistics.purchased_seats
        from Statistics()
        where 1 = 1;
end;
$$ language plpgsql;