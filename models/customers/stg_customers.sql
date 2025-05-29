with source as (
    select
        CUSTOMER_ID,
        trim(FIRST_NAME) as first_name,
        trim(LAST_NAME) as last_name,
        lower(trim(EMAIL)) as email,
        try_cast(BIRTHDATE as date) as birthdate,
        ADDRESS,
        cast(CC as string) as credit_card,
        CC_TYPE,
        UPDATED_AT
    from {{ source('mysource', 'CUSTOMER') }}
)

select * from source
