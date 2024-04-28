

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