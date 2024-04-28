

/********************************************************************************************************************
Author:			Chibuike Kyrian Okoroama
Date:			April 05, 2021
Database Name:		School
Purpose:		Learning SQL
*********************************************************************************************************************/

use master
go

create database SCHOOL
go

Use SCHOOL
go


create table CourseMaster
(
	CID			Int				Primary Key,
	CourseName		Varchar(40)			NOT NULL, 
	Category		Char(1)				NULL, check(Category in ('B', 'M', 'A')),
	Fee			Smallmoney			NOT NULL check( Fee > 0),
)
go

---Insert values into CourseMaster Table-----
	INSERT INTO		CourseMaster VALUES		(1, 'DataScience', 'A', 2000)
	INSERT INTO		CourseMaster VALUES		(2, 'Python', 'M', 1000)
	INSERT INTO		CourseMaster VALUES		(3, 'SQL Server', 'M', 600)
	INSERT INTO		CourseMaster VALUES		(4, 'Power BI', 'B', 500)
go
	
	INSERT INTO		CourseMaster VALUES		(5, 'MBSI', 'B', 500)
	INSERT INTO		CourseMaster VALUES		(6, 'SQL Azure', 'A', 2000)
	INSERT INTO		CourseMaster VALUES		(7, 'Tableau', 'B', 500)
	INSERT INTO		CourseMaster VALUES		(8, 'Hadoop', 'A', 2000)
go

select * from CourseMaster
go

---Create StudentMaster table----
Use SCHOOL
go

create table StudentMaster
(
	SID			TinyInt					Primary Key,
	StudentName		Varchar(40)				NOT NULL,
	Origin			Char(1)					NOT NULL check(Origin in( 'L', 'F')),
	Type			Char(1)					NOT NULL check(Type in( 'U', 'G')),
)
go

---insert values into StudentMaster Table-----
	INSERT INTO		StudentMaster VALUES	(100, 'Chibuike oki', 'F', 'G')
	INSERT INTO		StudentMaster VALUES	(101, 'Kyrian abike', 'F', 'U')
	INSERT INTO		StudentMaster VALUES	(102, 'Khrishna Amar', 'L', 'U')	
	INSERT INTO		StudentMaster VALUES	(103, 'Elsa Amwi', 'L', 'G')	
go

	INSERT INTO		StudentMaster VALUES	(104, 'Sadish Kumar','L', 'U')
	INSERT INTO		StudentMaster VALUES	(105, 'Priya Rihma', 'L', 'U')
	INSERT INTO		StudentMaster VALUES	(106, 'Pato Naki', 'F', 'G')	
	INSERT INTO		StudentMaster VALUES	(107, 'Elsa Period ', 'F', 'G')	
go

	INSERT INTO		StudentMaster VALUES	(108, 'Maka Levi','F', 'U')
	INSERT INTO		StudentMaster VALUES	(109, 'Mary Elma', 'F', 'U')
	INSERT INTO		StudentMaster VALUES	(110, 'Patrick Kala', 'L', 'G')	
	INSERT INTO		StudentMaster VALUES	(111, 'Mikal Crow', 'F', 'G')	
go

	INSERT INTO		StudentMaster VALUES	(112, 'Abu Naser','F', 'G')
	INSERT INTO		StudentMaster VALUES	(113, 'Ehi Asaka', 'F', 'G')
	INSERT INTO		StudentMaster VALUES	(114, 'Muthar Raul', 'L', 'G')	
	INSERT INTO		StudentMaster VALUES	(115, 'Paul Whister', 'F', 'G')	
go

	INSERT INTO		StudentMaster VALUES	(116, 'Abu kela','L', 'U')
	INSERT INTO		StudentMaster VALUES	(117, 'Kele kpa', 'F', 'U')
	INSERT INTO		StudentMaster VALUES	(118, 'Gonxalex Lote', 'L', 'G')	
	INSERT INTO		StudentMaster VALUES	(119, 'Atro wide', 'F', 'U')	
go

select * from StudentMaster
go

---Create EnrollmentMaster table----
---FWF means Fee Waiver Flag-------- 

create table EnrollmentMaster
(
	CID				Integer					NOT NULL Foreign Key references CourseMaster (CID),
	SID				Tinyint					NOT NULL Foreign Key references StudentMaster (SID),
	DOE				DateTime				NOT NULL,
	FWF 			Bit						NOT NULL,
	Grade			Char(1)					NULL check (Grade in ('O', 'A', 'B', 'C'))
)
go

update EnrollmentMaster
set DOE = '2021/08/20'
where DOE >= '2021/01/01'

