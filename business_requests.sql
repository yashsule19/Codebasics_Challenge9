USE retail_events_db;

-- Request 1:
-- Provide a list of products with a base price greater than 500 
-- and that are featured in promo type of 'BOGOF' (Buy One Get One Free).

SELECT DISTINCT product_name, base_price 
FROM dim_products AS p
JOIN fact_events AS e
ON p.product_code = e.product_code
WHERE base_price > 500 AND promo_type = 'BOGOF';

-- Request 2:
-- Generate a report that provides an overview of the number of stores in each city. 
-- The results will be sorted in descending order of store counts, allowing us to identify 
-- the cities with the highest store presence.
-- The report includes two essential fields: city and store count, which will assist in 
-- optimizing our retail operations.
SELECT DISTINCT city, COUNT(store_id) AS store_count
FROM dim_stores
GROUP BY city
ORDER BY store_count DESC;

-- Request 3:
-- Generate a report that displays each campaign along with the total revenue generated before 
-- and after the campaign? The report includes three key fields: campaign_name, totaI_revenue(before_promotion), 
-- totaI_revenue(after_promotion). 
-- This report should help in evaluating the financial impact of our promotional campaigns. 
-- (Display the values in millions)

WITH promo_price_adjusted_qty AS (
SELECT campaign_id,
	CASE 
		WHEN promo_type = '50% OFF' THEN base_price * 0.5
		WHEN promo_type = '25% OFF' THEN base_price * 0.25
        WHEN promo_type = '33% OFF' THEN base_price * 0.33
        WHEN promo_type = 'BOGOF' THEN base_price * 0.5
        ELSE base_price - 500 
	END AS promo_price,
    CASE 
        WHEN promo_type = 'BOGOF' THEN `quantity_sold(after_promo)` * 2
        ELSE `quantity_sold(after_promo)`
	END AS adjusted_qty,
    base_price * `quantity_sold(before_promo)` AS revenue_before
FROM fact_events
)

SELECT campaign_id, CONCAT(ROUND(SUM(revenue_before) / 1000000, 2), ' M') AS total_revenue_before_promotion, 
	   CONCAT(ROUND(SUM(promo_price * adjusted_qty) / 1000000, 2), ' M') AS total_revenue_after_promotion 
FROM promo_price_adjusted_qty
GROUP BY campaign_id
ORDER BY campaign_id;

-- Request 4:
-- Produce a report that calculates the Incremental Sold Quantity (ISQ%) for each category 
-- during the Diwali campaign. Additionally, provide rankings for the categories based on their ISQ%. 
-- The report will include three key fields: category, isq%, and rank order. 
-- This information will assist in assessing the category-wise success and impact of the Diwali campaign 
-- on incremental sales.

WITH adjusted_qty_table AS(
SELECT category, SUM(`quantity_sold(before_promo)`) AS qty_before,
	SUM(CASE
		WHEN promo_type = 'BOGOF' THEN `quantity_sold(after_promo)` * 2
        ELSE `quantity_sold(after_promo)`
	END) AS qty_after
FROM fact_events AS e
JOIN dim_products AS p
ON e.product_code = p.product_code
WHERE campaign_id = 'CAMP_DIW_01'
GROUP BY category
)

SELECT category, 
	   CONCAT(ROUND(((qty_after - qty_before) / qty_before)*100, 2), ' %') AS ISU,
       RANK() OVER(ORDER BY ROUND(((qty_after - qty_before) / qty_before)*100, 2) DESC) AS rank_order
FROM adjusted_qty_table;

-- Request 5:
-- Create a report featuring the Top 5 products, ranked by Incremental Revenue Percentage (IR%), 
-- across all campaigns. The report will provide essential information including product name, category, and ir%. 
-- This analysis helps identify the most successful products in terms of incremental revenue across 
-- our campaigns, assisting in product optimization.

WITH promo_price_adjusted_qty AS (
SELECT product_code,
	CASE 
		WHEN promo_type = '50% OFF' THEN base_price * 0.5
		WHEN promo_type = '25% OFF' THEN base_price * 0.25
        WHEN promo_type = '33% OFF' THEN base_price * 0.33
        WHEN promo_type = 'BOGOF' THEN base_price * 0.5
        ELSE base_price - 500 
	END AS promo_price,
    CASE 
        WHEN promo_type = 'BOGOF' THEN `quantity_sold(after_promo)` * 2
        ELSE `quantity_sold(after_promo)`
	END AS adjusted_qty,
    base_price * `quantity_sold(before_promo)` AS revenue_before
FROM fact_events
),
revenue AS(
SELECT product_code, CONCAT(ROUND(SUM(revenue_before) / 1000000, 2), ' M') AS total_revenue_before_promotion, 
	   CONCAT(ROUND(SUM(promo_price * adjusted_qty) / 1000000, 2), ' M') AS total_revenue_after_promotion 
FROM promo_price_adjusted_qty
GROUP BY product_code
ORDER BY product_code
)


SELECT product_name, category, 
	   CONCAT(ROUND(((total_revenue_after_promotion - total_revenue_before_promotion) / total_revenue_before_promotion)*100, 2), ' %') AS IR
FROM revenue AS r
JOIN dim_products AS p
ON r.product_code = p.product_code
ORDER BY IR DESC
LIMIT 5;