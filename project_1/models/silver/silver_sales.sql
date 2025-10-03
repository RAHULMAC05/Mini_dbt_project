SELECT order_id,customer_id,product_id,quantity,unit_price,
      {{ multiply('quantity','unit_price') }} as gross_sales,timestamp FROM {{ ref("bronze_sales") }}

