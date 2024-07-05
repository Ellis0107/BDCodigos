create database pruebajoinsg1;
use pruebajoinsg1;

create table proveedor(
provid int not null identity(1,1),
nombre varchar(50) not null,
limite_credito money not null
constraint pk_proveedor
primary key (provid),
constraint unico_nombrepro
unique(nombre)
);

create table productos (
productid int not null identity(1,1),
nombre varchar(50) not null,
precio money not null,
existencia int not null,
proveedor int ,
constraint pk_producto
primary key(productid),
constraint unico_nombre_proveedor
unique (nombre),
constraint fk_proveedor_producto
foreign key (proveedor)
references proveedor(provid)
)

--agregar registros a las tablas proveedor y producto

insert into proveedor (nombre, limite_credito)
values ('Proveedor1', 5000),
 ('Proveedor2', 6778),
 ('Proveedor3', 6778),
 ('Proveedor4', 5677),
 ('Proveedor5', 6666);

select * from proveedor;

insert into productos (nombre, precio, existencia, proveedor)
values
('Producto1', 56, 34, 1),
('Producto2', 56.56, 12, 1),
('Producto3', 46.6, 33, 2),
('Producto4', 22.34, 666, 3);

select * from productos;

select * from 
proveedor as 

select s.CompanyName as 'Proveedor', sum(od.UnitPrice * od.Quantity) as 'Total de Ventas $'
from Suppliers as s
INNER JOIN products as p
on s.SupplierID = p.SupplierID
INNER JOIN [Order Details] as od
on od.ProductID = p.ProductID
INNER JOIN Orders AS o
on o.OrderID = od.OrderID
where o.OrderDate between '1996-09-01' and '1996-12-31'
group by s.CompanyName
order by 'Total de Ventas $' desc

select * from 
categories as c 
inner joins products as p 
on c.categories


--left join

select * from
proveedor as p 
left join productos as pr
on pr.proveedor = p.provid