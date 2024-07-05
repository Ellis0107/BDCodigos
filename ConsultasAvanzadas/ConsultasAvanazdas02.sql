--Funciones de agregado y agrupacion
--Utilizar base de datos 
--Use northwind
--Funciones de agragado
--Seleccionar total de ordenes de compra

--count(*)

select count (*) as 'numero de ordenes' from orders;

select from* Customers  

--Seleccionar el total de las cantidades de los productos pedidos
select sum(unitprice) from [order details]

--Seleciconar el total de dinero que he vedido
select sum(Quantity * unitprice) as total
from [order Details]; as od
INNER JOIN products as p
on od.productid = p.productid
qhere p.productName = 'Aniseed Syrup'

select avg(Quantity * od.unitprice) as total
from [order Details]; as od
INNER JOIN products as p
on od.productid = p.productid
qhere p.productName = 'Aniseed Syrup'

--Seleccionar el numero de producctos por categoria
select count(*) as 'numero de productos'
from products

select categoryid, count(*) as 'total de pruductos'
from products 
group by categoryid;


--selecionar el numero de productos por orden de categoria
select categoryid, count(*) as 'numero de productos'
from productos

--SELECCIONAR	el numero de productos con por el nombre d ela categoria
select c.categoryname, count(productid)
from categorias as c 
inner join products as p 
on c.categoryid = p.categoryid
group by c.categoryid


--Ejercicio 11. Seleccionar l total de ordenes hechas por cada uno de los proveedores 

select s.CompanyName as 'Proveedor', count(*)
from suppliers as s 
inner join Products as p
on s.supplierID = p.supplierID
inner join [Order Details] as od 
on od.ProductID = p.ProductID
group by s.CompanyName


--Ejercicio 12. Seleccionar el total de dinero que ha vendido por proveedor del primer trimestre de 1996
select s.CompanyName as 'Proveedor', sum(od.UnitPrice* odQuantity) as 'Total de Vetas $'
from suppliers as s 
inner join products as p
on s.SupplierID = p.SupplierID
inner join [Order Details] as od
on od.ProductID = p.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
--El where siempre va despues del from
where o.OrderDate between '1996-09-01' and '1996-12-31'
group by s.CompanyName
order by 'Total de Ventas $' desc
--Ejercicio 13. seleccionar el total de dinero vendido por categoria
select c.Categoryname,
(od.Quantity * od.UnitPrice) as 'Total de ventas'
from [Order Details] as od
inner join Products as p
on od.ProductId = p.ProductID
inner join categories as c
on c.CategoryID = p.CategoryID
group by c.categoryname
order by 2 desc;

