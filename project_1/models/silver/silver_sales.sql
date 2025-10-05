SELECT order_id,customer_id,product_id,quantity,unit_price,
      {{ multiply('quantity','unit_price') }} as gross_sales,timestamp FROM {{ ref("bronze_sales") }}
  WHERE order_id IS NOT NULL
  AND customer_id IS NOT NULL
  AND product_id IS NOT NULL


