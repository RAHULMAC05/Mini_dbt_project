{% set min_year = 2025 %}

SELECT *
       FROM {{ ref("bronze_customer")}}
    WHERE YEAR(updated_at) >= {{ min_year }}