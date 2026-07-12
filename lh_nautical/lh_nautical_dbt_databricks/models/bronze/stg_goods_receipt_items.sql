with
    goods_receipt_items as (
        select *
        from {{ source('sql_server', 'goods_receipt_items')}}
    )

    , renamed as (
        select
            cast(id as int) as goods_receipt_item_pk
            , cast(goods_receipt_id as int) as goods_receipt_fk
            , cast(purchase_order_item_id as int) as purchase_order_item_fk
            , cast(quantity_received as decimal(14,3)) as goods_receipt_item_quantity_received

            -- internal ingestion metadata
            , cast(_hash as string) as _goods_receipt_item_hash
            , cast(_ingested_at as timestamp) as _goods_receipt_item_ingested_at
            , cast(_action as string) as _goods_receipt_item_action
        from goods_receipt_items
    )

select *
from renamed