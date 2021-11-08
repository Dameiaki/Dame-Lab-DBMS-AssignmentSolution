create schema E_com;
use E_com;

create table Supplier(SUPP_ID int ,SUPP_NAME varchar(50),SUPP_CITY varchar(50),SUPP_PHONE bigint);
create table Customer(CUS__ID int auto_increment primary key,CUS_NAME varchar(250),CUS_PHONE bigint,CUS_CITY varchar(50),CUS_GENDER varchar(1));
create table Category(CAT_ID  int primary key,CAT_NAME varchar(250));
create table Product(PRO_ID int primary key,PRO_NAME varchar(50) ,PRO_DESC varchar(50),CAT_ID int,foreign key(CAT_ID)references Category(CAT_ID));
create table ProductDetails(PROD_ID int primary key,PRO_ID int,SUPP_ID int,PRICE int,foreign key(PRO_ID)references Product(PRO_ID),foreign key(SUPP_ID)references Supplier(SUPP_ID));


create table Orders(ORD_ID int primary key,ORD_AMOUNT int,DATE date,CUS__ID int,PROD_ID int,foreign key(CUS__ID)references Customer(CUS__ID),foreign key(PROD_ID)references ProductDetails(PROD_ID));
create table Rating(RAT_ID int primary key,CUS__ID int,SUPP_ID int,RAT_RATSTARS int,foreign key(CUS__ID)references Customer(CUS__ID),foreign key(SUPP_ID)references Supplier(SUPP_ID));

insert into Supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(1,'Rajesh Retails', 'Delhi', 1234567890);
insert into Supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(2, 'Appario Ltd.', 'Mumbai', 2589631470);
insert into Supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(3, 'Knome products', 'Banglore', 9785462315);
insert into Supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(4, 'Bansal Retails', 'Kochi', 8975463285);
insert into Supplier (SUPP_ID,SUPP_NAME,SUPP_CITY,SUPP_PHONE) values(5, 'Mittal Ltd.','Lucknow', 7898456532);

insert into Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values(1, 'AAKASH', 9999999999, 'DELHI','M');
insert into Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values(2, 'AMAN', 9785463215,'NOIDA','M');
insert into Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values(3 ,'NEHA', 9999999999, 'MUMBAI', 'F');
insert into Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values(4, 'MEGHA', 9994562399, 'KOLKATA', 'F');
insert into Customer(CUS__ID,CUS_NAME,CUS_PHONE,CUS_CITY,CUS_GENDER) values(5, 'PULKIT', 7895999999, 'LUCKNOW', 'M');

insert into Category(CAT_ID,CAT_NAME) values(1 ,'BOOKS');
insert into Category(CAT_ID,CAT_NAME) values(2 ,'GAMES');
insert into Category(CAT_ID,CAT_NAME) values(3, 'GROCERIES');
insert into Category(CAT_ID,CAT_NAME) values(4 ,'ELECTRONICS');
insert into Category(CAT_ID,CAT_NAME) values(5 ,'CLOTHES');

insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values(1 ,'GTA V', 'DFJDJFDJFDJFDJFJF', 2);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values(2,'TSHIRT', 'DFDFJDFJDKFD',5);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values(3, 'ROG LAPTOP', 'DFNTTNTNTERND', 4);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values(4 ,'OATS','REURENTBTOTH', 3);
insert into Product(PRO_ID,PRO_NAME,PRO_DESC,CAT_ID) values(5,'HARRY POTTER', 'NBEMCTHTJTH', 1);

insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE) values(1 ,1 ,2 ,1500);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE) values(2, 3, 5, 30000);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE) values(3 ,5, 1, 3000);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE) values(4, 2 ,3, 2500);
insert into ProductDetails(PROD_ID,PRO_ID,SUPP_ID,PRICE) values(5, 4, 1 ,1000);

