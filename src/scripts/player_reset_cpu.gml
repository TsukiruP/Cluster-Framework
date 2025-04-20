/// player_reset_cpu()
/// @desc Resets the CPU player to match the human player.
/// @returns {void}

var player_inst; player_inst = stage_get_player(0);

if (instance_exists(player_inst))
{
    x = floor(player_inst.x);
    y = floor(player_inst.y);
    xprevious = floor(player_inst.x);
    yprevious = floor(player_inst.y);
    image_xscale = player_inst.image_xscale;
    gravity_direction = player_inst.gravity_direction;
    x_speed = player_inst.x_speed;
    y_speed = player_inst.y_speed;
    layer = player_inst.layer;
    underwater = player_inst.underwater;
    player_set_state(player_state_air);
    player_set_animation("roll");
    player_reset_physics();
}
