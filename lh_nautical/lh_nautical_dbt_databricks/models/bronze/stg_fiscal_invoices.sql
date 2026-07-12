with
    fiscal_invoices as (
        select *
        from {{ source('sql_server', 'fiscal_invoices') }}
    )

    , renamed as (
        select
            cast(id as int) as fiscal_invoices_pk
            , cast(order_id as int) as order_fk
            , cast(nfe_number as string) as fiscal_nfe_number
            , cast(nfe_access_key as string) as fiscal_nfe_access_key
            , cast(series as string) as fiscal_series
            , cast(issued_at as timestamp) as fiscal_issued_at
            , cast(status as string) as fiscal_status
            , cast(total_amount as decimal(14,2)) as fiscal_total_amount
            , cast(xml_storage_uri as string) as fiscal_xml_storage_uri
            , cast(created_at as timestamp) as fiscal_created_at_fiscal
            , cast(updated_at as timestamp) as fiscal_updated_at

            -- internal ingestion metadata
            , cast(_hash as string) as ingestion_hash,
            , cast(_ingested_at as timestamp) as ingested_at,
            , cast(_action as string) as ingestion_action

        from fiscal_invoices
    )

select *
from renamed