insert into Orders(ORD_ID,ORD_AMOUNT,DATE,CUS__ID,PROD_ID) values(20, 1500, '2021-10-12', 3, 5);
insert into Orders(ORD_ID,ORD_AMOUNT,DATE,CUS__ID,PROD_ID) values(25 ,30500 ,'2021-09-16', 5 ,2);
insert into Orders(ORD_ID,ORD_AMOUNT,DATE,CUS__ID,PROD_ID) values(26, 2000, '2021-10-05', 1 ,1);
insert into Orders(ORD_ID,ORD_AMOUNT,DATE,CUS__ID,PROD_ID) values(30, 3500, '2021-08-16', 4 ,3);
insert into Orders(ORD_ID,ORD_AMOUNT,DATE,CUS__ID,PROD_ID) values(50, 2000, '2021-10-06', 2, 1);

insert into Rating(RAT_ID,CUS__ID,SUPP_ID,RAT_RATSTARS) values(1 ,2, 2 ,4);
insert into Rating(RAT_ID,CUS__ID,SUPP_ID,RAT_RATSTARS) values(2 ,3, 4 ,3);
insert into Rating(RAT_ID,CUS__ID,SUPP_ID,RAT_RATSTARS) values(3 ,5, 1 ,5);
insert into Rating(RAT_ID,CUS__ID,SUPP_ID,RAT_RATSTARS) values(4 ,1, 3 ,2);
insert into Rating(RAT_ID,CUS__ID,SUPP_ID,RAT_RATSTARS) values(5 ,4, 5 ,4);

/* Display the number of the customer group by their genders who have placed any order 
of amount greater than or equal to Rs.3000. */

select cg.cus_gender, COUNT(cus_gender) from (select cus_gender from customer c inner join `orders` o on o.CUS__ID=c.CUS__ID where o.ORD_AMOUNT>=3000) as cg group by cus_gender;

/*Display all the orders along with the product name ordered by a customer having 
Customer_Id=2.*/

select o.ORD_ID, o.ORD_AMOUNT, o.DATE,p.PRO_ID, p.PRO_NAME  from orders o inner JOIN product p on p.PRO_ID= o.PROD_ID where o.CUS__ID=2;

/* Display the Supplier details who can supply more than one product.*/
select * from supplier where SUPP_ID in (select supp_id from productdetails group by supp_id Having count(Prod_id)>1);


/* Find the category of the product whose order amount is minimum.*/
select MIN(ORD_Amount) from orders;
select * from orders where ORD_Amount = (select MIN(ORD_Amount) from orders);

select c.CAT_NAME from product p inner join category c on c.CAT_ID= p.CAT_ID where p.PRO_ID in (select PROD_ID from orders where ORD_AMOUNT = (select MIN(ORD_AMOUNT) from orders));

/*  Display the Id and Name of the Product ordered after “2021-10-05”. */


select PROD_ID, PRO_NAME from product p inner join orders o on o.PROD_ID = p.PRO_ID where o.DATE > '2021-10-05'; 

/* Print the top 3 supplier name and id and their rating on the basis of their rating along 
with the customer name who has given the rating. */

select supplier.supp_id,supplier.supp_name, customer.cus_name,rating.rat_ratstars from rating inner join supplier on 
rating.SUPP_ID = supplier.supp_id inner join customer on rating.cus__id=customer.cus__id order by rating.RAT_RATSTARS desc limit 3;

/*Display customer name and gender whose names start or end with character 'A'.*/
select * from customer where CUS_NAME like 'A%' or CUS_NAME like 'A%';

/* Male Customers */
select sum(ord_amount) from orders o inner join customer c on c.cus__id =o.cus__id and c.cus_gender='M';

 /*Display all the Customers left outer join with the orders.*/
 select * from Customer left outer join orders on Customer.Cus__ID = orders.Cus__ID;
 
/*Create a stored procedure to display the Rating for a Supplier if any along with the 
Verdict on that rating if any like if rating >4 then “Genuine Supplier” if rating >2 “Average 
Supplier” else “Supplier should not be considered”*/
call procratings();

