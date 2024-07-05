use AdventureWorks2019

--Funciones iif

CREATE VIEW 
vista_genero
as
SELECT e.LoginID,e.JobTitle, e.Gender, IIF(e.Gender = 'F', 'MUJER', 'HOMBRE') AS 'SEXO'
FROM HumanResources.Employee AS e;

select UPPER(JobTitle) from vista_genero
where SEXO = 'MUJER';

--MERGE

SELECT OBJECT_ID(N'tempdb..#StudentsC1')

IF OBJECT_ID (N'tempdb..#StudentsC1') is not NULL
begin
    drop table #StudentsC1;
end

CREATE TABLE #StudentsC1(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);

INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(3,'Rogelio Rojas',0)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(4,'Mariana Rosas',1)
INSERT INTO #StudentsC1(StudentID, StudentName, StudentStatus) VALUES(5,'Roman Zavaleta',1)




IF OBJECT_ID(N'tempdb..#StudentsC2') is not NULL
begin
drop table #StudentsC2
END


CREATE TABLE #StudentsC2(
    StudentID       INT
    ,StudentName    VARCHAR(50)
    ,StudentStatus  BIT
);


INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(1,'Axel Romero Rendón',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(2,'Sofía Mora Ríos',0)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(6,'Mario Gonzalez Pae',1)
INSERT INTO #StudentsC2(StudentID, StudentName, StudentStatus) VALUES(7,'Alberto García Morales',1)

SELECT * FROM #StudentsC1
SELECT * FROM #StudentsC2

SELECT * FROM 
#StudentsC1 AS s1
INNER JOIN #StudentsC2 AS s2
ON s1.StudentID = s2.StudentID

Select * from 
#StudentsC1 as s1
left join #StudentsC2 as s2
on s1.StudentID = s2.StudentID

Select * from 
#StudentsC1 as s1
right join #StudentsC2 as s2
on s1.StudentID = s2.StudentID

insert into #StudentsC2 (StudentID,StudentName,StudentStatus)
select  s1.StudentID, s1.StudentName, s1.StudentStatus
from
#StudentsC2 as s1
left join #StudentsC2 as s2
where s2.StudentID is null 


update s2
set s2.StudentName = s1.StudentName,
    s2.StudentStatus = s1.StudentStatus

FROM 
#StudentsC1 AS s1
INNER JOIN #StudentsC2 AS s2
ON s1.StudentID = s2.StudentID
