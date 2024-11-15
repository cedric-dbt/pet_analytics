with raw as (
    select * from {{ source('pets', 'cat_breed_data') }}
),

cleaned as (
    select
        breedname as breed_name,
        
        -- Convert LapCat field to boolean
        case
            when LapCat = 'Lap' then true
            else false 
        end as lap_cat,

        fur,
        round(malewtkg * 2.20462, 0) as avg_weight_lbs,
        avgkittenprice as avg_kitten_price,
        popularityus2017 as popularity_ranking
    
    from raw
)

select * from cleaned