SELECT *
       FROM {{ source('raw_source','raw_customers_delta')}}