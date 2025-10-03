SELECT * 
      FROM {{ source('raw_source','raw_sales_delta')}}