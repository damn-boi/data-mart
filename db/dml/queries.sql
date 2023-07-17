WITH
all_shop_sales AS (
		SELECT shop_id, date, product_id, sales_cnt
		FROM shop_dns
		UNION SELECT shop_id, date, product_id, sales_cnt
			FROM shop_mvideo
		UNION SELECT shop_id, date, product_id, sales_cnt
			FROM shop_sitilink
),
shop_sales AS (
        SELECT shop_name, shop_id, 
        date_part('month', date) AS month, product_id, 
        sum(sales_cnt) sales
        FROM all_shop_sales ss
        INNER JOIN shops USING (shop_id)
        GROUP BY shop_name, product_id, shop_id, month
)
SELECT
    ss.shop_name,
    pr.product_name,
	ss.sales AS sales_fact,
	pl.plan_cnt AS sales_plan,
	ss.sales / pl.plan_cnt AS sales_ratio,
	ss.sales * pr.price AS income_fact,
    pl.plan_cnt * pr.price AS income_plan,
    ss.sales * pr.price / (pl.plan_cnt * pr.price) AS income_ratio
FROM
	shop_sales AS ss
	JOIN plan AS pl ON ss.shop_id = pl.shop_id AND ss.product_id = pl.product_id
	JOIN products AS pr ON ss.product_id = pr.product_id;
