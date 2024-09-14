{{

    config(
        materialized = 'table'
    )
}}

WITH customs_office as (
    select * from {{ ref("src_impexpdclr")}}
)

select 
    CSTM_CD
from customs_office