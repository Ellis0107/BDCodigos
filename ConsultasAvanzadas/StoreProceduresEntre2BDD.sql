-- parametro de salida
create or alter procedure calcular_area
--parametro de entrada
@radio float,
--parametro de salida
@area float output
as
begin
	set @area = pi()*@radio *@radio
end

declare @resp float
exec calcular_area @radio= 22.3, @area= @resp output
print 'El área es: ' + cast(@resp as varchar)
go

use NORTHWND

create or alter procedure sp_obtenerdatosempleado
@numeroEmpleado int,
@fullname varchar(35) output
AS
begin
select @fullname =concat (FirstName, '', LastName)
from Employees
end;
go

declare @nombrecompleto nvarchar (35)
exec sp_obtenerdatosempleado @numeroEmpleado =10, @fullname = @nombrecomlpeto output
print @nombrecompleto

------------
create or alter procedure sp_obtenerdatosempleado
@numeroEmpleado int,
@fullname varchar(35) output
AS
begin
	declare @verificar int 
	set @verificar = (select count(*) from Employees where EmployeeID = @numeroEmpleado)

	if @verificar > 0 
	begin
	select @fullname=concat(FirstName, '' , LastName)

	from Employees 
	where EmployeeID = @numeroEmpleado;
	 
	if @fullname is null
	begin 
		print 'No existe el empleado'

end;
GO

declare @nombrecompleto nvarchar (35)
exec sp_obtenerdatosempleado @numeroEmpleado =10, @fullname = @nombrecomlpeto output
print @nombrecompleto


-------------------------------------------------

select * from Customers


create database etlempresa;
use etlempresa
create table cliente 
(
	clienteid int not null identity (1,1),
	clientebk nchar (5) not null,
	empresa nvarchar (40) not null,
	ciudad nvarchar (15) not null,
	region nvarchar (15) not null,
	pais nvarchar (15) not null,
	constraint pk_cliente
	primary key (clienteid)
)

select CustomerID, upper(CompanyName) AS 'Empresa', upper(city) AS 'Ciudad' , 
upper (isnull(nc.Region, 'SIN REGION')) AS Region, upper (country) as pais
from Northwnd.dbo.Customers as nc
left join etlempresa.dbo.cliente etle
on nc.CustomerID = etle.clientebk
where etle.clientebk is null;


select * from Northwnd.dbo.Customers AS nc
left join etlempresa.dbo.cliente etle
on  nc.CustomerID = etle.clientebk;

select * from NORTHWND.dbo.Customers
inner join etlempresa.dbo.cliente as cl
on c.CustomerID = cl