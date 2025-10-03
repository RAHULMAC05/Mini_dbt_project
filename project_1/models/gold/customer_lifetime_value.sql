SELECT c.customer_id,c.name,ROUND(SUM(s.gross_sales)) as TOTAL_VALUES
                     FROM {{ ref("silver_customer")}} as c  
                INNER JOIN {{ ref("silver_sales")}} as s
            ON s.customer_id = c.customer_id
        GROUP BY c.customer_id,c.name
    ORDER BY TOTAL_VALUES DESC