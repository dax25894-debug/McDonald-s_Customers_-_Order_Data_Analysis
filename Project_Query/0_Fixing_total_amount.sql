
update order_dim od
set total_amount = nt.new_total
FROM
(
    SELECT
    oid1.order_id,
    sum(oid1.quantity * md.price) as new_total
    
from order_item_dim oid1
join menu_dim md on oid1.item_id = md.item_id
GROUP BY oid1.order_id

) nt
where od.order_id = nt.order_id