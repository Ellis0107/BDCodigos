--Trigers---------------
--CREATE Nombre.trigger
--on Tabla
--After [insert], [delete],[update]
--AS
--Begin
--.....
--End

CREATE DATABASE PruebatriggersG1;
go
use PruebatriggersG1 



create table Empleado(
idempleado int not null identity(1,1) primary key,
nombreEmpleado varchar (30) not null,
apellido1 varchar (15) not null,
apellido2 varchar(15),
salario money not null
);
go
Create or alter trigger tg_1
on Empleado
after insert 
as 
begin 
	PRINT 'Se ejecuto el trigger tg_1 en el evento insert'
end;
go

select * from Empleado

insert into Empleado
values ('Elliot', 'Tapia', 'Crisostomo', 85000)

drop trigger tg_1;
go

create or alter trigger tg_2
on Empleado
after insert 
as 
begin 
	select * from inserted;
	select * from deleted;

end ;
go 
insert into Empleado
values ('Elliot', 'Tapia', 'Crisostomo', 86000)
go

create or alter trigger tg_3
on Empleado
after delete
as 
begin 
	select * from inserted;
	select * from deleted;

end ;
go 

delete Empleado
where idempleado = 2;
go


create or alter trigger tg_4
on Empleado
after update
as 
begin 
	select * from inserted;
	select * from deleted;

end ;
go 

select * from Empleado;

update Empleado
set nombreEmpleado = 'Ellis',
	salario = 90000
where idempleado = 1;
go


create or alter trigger tg_4
on Empleado
after insert,delete
as 
begin 
	if exists (select 1 from inserted)
	begin
		print 'Se realizo un insert'
	end
	else if exists (select 1 from deleted) and 
	not exists (select 1 from inserted)
	begin 
	print 'Se realizo un delete '
	end
end ;
go 

insert into Empleado
values ('Silvano','Peña','Hernandez',100000)

delete from Empleado
where idempleado = 2

