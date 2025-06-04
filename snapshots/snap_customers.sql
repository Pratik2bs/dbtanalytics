{% snapshot customer_snapshot %}
{{
    config(
        target_schema='SC_DBPRACT',
        unique_key='CUSTOMER_ID',
        strategy='timestamp',
        updated_at='UPDATED_AT'
    )
}}

select
    CUSTOMER_ID,
    FIRST_NAME,
    LAST_NAME,
    EMAIL,
    BIRTHDATE,
    ADDRESS,
    CC,
    CC_TYPE,
    UPDATED_AT
from {{ source('mysource', 'CUSTOMER') }}


{% endsnapshot %}
