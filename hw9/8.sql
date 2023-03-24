create or replace procedure CompressSeats(in FlightId integer)
as
$$
declare
    current_seat_no varchar(4);
    all_seats_no_cursor cursor for
        select seat_no
        from all_seats
        where flight_id = FlightId
        order by seat_no;
    sold_seats_no_cursor cursor for
        select seat_no
        from tickets
        where status = 'sold'::ticket_status
          and flight_id = FlightId
        order by seat_no for update;
    booked_seats_no_cursor cursor for
        select seat_no
        from tickets
        where status = 'booked'::ticket_status
          and flight_id = FlightId
        order by seat_no for update;
begin
    if (not exists(select flight_id from flights where flight_id = FlightId)) then
        return;
    end if;

    open all_seats_no_cursor;
    for _ in sold_seats_no_cursor
        loop
            fetch next from all_seats_no_cursor into current_seat_no;
            update tickets
            set seat_no = current_seat_no
            where current of sold_seats_no_cursor;
        end loop;

    for _ in booked_seats_no_cursor
        loop
            fetch next from all_seats_no_cursor into current_seat_no;
            update tickets
            set seat_no = current_seat_no
            where current of booked_seats_no_cursor;
        end loop;
    close all_seats_no_cursor;
end;
$$ language plpgsql;