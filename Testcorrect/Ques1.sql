select 
		Joins2.Train_Name as Train_Name,
		Joins2.Station_Name as Station_Name,
		Joins2.TotalDistance as Distance,
		Joins2.TotalDistance/Abs(Joins2.timetaken) as Avg_Speed
from		
 (   
 select 
	Joins1.Train_ID,
	Joins1.Train_Name as Train_Name,
	group_concat(Joins1.Station_Name) as Station_Name,
	sum(Joins1.Distance) as TotalDistance,
	sum(hour(Joins1.Departure))-sum(hour(Joins1.Arrival)) as timetaken
from 
	(Select 
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
	group by Joins1.Train_ID
) Joins2