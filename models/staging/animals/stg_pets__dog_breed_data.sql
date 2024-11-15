with raw as (
    select * from {{ source('pets', 'dog_breed_data') }}
),

cleaned as (
    select 
        breedname as breed_name,
        altbreedname as nickname,
        group1 as primary_group,
        group2 as secondary_group,
        round(malewtkg * 2.20462, 1) as avg_weight,
        characteristics,
        avgpupprice as avg_price,
        intelligence,
        popularityus2017 as popularity_ranking

    from raw
)

select * from cleaned