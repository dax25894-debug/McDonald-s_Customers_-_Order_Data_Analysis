SELECT 
    od.customer_id,
    cd.name,
    sum(md.price * oid1.quantity) as total

FROM
    order_dim od
join order_item_dim oid1 on oid1.order_id = od.order_id
join menu_dim md on md.item_id = oid1.item_id
join customers_dim cd on cd.customer_id = od.customer_id
GROUP BY
    od.customer_id,
    cd.name
ORDER BY
    total DESC