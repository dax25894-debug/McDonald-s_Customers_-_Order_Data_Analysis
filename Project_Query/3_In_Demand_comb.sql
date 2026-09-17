SELECT 
    --oid1.item_id AS item_1,
    md1.item_name as product_1,
    --oid2.item_id as item_2,
    md2.item_name as product_2,
    count(*) as total_time_bougt
from 
    order_item_dim oid1
join order_item_dim oid2 on oid1.order_id = oid2.order_id
    and oid1.item_id < oid2.item_id
JOIN menu_dim md1 on oid1.item_id = md1.item_id
JOIN menu_dim md2 on oid2.item_id = md2.item_id

GROUP BY
    --item_1,
    product_1,
    --item_2,
    product_2
ORDER BY
    total_time_bougt DESC

