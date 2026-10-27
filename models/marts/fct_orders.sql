with orders as (
    select * from {{ ref('stg_orders') }}
),

order_items as (
    select
        order_id,
        count(order_item_id) as total_items,
        coalesce(sum(price), 0) as total_item_price,
        coalesce(sum(freight_value), 0) as total_freight
    from {{ ref('stg_order_items') }}
    group by 1
),

order_payments as (
    select
        order_id,
        coalesce(sum(payment_value), 0) as total_payment_value
    from {{ ref('stg_order_payments') }}
    group by 1
),

final as (
    select
        o.order_id,
        o.customer_id,
        o.order_status,
        cast(o.order_purchase_timestamp as timestamp) as order_purchase_timestamp,
        cast(o.order_approved_at as timestamp) as order_approved_at,
        cast(o.order_delivered_carrier_date as timestamp) as order_delivered_carrier_date,
        cast(o.order_delivered_customer_date as timestamp) as order_delivered_customer_date,
        cast(o.order_estimated_delivery_date as timestamp) as order_estimated_delivery_date,
        coalesce(i.total_items, 0) as total_items,
        coalesce(i.total_item_price, 0) as total_item_price,
        coalesce(i.total_freight, 0) as total_freight,
        coalesce(p.total_payment_value, 0) as total_payment_value
    from orders o
    left join order_items i on o.order_id = i.order_id
    left join order_payments p on o.order_id = p.order_id
)

select * from final