{{ config(materialized='incremental') }}

WITH orders AS (
    SELECT order_id,
           customer_id,
           product_id,
           order_date
    FROM raw.orders
    {% if is_incremental() %}
    WHERE order_date > (
        SELECT MAX(order_date)
        FROM {{ this }}
        WHERE source_table = 'raw.orders'
    )
    {% endif %}
)

SELECT *
FROM orders
