-- Create distinct addresses from CSVs
A = LOAD '/ParkingTickets/' USING PigStorage(',') AS (tag_number:chararray, date:chararray, infraction_code:int, infraction_desc:chararray, fine:int, time:int, loc_1:chararray, loc_2:chararray, loc_3:chararray, loc_4:chararray, prov:chararray);
B = FOREACH A GENERATE loc_2;
C = DISTINCT B;
STORE C INTO '/ParkingTickets/DistinctAddresses'; 