---insert values into EnrollmentMaster Table-----
	INSERT INTO		EnrollmentMaster VALUES	(3, 100, '2021/03/02', '0', 'O')
	INSERT INTO		EnrollmentMaster VALUES	(5, 101, '2021/03/05', '1', 'O')
	INSERT INTO		EnrollmentMaster VALUES	(1, 110, '2021/02/02', '1', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(8, 103, '2020/12/24', '1', 'C')
go

	INSERT INTO		EnrollmentMaster VALUES	(2, 102, '2021/01/02', '1', 'B')
	INSERT INTO		EnrollmentMaster VALUES	(7, 104, '2020/11/05', '0', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(4, 106, '2021/02/02', '0', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(6, 119, '2020/12/12', '1', 'A')
go

	INSERT INTO		EnrollmentMaster VALUES	(8, 118, '2021/02/02', '0', 'B')
	INSERT INTO		EnrollmentMaster VALUES	(1, 111, '2021/01/01', '1', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(3, 104, '2021/03/02', '1', 'C')
	INSERT INTO		EnrollmentMaster VALUES	(5, 108, '2020/12/08', '1', 'C')
go

	INSERT INTO		EnrollmentMaster VALUES	(7, 117, '2021/01/10', '1', 'C')
	INSERT INTO		EnrollmentMaster VALUES	(2, 115, '2021/01/02', '0', 'C')
	INSERT INTO		EnrollmentMaster VALUES	(1, 107, '2021/02/14', '0', 'C')
	INSERT INTO		EnrollmentMaster VALUES	(3, 112, '2020/12/03', '1', 'C')
go

	INSERT INTO		EnrollmentMaster VALUES	(2, 109, '2021/01/22', '0', 'B')
	INSERT INTO		EnrollmentMaster VALUES	(4, 107, '2020/11/16', '0', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(6, 105, '2020/10/02', '0', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(5, 100, '2020/12/12', '1', 'A')
go

	INSERT INTO		EnrollmentMaster VALUES	(3, 101, '2021/01/20', '0', 'C')
	INSERT INTO		EnrollmentMaster VALUES	(7, 103, '2020/11/18', '0', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(8, 106, '2020/10/31', '0', 'A')
	INSERT INTO		EnrollmentMaster VALUES	(4, 111, '2020/07/12', '1', 'A')
go


select * from EnrollmentMaster
go

Use SCHOOL
go

--Display School DB tables
Select * from CourseMaster
Select * from EnrollmentMaster
Select * from StudentMaster

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q1-1.	List the course wise total no. of Students enrolled. Provide the information only for students of foreign origin and only if the total exceeds 10.--
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
USE SCHOOL
GO

SELECT CourseName, count (*) as CourseCnt
FROM CourseMaster as CM
		join	EnrollmentMaster as Em 
		ON		EM.CID = CM.CID
		join	StudentMaster as SM
		ON		SM.SID = EM.SID
WHERE Origin = 'F'
GROUP BY CourseName
HAVING count(*) >5


USE SCHOOL
GO

SELECT Cm.CID, CourseName, count (*) AS StudentCnt
FROM CourseMaster AS Cm join
							( 
								SELECT CID, StudentName, Origin
								FROM EnrollmentMaster AS Em join 
												 (
												SELECT SID, StudentName, Origin
												FROM StudentMaster
												WHERE Origin = 'F'
											) 
											AS Sn ON Em.SID = Sn.SID
							)
							AS K ON k.CID = Cm.CID
GROUP BY Cm.CID, CourseName
HAVING count(*) >5


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q2.	List the names of the Students who have not enrolled for Java course.---
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
USE SCHOOL
GO

SELECT *
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID

SELECT DISTINCT SM.SID, StudentName
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
WHERE not CourseName like 'Java'

--who enrolled in java
select distinct SID from enrollmentmaster where CID = (select CID from CourseMaster where CourseName = 'JAVA')

USE SCHOOL
GO


SELECT SID, StudentName
FROM StudentMaster
WHERE SID in (
					SELECT SID
					FROM CourseMaster AS CM join EnrollmentMaster AS EM ON CM.CID = EM.CID
					WHERE CM.CID <> 5
			)


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q3.	List the name of the advanced course where the enrollment by foreign students is the highest.---
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
USE SCHOOL
GO

SELECT CourseName, count (*) CourseNr
FROM StudentMaster AS SM
		join	EnrollmentMaster AS EM
		ON		SM.SID = EM.SID
		join	CourseMaster AS CM
		ON		CM.CID = EM.CID
WHERE SM.Origin = 'F' and CM.Category = 'A'
GROUP BY CourseName


Use SCHOOL
go

select Cm.CID, CourseName, COUNT(*) as ForeignStudents_registered
from CourseMaster as Cm join
							( 
								select CID, Origin
								from EnrollmentMaster as Em join 
												 (
												Select SID, Origin, count (*) as cnt
												from StudentMaster
												where Origin = 'F'
												group by SID, Origin
											) 
											as Sn on Em.SID = Sn.SID
							)
							as K on k.CID = Cm.CID
group by Cm.CID, CourseName
having count(*) >5
Order by ForeignStudents_registered DESC


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q4.	List the names of the students who have enrolled for at least one basic course in the current month.--
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT distinct SM.StudentName, CM.CourseName, CM.Category
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where DATEDIFF(MM, DOE, GETDATE()) = 0 and CM.Category = 'B'


Use SCHOOL
go

Select * 
from StudentMaster

-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q5.	List the names of the Undergraduate, local students who have got a “C” grade in any basic course.	`
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT DISTINCT StudentName
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where SM.Type = 'U' and SM.Origin = 'L' and EM.Grade = 'C' and CM.Category = 'B'


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q6.	List the names of the courses for which no student has enrolled in the month of May 2020.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT distinct *
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where YEAR(DOE) <> 2020 and MONTH(DOE) <> 7

Select CourseName
from CourseMaster 
where CID in (
				Select CID
				from EnrollmentMaster 
				where YEAR(DOE) <> 2020 and MONTH(DOE) <> 7
			)


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q7.	List name, Number of Enrollments and Popularity for all Courses. Popularity has to be displayed as “High” if number of enrollments is higher than 5,  
	--  “Medium” if greater than or equal to 20and less than 5, and “Low” if the no.  Is less than 2.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

select	CM.CourseName, count (*) as NoOfEnrl,
		case
			when count (*) < 2 then 'Low'
			when count (*)  between 2 and 5 then 'Medium'
			Else 'High'
		end as Popularity
From CourseMaster as CM join EnrollmentMaster as EM
on EM.CID = CM.CID
group by CourseName




-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q8.	List the most recent enrollment details with information on Student Name, Course name and age of enrollment in days.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT  StudentName, CourseName, DATEDIFF(DD, DOE, GETDATE()) as enrollmentage
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where DATEDIFF(DD, DOE, GETDATE()) <= 8


-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q9.	List the names of the Local students who have enrolled for exactly 3 basic courses. 
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT  SM.SID, StudentName, count (*) as CNT
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where CM.Category = 'B'and Origin = 'L'
GROUP BY SM.SID, StudentName
having count (*) =3





-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q10.	List the names of the Courses enrolled by all (every) students.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT  CM.CID, CourseName, count (CourseName) as CourseNr
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
group by CM.CID, CourseName



Select CM.CID, CourseName, count (CourseName) as CourseNr
from CourseMaster  as CM join EnrollmentMaster as EM on CM.CID = Em.CID
group by CM.CID, CourseName




-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q11.	For those enrollments for which fee have been waived, provide the names of students who have got ‘O’ grade.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT  distinct StudentName, Grade, FWF
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where FWF= 1 and Grade = 'O'


Select SID, StudentName
from StudentMaster
where SID in (
				Select SID from EnrollmentMaster 
				where FWF= 1 and Grade = 'O'
			)



-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q12.	List the names of the foreign, undergraduate students who have got grade ‘C’ in any basic course.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT  DISTINCT SM.SID, StudentName
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where Origin = 'F' and Type = 'U' and Grade = 'C' and Category = 'B' 




-------------------------------------------------------------------------------------------------------------------------------------------------------------
--Q13.	List the course name, total no. of enrollments in the current month.
Select * from CourseMaster       Select * from EnrollmentMaster          Select * from StudentMaster
-------------------------------------------------------------------------------------------------------------------------------------------------------------
Use SCHOOL
go

SELECT  EM.CID, CourseName,  count (*) as cntEnrl
FROM StudentMaster AS SM
		join	EnrollmentMaster as EM
		ON		SM.SID = EM.SID
		join	CourseMaster as CM
		ON		CM.CID = EM.CID
where DATEDIFF(MM,DOE, getdate())=0
group by  EM.CID, CourseName

Select EM.CID, CourseName,  count (*) as cnt
from CourseMaster as CM join EnrollmentMaster  as EM on CM.CID = EM.CID
where DATEDIFF(MM,DOE, getdate())=0
group by  EM.CID, CourseName


--with datediff
Select CourseName, DATENAME(mm, DOE) as MonthEnrolled, count (*) as cnt
from CourseMaster as CM join EnrollmentMaster  as EM on CM.CID = EM.CID
where MONTH(DOE) = 8
group by  CourseName, DATENAME(mm, DOE)