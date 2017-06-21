Select 
	Joins3.Train_ID as Train_ID,
    Joins3.Train_Name as Train_Name,
    Joins3.Boarding as Boarding,
    Joins4.Destination as Destination
from
(
select 
	Joins1.Train_ID as Train_ID,
    Joins1.Train_Name as Train_Name,
    Joins1.Station_ID as Station_ID,
    Joins1.Station_Name as Boarding
from
	(
    Select 
		Joins.Train_ID as Train_ID,
		Train_Name,
		Joins.Station_Id as Station_Id,
		Joins.Station_Name as Station_Name,
		Joins.Distance as Distance,
		Joins.Arrival as Arrival,
		Joins.Departure as Departure
	from train_details 
		left join 
	(
	select 
		Train_ID,
		journey_details.Station_Id as Station_Id,
		Station_Name,
		Distance,
		Arrival,
		Departure
    from journey_details
		left join 
		station_details
		on journey_details.Station_Id=station_details.Station_Id
 ) Joins
	on Joins.Train_ID=train_details.Train_ID
) Joins1
   where Joins1.Arrival IS NULL and Joins1.Departure IS NOT NULL
) Joins3

	left join
   
(  select 
	Joins1.Train_ID as Train_ID,
    Joins1.Train_Name as Train_Name,
    Joins1.Station_ID as Station_ID,
    Joins1.Station_Name as Destination
from
	(
    Select 
		Joins.Train_ID as Train_ID,
		Train_Name,
		Joins.Station_Id as Station_Id,
		Joins.Station_Name as Station_Name,
		Joins.Distance as Distance,
		Joins.Arrival as Arrival,
		Joins.Departure as Departure
	from train_details 
		left join 
	(
	select 
		Train_ID,
		journey_details.Station_Id as Station_Id,
		Station_Name,
		Distance,
		Arrival,
		Departure
    from journey_details
		left join 
		station_details
		on journey_details.Station_Id=station_details.Station_Id
 ) Joins
	on Joins.Train_ID=train_details.Train_ID
) Joins1
   where Joins1.Arrival IS NOT NULL and Joins1.Departure IS NULL
) Joins4  
  on Joins3.Train_ID=Joins4.Train_ID;