/// player_set_damage(obj)
/* Sets whether the player gets hurt or dies. Setting obj to the player is instant death. */

if (state_current == player_state_death || ((state_current == player_state_hurt || status_insta_alarm > 0 || status_invin != INVIN_NONE) && argument0 != self))
{
    exit;
}

var damage_handle, hurt_direction;

damage_handle = argument0.id;
hurt_direction = esign(x - damage_handle.x, 1);

// Death:
if (damage_handle == id || (stage_get_rings() == 0 && status_shield == 0 && input_cpu == false))
{
    // Set speed:
    if (drown == false)
    {
        y_speed = -7;
    }

    player_set_state(player_state_death);

    if (input_cpu == false)
    {
        stage_set_pause_allow(false);
        audio_stop_jng();
    }
}

// Hurt:
else
{
    x_speed = 2 * hurt_direction;
    y_speed = -4;
    status_invin = INVIN_HURT;
    player_set_state(player_state_hurt);

    if (input_cpu == false && status_shield != 0)
    {
        status_shield = 0;
    }

    else if (input_cpu == false)
    {
        player_ring_loss();
    }
}

if (damage_handle == id)
{
    if (drown == true)
    {
        audio_play_sfx("snd_drown");
    }
    else
    {
        audio_play_sfx("snd_hurt");
    }
}
else if ((input_cpu == false && shield_handle != noone) || input_cpu == true || state_current == player_state_death)
{
    if (damage_handle.object_index == obj_spike)
    {
        audio_play_sfx("snd_spike");
    }
    else
    {
        audio_play_sfx("snd_hurt");
    }

    if (input_cpu == false)
    {
        audio_stop_drown();
    }
}

if (physics_id == PHYS_WATER)
{
    x_speed /= 2;
    y_speed /= 2;
}
