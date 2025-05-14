/// player_trail_init()
/// @desc Initializes trail.
/// @returns {void}

trail_draw = false;
trail_alpha = -1;

if (config_get("misc_trails"))
{
    trail_alpha = ds_list_create();

    for ({var i; i = 0}; i < 16; i += 1)
    {
        ds_list_add(trail_alpha, 0);
    }
}
