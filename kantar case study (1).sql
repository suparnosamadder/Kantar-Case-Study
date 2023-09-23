use records_matching;
alter table data1 rename column `order ID` to OrderID;
alter table data1 rename column `Product ID` to ProductID;

--  How to identify the Records (Order ID + Product ID combination) present in data1 but 
-- missing in data2 (Specify the number of records missing in your answer)
select count(*)
from data1 d1 left join data2 d2
on d1.orderID = d2.orderID and d1.productId = d2.productID
where d2.orderID is NULL and d2.productID IS NULL;
-- How to identify the Records (Order ID + Product ID 
-- combination) missing in data1 but present in data2 
-- (Specify the number of records missing in your answer)
select count(*)
from data2 d2 right join data1 d1
on d1.orderID = d2.orderID and d1.productId = d2.productID
where d1.orderID is NULL and d1.productID IS NULL;
-- Find the Sum of the total Qty of Records 
-- missing in data1 but present in data2*/
select sum(d2.qty) as TotalQtyInData2ButMissingInData1
from data2 d2 left join data1 d1
on d1.orderID = d2.orderID and d1.productId = d2.productID
where d1.orderID is NULL and d1.productID IS NULL;
-- Find the total number of unique records 
-- (Order ID + Product ID combination) present in 
-- the combined dataset of data1 and data2*/
select count(*)
from (
	select orderID, ProductID
	from data1 
	union
	select orderID, ProductID
	from data2)as temptable ; 
