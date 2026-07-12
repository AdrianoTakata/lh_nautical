with
    goods_receipt as (
        select *
        from {{ source('sql_server','goods_receipt') }}
    )

    , renamed as (
        select
            cast(id as int) as goods_receipt_pk
            , cast(purchase_order_id as int) as purchase_order_fk
            , cast(received_by_employee_id as int) as received_by_employee_fk
            , cast(received_at as timestamp) as goods_receipt_received_at
            , cast(notes as string) as goods_receipt_notes
            , cast(created_at as timestamp) as goods_receipt_created_at

            -- internal ingestion metadata
            cast(_hash as string) as _order_hash,
            cast(_ingested_at as timestamp) as _order_ingested_at,
            cast(_action as string) as _order_action
        from goods_receipt
    )

select *
from renamed