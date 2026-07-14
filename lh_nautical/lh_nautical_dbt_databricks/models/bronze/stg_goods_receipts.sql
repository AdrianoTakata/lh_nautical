with
    goods_receipts as (
        select *
        from {{ source('sql_server','goods_receipts') }}
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
            , cast(_hash as string) as _goods_receipt_hash
            , cast(_ingested_at as timestamp) as _goods_receipt_ingested_at
            , cast(_action as string) as _goods_receipt_action
        from goods_receipt
    )

select *
from renamed