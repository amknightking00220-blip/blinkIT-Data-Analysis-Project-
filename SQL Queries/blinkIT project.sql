select * from [dbo].[BlinkIT_Grocery_Data]

select count(*) from BlinkIT_Grocery_Data as new_data

update BlinkIT_Grocery_Data 
set Item_Fat_Content =
case
when Item_Fat_Content in ('LF','low fat') then 'Low Fat'
when Item_Fat_Content = 'reg' then 'Regular'
else Item_Fat_Content
end

select distinct (Item_Fat_Content) from BlinkIT_Grocery_Data


select cast(sum(Sales)/1000000 as decimal(10,2)) as Total_Sales_Millions
from BlinkIT_Grocery_Data


select cast(avg(Sales)as decimal(10,0)) as avg_Sale from BlinkIT_Grocery_Data


select count(*) as 'no._of_items'from BlinkIT_Grocery_Data 


select cast(avg(Rating) as decimal (10,2)) as avg_Rating from BlinkIT_Grocery_Data

-------------------------------------------------------------------------------------------------


select Item_Fat_Content,
                        cast(sum(Sales)/1000as decimal (10,2)) as total_sales_Thousands ,
                        cast(avg(Sales)as decimal (10,2)) as avg_sales,
                        count(*) as no_of_items,
                        cast(avg(Rating)as decimal (10,2)) as avg_Rating
                        from BlinkIT_Grocery_Data
                        where Outlet_Establishment_Year = 2022
group by Item_Fat_Content
order by total_sales_Thousands asc

--------------------------------------------------------------------------

select Item_Type,
                        cast(sum(Sales)/1000as decimal (10,2)) as total_sales_Thousands ,
                        cast(avg(Sales)as decimal (10,2)) as avg_sales,
                        count(*) as no_of_items,
                        cast(avg(Rating)as decimal (10,2)) as avg_Rating
                        from BlinkIT_Grocery_Data
                        where Outlet_Establishment_Year = 2022
group by Item_Type
order by total_sales_Thousands desc

----------------------------------------------------------------------
select Outlet_Location_Type , Item_Fat_Content,
                        cast(sum(Sales)/1000 as decimal (10,2)) as total_sales_Thousands 
                        from BlinkIT_Grocery_Data
group by Outlet_Location_Type ,Item_Fat_Content
order by total_sales_Thousands desc

----------------------------------------------------------------------------------

select Outlet_Location_Type,
isnull ([Low Fat],0) as Low_Fat,
isnull([Regular],0) as Regular
from
(
select Outlet_Location_Type , Item_Fat_Content,
                        cast(sum(Sales)/1000 as decimal (10,2)) as total_sales_Thousands 
                        from BlinkIT_Grocery_Data
group by Outlet_Location_Type ,Item_Fat_Content
) as sourceTable
Pivot
(
     sum(total_sales_Thousands )
     for Item_Fat_Content in ([Low Fat],[Regular])
) as pivotTable
order by Outlet_Location_Type

-------------------------------------------------------------

select Outlet_Establishment_Year,
cast(sum(Sales) as decimal (10,2)) as Total_Sales,
 cast(avg(Sales)as decimal (10,2)) as avg_sales,
    count(*) as no_of_items,
 cast(avg(Rating)as decimal (10,2)) as avg_Rating
from BlinkIT_Grocery_Data
group by Outlet_Establishment_Year
order by Outlet_Establishment_Year desc



---------------------------------------------------------------------------------
select Outlet_Size,round(sum(Sales)*100/sum(sum(Sales)) over(),2) as sales_perc
from BlinkIT_Grocery_Data
group by Outlet_Size

-----------------------------------------------------------------
select Outlet_Location_Type,
cast(sum(Sales) as decimal (10,2)) as Total_Sales,
 cast(avg(Sales)as decimal (10,2)) as avg_sales,
    count(*) as no_of_items,
 cast(avg(Rating)as decimal (10,2)) as avg_Rating
from BlinkIT_Grocery_Data
group by Outlet_Location_Type
order by Total_Sales desc

-----------------------------------------------------------------------
select Outlet_Type,
cast(sum(Sales) as decimal (10,2)) as Total_Sales,
 cast(avg(Sales)as decimal (10,2)) as avg_sales,
    count(*) as no_of_items,
 cast(avg(Rating)as decimal (10,2)) as avg_Rating
from BlinkIT_Grocery_Data
group by Outlet_Type
order by Total_Sales desc














































