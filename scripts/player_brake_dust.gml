/// player_brake_dust()
/// @desc  Creates the brake effect every 4 frames.
/// @returns {void}

if (animation_time mod 4 == 0)
{
    var sine; sine = dsin(mask_rotation);
    var csine; csine = dcos(mask_rotation);

    effect_create(x + (sine * y_radius), y + (csine * y_radius), sequence_brake);
}
