Select 
	Joins.Project_Name as Project_Name,
	Department_Name,
    Joins.Hrs_Spent as Hrs_Spent
from
	department
    left join 
	(
    select
		Department_ID,
		Engg_ID,
		engg.Project_ID as Project_ID,
		Project_Name,
		Hrs_Spent
	from 
		engg
		left join
		project
		on engg.Project_Id=project.Project_Id
    ) Joins
    on department.Department_ID=Joins.Department_ID;