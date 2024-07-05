-- seleccionar todas las ordenes que fueron emitidas por los empleados 
--Nancy Davolio, Anne Dodsworth y Andrew Fuller

select * from Orders 
where EmployeeID = 1
or EmployeeID = 9
or EmployeeID= 2;


select * from Orders
where   EmployeeID in (1,9,2)

--Seleccionar todas las ordenes dividiendo la fecha de  orden en año, mes y día
select orderDate as 'Fecha de orden',
year(OrderDate) as 'Año',
month (OrderDate) as 'Mes',
day (OrderDate) as 'Dia'
from Orders

--Seleccionar todos los nombres de los epmlpeados
select concat(FirstName, '',LastNamr) as 'Nombre Completo'
from Employees

--Seleccionar todos los productos donde la existencia sea mayor o igual a 40
--y el precio sea menor a 19

select ProductName as 'Nombre del producto',
UnitPrice as 'Precio',
UnitsINStock as 'Existencia'
from Products 
where UnitsInStock >=40
and UnitPrice <19;

--Seleccionar todas las ordenes realizadas de abrila a agosto de 1996

select OrderID, CustomerID,EmployeeID,OrderDate
from Orders 
where OderDate>= '1996-04-01' and OrderDate<='1996-08-31';

select OrderID, CustomerID,EmployeeID,OrderDate
from *Orders 
where OderDate between '1996-04-01' and '1996-08-31';

--seleccionar todas las ordenes entre 1996 y 1998
select *from Orders 
where  year(OrderDate) BETWEEN '1996' and '1998';

--seleccionar todas las ordenes de 1996 y 1999
select *from Orders
where year(OrderDate) in ('1996', '1999')

--seleccionar todos los productos que comiencen con c
select *from
Products 
where ProductName like 'c%';

--seleccionar todos los prodcutos que terminen con s
select *from
Products 
where ProductName like '%s';

--selecionar los productos que contengan la palabra no
select *from
Products 
where ProductName like '%no%';

--seleccionar los productos que contengan las letras a o n
select *from
Products 
where ProductName like '%A%'
or ProductName like '%N%'

--Seleccionar todos los productos que comiencen entre la letra A y N
select * from 
Products 
where ProductName like '[A N]%'

--seleccionar todas las ordenes que fuerin emitidas por los empleados 
--Nancy Davolio, Anne Dodsworth y Andrew Fuller (inner join)

select o.OrderID as 'Numero de Orden',
concat (FirstName, ' ', LastName ) as 'NombreEmpleado'
From
Employees as e
INNER JOIN 
orders as o 
on e.EmployeeID = o.EmployeeID;
where 'NombreEmpleado' in ('Nancy Davolio','Anne Dodsworth', 'Andrew Fuller')
















