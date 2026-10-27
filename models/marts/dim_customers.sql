with customers as (
    select * from {{ ref('stg_customers') }}
),

orders as (
    select * from {{ ref('stg_orders') }}
),

order_payments as (
    select * from {{ ref('stg_order_payments') }}
),

customer_orders as (
    select
        c.customer_id,
        c.customer_unique_id,
        c.customer_city,
        c.customer_state,
        count(distinct o.order_id) as total_orders,
        min(cast(o.order_purchase_timestamp as timestamp)) as first_order_date,
        max(cast(o.order_purchase_timestamp as timestamp)) as most_recent_order_date,
        coalesce(sum(p.payment_value), 0) as total_spend
    from customers c
    left join orders o on c.customer_id = o.customer_id
    left join order_payments p on o.order_id = p.order_id
    group by 1, 2, 3, 4
)

select * from customer_orders