/// player_routine_insta()
/* Shorthand for performing */

player_set_state(player_state_air, false);
status_shield_allow = false;
status_insta_alarm = 8;
player_set_animation("insta");
audio_play_sfx("snd_shield_insta", true);

if (character_index == CHAR_SONIC || character_index == CHAR_CLASSIC)
{
    with (instance_create(x, y, eff_player))
    {
        depth = other.depth;
        image_xscale = other.image_xscale;
        image_angle = other.gravity_direction;
        sequence_init(sequence_shield_insta);
        player_inst = other.id;
    }
}
