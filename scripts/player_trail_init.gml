/// player_trail_init()
// Initializes trail.

trail_draw = false;
trail_alpha = -1;

if (game_config_get("misc_trail"))
{
    trail_alpha = ds_list_create();

    for (i = 0; i < 16; i += 1)
    {
        ds_list_add(trail_alpha, 0);
    }
}
