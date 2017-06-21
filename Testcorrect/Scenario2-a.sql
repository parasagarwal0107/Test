select
	Engg_ID,
    engg.Project_ID,
    Project_Name,
    Hrs_Spent
from 
	engg
	left join
	project
    on engg.Project_Id=project.Project_Id;