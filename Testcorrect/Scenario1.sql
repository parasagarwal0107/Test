create table department(Department_ID int,Department_Name varchar(45),Primary Key (Department_ID));
insert into department(Department_ID,Department_Name)values
(1,"HR"),
(2,"Development"),
(3,"Testing");

create table project(Project_ID int,Department_ID int,Project_Name varchar(45),Primary Key (Project_ID));
insert into project(Project_ID,Department_ID,Project_Name)values
(1,2,"A"),
(2,2,"B"),
(3,2,"C"),
(4,3,"D"),
(5,3,"E"),
(6,3,"F");

create table engg(Engg_ID int,Project_ID int,Hrs_Spent int,Primary Key (Engg_ID));
insert into engg(Engg_ID,Project_ID,Hrs_Spent)values
(1,1,2),
(2,1,3),
(3,2,4),
(4,2,1),
(5,3,2),
(6,3,5),
(7,4,6),
(8,4,2),
(9,5,3),
(10,5,1),
(11,6,5),
(12,6,3);
