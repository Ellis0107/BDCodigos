use NORTHWND

select ProductName, UnitPrice, UnitsInStock, 
Discontinued,
disponibilidad = CASE Discontinued
when 0 then 'No dispoinible'
when 1 then 'Disponible'
else 'No existente'
end 
from Products

select ProductName, UnitsInStock, UnitPrice, 
case UnitPrice 
when UnitPrice >=1 and UnitPrice <18 then 'Producto Barato'
when UnitPrice >=18 and UnitPrice <=50 then 'Producto Medio Barato'
when UnitPrice between 51 and 100 then 'Producto Caro' 
else 'Carisimo'
end as 'Categorias de precios'
from Products
where  ProductID in (29,38);

use AdventureWorks2019;

--select * from HumanResources.Employee
select BusinessEntityID, 
SalariedFlag
from HumanResources.Employee
order by 
case SalariedFlag
when 1 then BusinessEntityID
END DESC, 
case 
when SalariedFlag = 0 then BusinessEntityID
end asc;

SELECT BusinessEntityID,
	LastName,
	TerritoryName,
	CountryRegionName
From Sales.vSalesPerson
WHERE TerritoryName IS NOT NULL
ORDER BY
	CASE CountryRegionName
	WHEN 'United States' then TerritoryName
	else CountryRegionName
	END ASC;


--ISNULL
SELECT v.AccountNumber,
		v.Name,
		v.PurchasingWebServiceURL as 'PurchasingWebServiceURL'
FROM [Purchasing].[Vendor] as v;

--Cuando no son nulos

SELECT v.AccountNumber,
		v.Name,
        ISNULL (v.PurchasingWebServiceURL, 'eL VIERNES PASAMOS')
		as 'PurchasingWebServiceURL'
FROM [Purchasing].[Vendor] as v;

--CON CASE 
SELECT v.AccountNumber,
		v.Name,
		CASE 
		WHEN v.PurchasingWebServiceURL IS NULL THEN 'NO URL'
		END
		as 'PurchasingWebServiceURL'

FROM [Purchasing].[Vendor] as v;
--WHERE AccountNumber = 'WIDEWOR0001';



select iif (1=1, 'Verdadero';'Falso');