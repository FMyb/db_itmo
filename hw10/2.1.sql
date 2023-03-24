start transaction read only isolation level read committed;
select * from FreeSeats(:FlightId);
commit;