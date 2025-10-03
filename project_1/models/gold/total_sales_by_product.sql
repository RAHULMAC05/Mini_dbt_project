SELECT p.name as PRODUCT_NAME,
                    ROUND(SUM(s.gross_sales),2) as TOTAL_SALES
                FROM {{ ref("silver_products") }} as p 
            INNER JOIN   {{  ref('silver_sales') }} as s
         ON p.product_id = s.product_id
    GROUP BY p.name
ORDER BY TOTAL_SALES DESC