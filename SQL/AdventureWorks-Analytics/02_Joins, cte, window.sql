
-- Top selling subcategories
select apsl."SubcategoryName", sum(asd."OrderQuantity") as units_sold 
from adventureworks_product_subcategories_lookup apsl 
join adventureworks_product_lookup apl 
on apl."ProductSubcategoryKey"  = apsl."ProductSubcategoryKey" 
join adventureworks_sales_data asd 
on asd."ProductKey" = apl."ProductKey" 
group by 1
order by units_sold  desc
-- Tires and tubes is N1 subcategory by units sold
;

-- Category share of total sales
with revenue_tbl as (select apcl."CategoryName" , sum(asd."OrderQuantity") as units_sold, round(sum(asd."OrderQuantity" * apl."ProductPrice")::numeric, 1) as revenue
from adventureworks_product_subcategories_lookup apsl 
join adventureworks_product_lookup apl 
on apl."ProductSubcategoryKey"  = apsl."ProductSubcategoryKey" 
join adventureworks_sales_data asd 
on asd."ProductKey" = apl."ProductKey" 
join adventureworks_product_categories_lookup apcl on 
apcl."ProductCategoryKey" = apsl."ProductCategoryKey" 
group by 1),
totalsales_tbl as (
select r."CategoryName" , r.units_sold , r.revenue, sum(r.revenue) over () as total_sales 
from revenue_tbl r)
select "CategoryName" , units_sold, revenue, round(revenue*1.0/nullif(total_sales,0),2) as pct_of_total 
from totalsales_tbl 
order by revenue desc
-- Accesorries have higher unit_sales, but bikes have higher reveneue (95% of total revenue)
;

-- Country share of total sales
select 
	atl."Country" , 
	round (sum(asd."OrderQuantity" * apl."ProductPrice")::numeric,0) as revenue, 
	round((sum(asd."OrderQuantity" * apl."ProductPrice") / sum(sum(asd."OrderQuantity" * apl."ProductPrice")) over ())::numeric*100.0,2) as pct_of_total
from adventureworks_product_lookup apl 
join adventureworks_sales_data asd 
on asd."ProductKey" = apl."ProductKey" 
join adventureworks_territory_lookup atl 
on asd."TerritoryKey" = atl."SalesTerritoryKey" 
group by 1
order by revenue desc;
-- United States and Australia account for more than 60% of total revenue.
-- United Kingdom is a distant third with 11.65% revenue share.
;

--Profit by Category
select 
	apcl."CategoryName" , 
	sum(asd."OrderQuantity") as units_sold, 
	round(sum(asd."OrderQuantity" * apl."ProductPrice")::numeric, 1) as revenue,
	round(sum(asd."OrderQuantity" * apl."ProductCost")::numeric,1) as total_cost,
	round((sum(asd."OrderQuantity" * apl."ProductPrice") - sum(asd."OrderQuantity" * apl."ProductCost"))::numeric,1) as total_profit
from adventureworks_product_subcategories_lookup apsl 
join adventureworks_product_lookup apl 
on apl."ProductSubcategoryKey"  = apsl."ProductSubcategoryKey" 
join adventureworks_sales_data asd 
on asd."ProductKey" = apl."ProductKey" 
join adventureworks_product_categories_lookup apcl on 
apcl."ProductCategoryKey" = apsl."ProductCategoryKey" 
group by 1
order by total_profit desc
-- Bikes brough majority of Profits
;

--Profit Margin by Category
with profit_tbl as (
select 
	apcl."CategoryName" , 
	sum(asd."OrderQuantity") as units_sold, 
	round(sum(asd."OrderQuantity" * apl."ProductPrice")::numeric, 1) as revenue,
	round(sum(asd."OrderQuantity" * apl."ProductCost")::numeric,1) as total_cost,
	round((sum(asd."OrderQuantity" * apl."ProductPrice") - sum(asd."OrderQuantity" * apl."ProductCost"))::numeric,1) as total_profit
from adventureworks_product_subcategories_lookup apsl 
join adventureworks_product_lookup apl 
on apl."ProductSubcategoryKey"  = apsl."ProductSubcategoryKey" 
join adventureworks_sales_data asd 
on asd."ProductKey" = apl."ProductKey" 
join adventureworks_product_categories_lookup apcl on 
apcl."ProductCategoryKey" = apsl."ProductCategoryKey" 
group by 1
)
select 
	"CategoryName" , 
	units_sold , revenue , 
	total_cost , total_profit , 
	round((revenue - total_cost)*100.0 / revenue,2) as profit_margin_pct
from profit_tbl 
order by profit_tbl.total_profit desc
-- Highest profic marging from Accessories
;