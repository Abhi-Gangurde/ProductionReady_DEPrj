--create streaming table 

CREATE OR REFRESH STREAMING TABLE st_orders
AS 
SELECT * FROM STREAM(samples.tpch.orders)

--create mv 

CREATE OR REPLACE MATERIALIZED VIEW mv_orders
AS 
SELECT 
    count(o_orderkey) as cnt_orders,
    o_orderstatus
FROM LIVE.st_orders
GROUP BY o_orderstatus