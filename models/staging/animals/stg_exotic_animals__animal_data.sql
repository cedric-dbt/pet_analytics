with raw as (
    select * from {{ source('exotic_animals', 'exotic_animal_data') }}
),

cleaned as (
    select
        animal,
        color,
        avg_height as avg_height_cm,
        round(avg_height * 0.393701, 2) as height_in,
        avg_weight as avg_weight_kg,
        round(avg_weight * 2.20462, 2) as avg_weight_lbs,
        avg_speed as avg_speed_kmh,
        round(avg_speed * 0.621371, 2) as avg_speed_mph,
        avg_top_speed as avg_top_speed_kmh,
        round(avg_top_speed * 0.621371, 2) as avg_top_speed_mph
    from raw
)

select * from cleaned