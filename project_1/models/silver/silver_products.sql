 {{
  config(
    materialized = 'incremental',
    unique_key = 'product_id',
    on_schema_change = 'fail'
    )
}}

{% set col_name = ('Electronics','Clothing','Books','Sports','Home') %}
with cte as (
SELECT *
FROM {{ ref("bronze_products") }}
WHERE category IN {{ col_name }}
)

SELECT * FROM 
      cte
   {% if is_incremental() %}
        WHERE updated_at > SELECT MAX(updated_at) FROM {{ this }}
   {% endif %}