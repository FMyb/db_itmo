-- при бронировании
start transaction read write isolation level read committed;
select Reserve(:UserId, :Pass, :FlightId, :SeatNo);
commit;

-- при покупке свободного места
start transaction read write isolation level repeatable read;
select BuyFree(:FlightId, :SeatNo);
commit;

-- при покупке забронированного места
start transaction read write isolation level repeatable read;
select BuyReserved(:UserId, :Pass, :FlightId, :SeatNo);
commit;
