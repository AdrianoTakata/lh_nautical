with 
    orders as (
        select * 
        from {{ source('sql_server', 'orders') }}
    )
    
    , renamed as (
        select
            cast(id as int) as order_pk,
            cast(customer_id as int) as customer_fk,
            cast(salesperson_id as int) as salesperson_fk,
            cast(location_id as int) as location_fk,
            cast(order_number as string) as order_number,
            cast(channel as string) as order_channel,
            cast(status as string) as order_status,
            cast(subtotal as numeric) as order_subtotal_amount,
            cast(discount_amount as numeric) as order_discount_amount,
            cast(total as numeric) as order_total_amount,
            cast(placed_at as timestamp) as order_placed_at,
            cast(created_at as timestamp) as order_created_at,
            cast(updated_at as timestamp) as order_updated_at,
            
            -- internal ingestion metadata
            cast(_hash as string) as _order_hash,
            cast(_ingested_at as timestamp) as _order_ingested_at,
            cast(_action as string) as _order_action
        from orders
)

select *
from renamed