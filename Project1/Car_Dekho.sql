create database project2;
use project2;

-- Retrive data--
select* from project2.car_dekho;

-- Retriving column name of the table--
SELECT column_name
FROM information_schema.columns
WHERE table_name = 'car_dekho' AND table_schema = 'project2';

-- Checking duplicates --
SELECT *
FROM project2.car_dekho
WHERE (engine, fuel, km_driven, max_power, mileage, Name, owner, seats, seller_type, selling_price)
IN (
    SELECT engine, fuel, km_driven, max_power, mileage, Name, owner, seats, seller_type, selling_price
    FROM project2.car_dekho
    GROUP BY engine, fuel, km_driven, max_power, mileage, Name, owner, seats, seller_type, selling_price
    HAVING COUNT(*) > 1
);

-- get total records--
select count(*) as Total_records from project2.car_dekho;

-- get car records in the year 2023--
select name from project2.car_dekho where year = 2023;

-- get car records in the year 2020 2021 2022--
select name, year from project2.car_dekho where year in (2020, 2021, 2022);

-- total records in each year--
select year, count(*) from project2.car_dekho group by year;

-- record of diesel car in the year 2023 --
select name from project2.car_dekho where fuel = "Diesel" and year = 2023;

-- record of petrol car in the year 2023 --
select name from project2.car_dekho where fuel = "Petrol" and year = 2023;

-- record of fuel car--
select name, fuel, year from project2.car_dekho;

-- car count group by year greater than 100 and lesser than 50 --

select year,count(*) from project2.car_dekho group by year having count(*) > 100;
select year,count(*) from project2.car_dekho group by year having count(*) < 50;

-- records of car between 2015 and 2023--
select * from project2.car_dekho where year between 2015 and 2023;

 -- details of max selling price car --
select * from project2.car_dekho 
where selling_price = (select max(selling_price) from project2.car_dekho);

 -- details of max max_power --
select * from project2.car_dekho 
where max_power = (select max(max_power) from project2.car_dekho);

 -- details of high milage car --
select * from project2.car_dekho 
where mileage = (select max(mileage) from project2.car_dekho);

