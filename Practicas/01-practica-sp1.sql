--Crear un sp que solicite un id de una categor�a 
-- y devuelva el promedio de los precios de sus productos

use NORTHWND
go

create or alter proc sp_solicitar_promedio_prod
@catego int --parametro de entrada
AS
begin
select avg(UnitPrice) as 'Promedio precios de los productos'
from Products
where CategoryID =  @catego;
end 
go
select * from Products

exec sp_solicitar_promedio_prod 2
exec sp_solicitar_promedio_prod @catego = 5
exec sp_solicitar_promedio_prod 2
