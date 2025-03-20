/// player_waterfall_splash_create()
/// @desc Creates a waterfall splash instance.
/// @returns {void}

if (waterfall_draw && !instance_exists(waterfall_inst))
{
    waterfall_inst = instance_create(x, y, eff_waterfall);
    with (waterfall_inst) player_inst = other.id;
}
