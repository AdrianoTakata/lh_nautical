with
    locations as (
        select *
        from {{ source('sql_server','locations')}}
    )

    , renamed as (
        select
            cast(id as int) as location_pk
            , INITCAP(TRIM(REGEXP_REPLACE(name, '\\s+', ' '))) as location_name
            , cast(location_type as string)
            , regexp_replace(postal_code, '[^a-zA-Z0-9]', '') as location_postal_code
            , cast(street as string) as location_street
            , cast(number as int) as location_number
            , cast(complement as string) as location_complement
            , cast(district as string) as location_district
            , cast(city as string) as location_city
            , cast(state as string) as location_state
            , cast(country as string) as location_contry
            , cast(is_active as boolean) as location_is_active
            , cast(created_at as timestamp) as location_created_at
            , cast(updated_at as timestamp) as location_updated_at

            -- internal ingestion metadata
            cast(_hash as string) as _order_hash,
            cast(_ingested_at as timestamp) as _order_ingested_at,
            cast(_action as string) as _order_action
        from locations
    )

select *
from renamed