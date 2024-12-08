/// player_set_damage(obj)
// Sets whether the player gets hurt or dies. Setting obj to the player is instant death.

// Exit if already hurt, dying, or invincible:
if (state_current == player_state_death || ((state_current == player_state_hurt || status_insta_alarm > 0 || status_invin != INVIN_NONE) && argument0 != self))
{
    exit;
}

var damage_handle, hurt_direction;

// Damage handle:
damage_handle = argument0.id;

// Hurt direction:
hurt_direction = esign(x - damage_handle.x, 1);

// Death:
if (damage_handle == id || (stage_get_rings() == 0 && status_shield == 0 && input_cpu == false))
{
    // Set speed:
    if (drown == false)
    {
        y_speed = -7;
    }

    // Set state:
    player_set_state(player_state_death);

    // Player 1 specific:
    if (input_cpu == false)
    {
        // Disable pause:
        stage_set_pause_allow(false);

        // Stop jingle:
        audio_jng_stop();
    }
}

// Hurt:
else
{
    // Set speed:
    x_speed = 2 * hurt_direction;
    y_speed = -4;

    // Set invincibility:
    status_invin = INVIN_HURT;

    // Set state:
    player_set_state(player_state_hurt);

    // Reset shield:
    if (input_cpu == false && status_shield != 0)
    {
        status_shield = 0;
    }

    // Ring loss:
    else if (input_cpu == false)
    {
        player_ring_loss();
    }
}

// Play sound:
if (damage_handle == id)
{
    if (drown == true)
    {
        audio_sfx_play("snd_drown");
    }
    else
    {
        audio_sfx_play("snd_hurt");
    }
}
else if ((input_cpu == false && shield_handle != noone) || input_cpu == true || state_current == player_state_death)
{
    if (damage_handle.object_index == obj_spike)
    {
        audio_sfx_play("snd_spike");
    }
    else
    {
        audio_sfx_play("snd_hurt");
    }

    // Stop drowning music:
    if (input_cpu == false)
    {
        audio_drown_stop();
    }
}

// Underwater physics:
if (physics_id == PHYS_WATER)
{
    x_speed /= 2;
    y_speed /= 2;
}
