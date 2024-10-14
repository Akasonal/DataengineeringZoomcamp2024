Select o.order_id as order_id,
       c.customer_id as customer_id,
       c.customer_name as customer_name,
       p.product_id as Product_id,
       p.product_name as product_name,
       o.quantity as Quantity,
       o.order_date as Order_date
from raw.orders as o
Inner Join {{ref("stg_customers")}} as c on o.customer_id=c.customer_id
inner Join raw.Products as p on o.product_id=p.product_id