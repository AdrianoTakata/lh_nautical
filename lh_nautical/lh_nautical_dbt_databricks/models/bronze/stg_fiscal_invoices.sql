with
    fiscal_invoices as (
        select *
        from {{ source('slq_server', 'fiscal_invoices') }}
    )

    , renamed as (
        select
            cast(id as int) as fiscal_invoices_id
            , cast(order_id as int)
            , cast(nfe_number as string) as fiscal_nfe_number
            , cast(nfe_access_key as string) as fiscal_nfe_access_key
            , cast(series as string) as fiscal_series
            , cast(issued_at as timestamp) as fiscal_issued_at
            , cast(status as string) as fiscal_status
            , cast(total_amount as decimal(14,2)) as fiscal_total_amount
            , cast(xml_storage_uri as string) as fiscal_xml_storage_uri
            , cast(created_at as timestamp) as fiscal_created_at_fiscal
            , cast(updated_at as timestamp) as fiscal_updated_at

        from fiscal_invoices
    )

select *
from renamed