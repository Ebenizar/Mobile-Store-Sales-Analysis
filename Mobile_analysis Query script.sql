USE Mobile_analysis;

Select *
	From mobile;

-- Check mobile phone and pricelist--
Select
	phone_name,
    Price
From mobile;

-- find out the price of five most expensive phones--
Select
	phone_name,
    Price
From mobile
Order by Price desc
Limit 5;

-- find out the five most cheapest phones--
Select
	phone_name,
    brands,
    Price
From mobile
Order by Price asc
limit 5;

-- list top five samsung phones with price and features--
Select
	*
From mobile
Where brands = "samsung"
Order by Price desc
limit 5;

-- Five most expensive andriod phones that were sold--

Select * 
    From mobile
Where operating_system_type ="android"
order by price desc
Limit 5;

-- Five least expensive andriod phones that were sold--
Select * 
    From mobile
Where operating_system_type ="android"
order by price asc
Limit 5;

-- Five most expensive IOS phones that were sold--
Select * 
    From mobile
Where operating_system_type ="ios"
order by price desc
Limit 5;

-- Five least expensive IOS phones that were sold--

-- List the top five phones that support 5G network
Select
	*
    from mobile
    where 5g_availability ="yes"
    order by price desc
    limit 5;
    
    -- Total price of all phones sold--
    Select 
		SUM(price) As Total_Price
        From mobile;
        
-- Total price of all phones sold per brand name--
select
	brands, 
    Sum(price) AS sum_prices
    from Mobile
    group by brands
    order by sum_prices desc;

-- Total quantity of phones sold--
Select 
	SUM(Total_mobile)
    From Mobile;
    
-- Total quantity phones sold per brand name--
Select 
    Brands,
    SUM(Total_mobile) AS Total_quantity_sold
    From Mobile
    group by brands
    order by Sum(total_mobile) desc;

-- Top 10 phones with the highest battery capacity--
Select
	Phone_name,
    Brands,
    Battery_capacity
    From mobile
    order by price
    limit 10;
    
    -- top 10 brands with the highest battery capacity which have android operating system---
select 
	brands,
    Operating_System_Type,
    battery_capacity
    from mobile
    where (NOT battery_capacity = "NOT SPECIFIED") and operating_system_type = "android"
	order by battery_capacity desc
    LIMIT 10;

-- top 10 brands with the highest battery capacity and their internal and ram storage---
select
	brands,
    battery_capacity,
    internal_storage,
    ram_storage
    from mobile
    where not battery_capacity = "not specified" and not ram_storage = "not specified"
    order by battery_capacity desc
    limit 10;
    
    -- Top 10 Countries with the highest sales of phones--
    
    Select
        country_of_origin,
        Sum(Total_mobile)
	From mobile
    where not country_of_Origin = "not specified"
    group by country_of_origin
    limit 10;

-- The total no of brands sold --

Select
	count(distinct Brands) As Total_Brands_Sold
From Mobile;
	
