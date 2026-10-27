with order_items as (
    select * from {{ ref('stg_order_items') }}
),

sellers as (
    select * from {{ ref('stg_sellers') }}
),

seller_performance as (
    select
        s.seller_id,
        s.seller_city,
        s.seller_state,
        count(distinct oi.order_id) as total_orders_fulfilled,
        count(oi.order_item_id) as total_items_sold,
        sum(oi.price) as total_revenue_generated
    from sellers s
    left join order_items oi on s.seller_id = oi.seller_id
    group by 1, 2, 3
)

select * from seller_performance
order by total_revenue_generated desc nulls last