SELECT c.city as CITY,
             ROUND(SUM(s.gross_sales),2) AS TOTAL_SALES
        FROM 
           {{ ref("silver_customer") }} as c INNER JOIN
                        {{ ref("silver_sales") }} as s ON
            s.customer_id = c.customer_id        
    GROUP BY c.city
ORDER BY TOTAL_SALES  DESC            