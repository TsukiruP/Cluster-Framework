/// player_state_rail(phase)
/* COMING TO YOUR HOME */

switch (argument0)
{
    case STATE_START:
        player_set_animation("rail");
        break;

    case STATE_STEP:
        if (!player_movement_ground()) return false;
        if (!on_ground) return player_set_state(player_state_air);

        if (instance_exists(ground_id))
        {
            if (!object_is_ancestor(ground_id.object_index, par_rail)) return player_set_state(player_state_run);
        }

        if (relative_angle >= 135 && relative_angle <= 270) x_speed += (dsin(relative_angle) * 5) / 32;
        break;

    case STATE_FINISH:
        break;
}
