{{
  config(
    materialized = 'incremental',
    unique_key = 'customer_id'
    )
}}

{% set min_year = 2025 %}

SELECT *
       FROM {{ ref("bronze_customer")}}
    WHERE YEAR(updated_at) >= {{ min_year }}
    {% if is_incremental() %}
           AND updated_at > SELECT MAX(updated_at) FROM {{ this }}
    {% endif %}