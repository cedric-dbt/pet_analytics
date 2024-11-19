with raw as (
    select *
    from {{ source('nba', 'nba_player_stats_historic') }}
),

clean_historical_nba_stats as (
    select
        player_name,
        team_abbreviation,
        age,
        player_height as player_height_cm,
        round(player_height * 0.393701, 2) as player_height_in,
        player_weight as player_weight_kg,
        round(player_weight * 2.20462, 1) as player_weight_lbs,
        college,
        country,
        draft_year,
        draft_round,
        draft_number,
        gp as games_played,
        pts as points_per_game,
        reb as rebounds_per_game,
        ast as assists_per_game,
        season

    from raw
)

select * from clean_historical_nba_stats