select 
    cd.customer_id,
    cd.name,
    md.item_name,
    sum(oid1.quantity * md.price) as total_by_product,
    sum(sum(oid1.quantity * md.price)) over(PARTITION BY cd.customer_id) as total_by_customer
from order_dim od
JOIN customers_dim cd on cd.customer_id = od.customer_id
JOIN order_item_dim oid1 on oid1.order_id = od.order_id
JOIN menu_dim md on md.item_id = oid1.item_id
GROUP BY
    cd.customer_id,
    cd.name,
    md.item_name
ORDER BY 
    total_by_customer DESC,
    total_by_product DESC
