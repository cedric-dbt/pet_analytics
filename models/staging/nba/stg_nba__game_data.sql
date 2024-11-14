with nba_game_data_cleaned as (
    select
        PLAYER,
        TM as team,
        OPP as opponent,
        RES as result,
        MP as minutes_played,
        PTS as points,
        FG as field_goals_made,
        FGA AS field_goals_attempted,

        -- transform and round the percentage columns to one decimal place
        round(FG_PERCENT * 100, 1) as field_goal_percentage,

        THREEP as three_pointers_made,
        THREEPA as three_pointers_attempted,

        -- transform and round the percentage columns to one decimal place
        round(THREEP_PERCENT * 100, 1) as three_point_percentage,
        
        FT as free_throws_made,
        FTA as free_throws_attempted,
        FT_PERCENT as free_throw_percentage,
        ORB as offensive_rebounds,
        DRB as defensive_rebounds,
        TRB as total_rebounds,
        AST as assists,
        STL as steals,
        BLK as blocks,
        TOV as turnovers,
        PF as personal_fouls,
        GMSC as game_score,
        GAME_DATE as game_date
    from {{ source('nba', 'nba_raw_games') }}
)

select * from nba_game_data_cleaned