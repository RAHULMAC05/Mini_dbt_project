{% set col_name = ('Electronics','Clothing','Books','Sports','Home') %}

SELECT *
FROM {{ ref("bronze_products") }}
WHERE category IN {{ col_name }}
