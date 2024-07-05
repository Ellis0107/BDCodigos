use NORTHWND
--Store procedures 

Create procedure sp_prueba_g1
AS 
begin
	print 'Hola mundo';
end 

--Ejecutar store procedure 
exec sp_prueba_g1

--Declaracion de variables
Declare @n int 
Declare @i int 

set @n =5
set @i =1

print ('el valor de n es :' + cast (@n as varchar))
print ('el valor de i es :' + cast (@i as varchar))




create database prueba_sp;
use prueba_sp;


create procedure sp_1
AS 
begin

Declare @n int 
Declare @i int 

set @n =5
set @i =1

print ('el valor de n es :' + cast (@n as varchar))
print ('el valor de i es :' + cast (@i as varchar))

end

--Ejecutar 10 veces sp_1 solamente si el sentinela es 1 

Declare @n as int = 10, @i as int =1

while @i<=@n
begin
	print(@i);
     set @i+=1    --set @i = @i + 1
end

execute sp_1

--Convertir el while en sp
create procedure sp_2
AS 
begin

Declare @n int 
Declare @i int 

set @n =10
set @i =1

while @i<=@n
begin
	print(@i);
     set @i+=1    --set @i = @i + 1
end
end

execute sp_2


--Store procedure con parametros de entrada
create proc sp_3
@n int --parametro de entrada
AS 
begin
Declare @i int = 1

IF @n>=0
begin
	while @i<= @n 
	begin 
		print (@i);
		set @i+=1 --set @i = @i+1
	end
end 
else 
begin 
	print 'El valor de n debe ser mayor a 0'
end 
end 

execute sp_3 10
execute sp_3 @n=20

--Store procedure que solamente regrese la suma de i
--
create proc sp_4
@n int --parametro de entrada
AS 
begin
Declare @i int = 1
Declare @acum int = 0

IF @n>=0
begin
	while @i<= @n 
	begin 
	  set @acum+=@i
	  set @i+=1 
	end
  print ('La suma de los numeros es :' + cast(@acum as varchar))
end 
else 
begin 
	print 'El valor de n debe ser mayor a 0'
end 
end 

drop proc sp_4
execute sp_4 3
execute sp_4 @n=20

--seleccionar de la base de datos NORTHWIND todas las ordenes de compra para un año determinado
use NORTHWND

create proc Proc_ordenes_anio
AS 
begin
Print (
select OrderDate from Orders
where OrderDate >= '1998-01-01')
End

--Crear un sp que muestre el total de ventas (dinero) para cada cliente por año
--por un rango de años 

Use NORTHWND
select [Order Details] from 

