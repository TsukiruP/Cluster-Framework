/// player_slope_friction(friction, threshold)
// Applies slope friction

if (on_ground == true)
{
    var sine;

    sine = dsin(relative_angle);

    if ((sign(sine) != sign(x_speed) || (relative_angle >= 22.5 && relative_angle <= 337.5)))
    {
        var slope_friction;

        slope_friction = sine * argument0;

        if (abs(slope_friction) > argument1)
        {
            x_speed -= slope_friction;
        }
    }
}
