with orders as (
    select * from {{ ref('fct_orders') }}
),

monthly_sales as (
    select
        date_trunc('month', order_purchase_timestamp) as sales_month,
        count(distinct order_id) as total_orders,
        sum(total_payment_value) as total_revenue,
        round(cast(avg(total_payment_value) as numeric), 2) as average_order_value
    from orders
    where order_status = 'delivered'
    group by 1
)

select * from monthly_sales
order by sales_month desc