/// player_set_damage(obj)
/* Sets whether the player gets hurt or dies. Setting obj to the player is instant death. */

if (state_current == player_state_death || ((state_current == player_state_hurt || status_insta_alarm > 0 || status_invin != INVIN_NONE) && argument0 != self)) exit;

var damage_id, hurt_direction;

damage_id = argument0.id;
hurt_direction = esign(x - damage_id.x, 1);

if (damage_id == id || (stage_get_rings() == 0 && status_shield == 0 && !input_cpu))
{
    if (!drown) y_speed = -7;
    player_set_state(player_state_death);

    if (!input_cpu)
    {
        stage_set_pause_allow(false);
        audio_stop_jng();
    }
}
else
{
    x_speed = 2 * hurt_direction;
    y_speed = -4;
    status_invin = INVIN_HURT;
    player_set_state(player_state_hurt);

    if (!input_cpu)
    {
        if (status_shield != 0) status_shield = 0;
        else player_ring_loss();
    }
}

if (damage_id == id)
{
    if (drown) audio_play_sfx("snd_drown", true);
    else audio_play_sfx("snd_hurt", true);
}
else if ((!input_cpu && shield_id != noone) || input_cpu || state_current == player_state_death)
{
    if (damage_id.object_index == obj_spike) audio_play_sfx("snd_spike", true);
    else audio_play_sfx("snd_hurt", true);
    if (!input_cpu) audio_stop_drown();
}

if (underwater)
{
    x_speed /= 2;
    y_speed /= 2;
}
