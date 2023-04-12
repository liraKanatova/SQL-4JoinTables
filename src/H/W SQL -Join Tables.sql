--1 Бардык клиенттердин шаарлары уникалдуу чыксын
SELECT distinct City FROM Customers;

--2 Туулган жылы 1950 жана 1960 - жылдардын арасындагы ишкерлер чыксын
SELECT * FROM [Employees] where BirthDate between '1952-02-19' and '1960-05-29';

--3 Франциялык поставщиктердин аттары жана мамлекети чыксын
SELECT SupplierName,Country  FROM [Suppliers] where Country='France';

--4 Олкосу Испаниядан башка, аты “A” дан башталган клиенттердин аты, адресси жана олкосу чыксын
SELECT CustomerName,Address,Country FROM [Customers] where Country not in('Spain') and customername like 'A%';

--5 PostalCode бош болгон клиенттер чыксын
SELECT * FROM [Customers] where PostalCode='';

--6 Лондондон болгон клиенттердин биринчи эки клиентин чыгаргыла
SELECT * FROM [Customers] where City='London' limit 2 ;

--7 Фамилиясы 4 тамгадан турган ишкерлердин аты жана туулган жылдары чыксын
SELECT FirstName,LastName,BirthDate FROM [Employees] where LastName like '____';

--8 Ар бир олкодо канчадан поставщик бар экенин чыгаргыла
SELECT Country, count(Country) FROM [Suppliers] group by Country order by Country;

--9 Поставщиктердин саны 1 эле болгон олколорду аты менен сорттоп чыгаргыла
SELECT SupplierName, Country,count(Country) FROM [Suppliers] group by Country having count(Country)=1 order by SupplierName;

--10 Ар бир категориядагы продуктылардын жалпы суммасын чыгаргыла
SELECT Categories.CategoryName,sum(Price)as Total_Price FROM [Products]
 join Categories  on Products.CategoryID=Categories.CategoryID group by Categories.CategoryName;

--11 6 жана 8 категориясындагы продуктылардын эн арзан баасын жана атын чыгаргыла
SELECT 	Categories.CategoryName,min(Price) FROM [Products] join Categories on Products.CategoryID=Categories.CategoryID
where Categories.CategoryID in (6,8);

--12 Продуктылар жана алардын поставщиктеринин аттары чыксын(сортировка болсун)
SELECT ProductName, Suppliers.SupplierName FROM [Products]
join Suppliers on Products.SupplierID=Suppliers.SupplierID order by Suppliers.SupplierName;

--13 Ар бир поставщиктин канчадан продуктысы бар экени кемуу тартибинде сорттолуп чыксын
SELECT  Suppliers.SupplierName,count(Products.ProductId) FROM [Products]
join Suppliers on Products.SupplierID=Suppliers.SupplierID group by Suppliers.SupplierName order by Products.ProductID desc;


--14 Клиенттердин аты CustomerName деп, ага саткан ишкерлердин аты
-- жана алар кандай служба доставки колдонгону тууралуу маалымат чыксын
SELECT Customers.CustomerName,Employees.FirstName,Shippers.ShipperName FROM [Orders]
    join Customers on Orders.CustomerID=Customers.CustomerID
    join Employees on Orders.EmployeeId=Employees.EmployeeId
    join Shippers on Orders.ShipperID=Shippers.ShipperID;

--15 Кайсы ишкер канча клиент обслуживайтеткен чыксын
SELECT Employees.FirstName,count(Customers.CustomerID) FROM [Orders]
join Employees on Orders.EmployeeID=Employees.EmployeeID
join Customers on  Orders.CustomerID=Customers.CustomerID group by Employees.FirstName;