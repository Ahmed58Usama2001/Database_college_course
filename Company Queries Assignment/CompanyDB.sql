create database company
go
use company

create TABLE Employee(Fname varchar(20),
Lname varchar(20),
SSN int PRIMARY KEY,
BDATE date,
Addresss varchar(100),
Sex varchar(10),
Salary int,
Superssn int,
Dno int)
SET DATEFORMAT dmy;

insert into Employee VALUES
('Ahmed', 'Ali', 112233, '1/1/65', '15 Ali fahmy St.Giza', 'M', 1300, 223344, 10),
('Kamel', 'Mohamed', 223344, '15/10/70', '38 Mohy el dien abo el Ezz St.Cairo', 'M' ,1800, 321654, 10),
('Hanaa', 'Sobhy', 123456, '18/3/73', '38 Abdel Khalik Tharwat St. Downtown.Cairo', 'F', 800, 223344, 10),
('Amr', 'Omran', 321654, '14/9/63', '44 Hilopolis.Cairo', 'M', 2500, null, null),
('Noha', 'Mohamed', 968574, '1/2/75', '55 Orabi St. El Mohandiseen .Cairo', 'F', 1600, 321654, 20),
('Edward', 'Hanna', 512463, '19/8/72', '18 Abaas El 3akaad St. Nasr City.Cairo', 'M', 1500, 321654, 30),
('Mariam', 'Adel', 669955, '12/6/82', '269 El-Haram st. Giza', 'F', 750, 512463, 20),
('Maged', 'Raoof', 521634, '6/4/80', '18 Kholosi st.Shobra.Cairo', 'M', 1000, 968574, 30)

create table Department (Dname varchar(20),
						DNum int primary key,
						MGRSSN int,
						MGRStart date)
						
insert into Department values					
('DP1', 10, 223344, '1/1/2005'),
('DP2', 20, 968574, '1/3/2006'),
('DP3', 30, 512463, '1/6/2006')

create table Worksfor(ESSN int, 
					  Pno int, 
					  Hours int,
					  primary key (ESSN, Pno))
insert into Worksfor values					  
(223344, 100, 10),
(223344, 200, 10),
(223344, 300, 10),
(112233, 100, 40),
(968574, 400, 15),
(968574, 700, 15),
(968574, 300, 10),
(669955, 400, 20),
(223344, 500, 10),
(669955, 700, 7),
(669955, 300, 10),
(512463, 500, 10),
(512463, 600, 25),
(521634, 500, 10),
(521634, 600, 20),
(521634, 300, 6),
(521634, 400, 4)


create table Project(Pname varchar(30), 
					Pnumber int primary key, 
					Plocation varchar(100),
					City varchar(20), 
					Dnum int)

insert into Project values					
('AL Solimaniah', 100, 'Cairo_Alex Road', 'Alex', 10),
('Al Rabwah', 200, '6th of October City', 'Giza', 10),
('Al Rawdah', 300, 'Zaied City', 'Giza', 10),
('Al Rowad', 400, 'Cairo_Faiyom Road', 'Giza', 20),
('Al Rehab', 500, 'Nasr City', 'Cairo', 30),
('Pitcho american', 600, 'Maady', 'Cairo', 30),
('Ebad El Rahman', 700, 'Ring Road', 'Cairo', 20)

create table Dependent(ESSN int,
						Dependent_name varchar(50),
						Sex varchar(10),
						Bdate date)
SET DATEFORMAT dmy;
insert into Dependent values			
(112233, 'Hala Saied Ali', 'F', '18/10/1970'),
(223344, 'Ahmed Kamel Shawki', 'M', '27/3/1998'),
(223344, 'Mona Adel Mohamed', 'F', '25/4/1975'),
(321654, 'Ramy Amr Omran', 'M', '26/1/1990'),
(321654, 'Omar Amr Omran', 'M', '30/3/1993'),
(321654, 'Sanaa Gawish', 'F', '16/5/1973'),
(512463, 'Sara Edward', 'F', '15/9/2001'),
(512463, 'Nora Ghaly', 'F', '22/6/1976')

select * from Employee
where Dno=30 and Salary between 1000 and 2000;

select p.Pnumber,p.Pname,sum(w.Hours) as total_hours
from Project p join Worksfor w on p.Pnumber=w.Pno
group by p.Pnumber,p.Pname
order by total_hours desc;

select SSN,Fname + ' '+ lname as full_name
from Employee
where Superssn in (select SSN from Employee where Fname='Kamel' and Lname='Mohamed') ;

select e.SSN,e.Fname + ' '+ e.lname as full_name
from Employee e,Worksfor w
where e.SSN=w.ESSN and w.Hours>=10 and w.Pno in ( select Pnumber from Project where Pname='Al Rabwah');

select e.SSN,e.Fname + ' '+ e.lname as full_name
from Employee e  where e.SSN not in(select w.ESSN from Worksfor w  );