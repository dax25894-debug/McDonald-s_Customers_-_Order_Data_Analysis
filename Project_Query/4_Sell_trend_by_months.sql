SELECT
    *,
    round(((monthly_revenue - COALESCE(lag(monthly_revenue) over(),0)) / monthly_revenue) * 100 , 2) as Change_percentage
FROM
(
    SELECT
        to_char(od.order_date,'Month') as order_months,
        count(od.customer_id),
        sum(od.total_amount) as monthly_revenue
        
    FROM
        order_dim od
    GROUP BY
        order_months,
        to_char(od.order_date,'mm')

    ORDER BY
        to_char(od.order_date,'mm')
)