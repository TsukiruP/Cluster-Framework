/// miles_trait_fly_carry()
/// @desc Carries a player while flying.
/// @returns {void}

var carry_inst; carry_inst = stage_get_player(pick(player_index, 1, 0));

if (!instance_exists(carry_inst)) exit;
if (carry_inst.character_index == CHAR_CLASSIC) exit;

var carry_state; carry_state = carry_inst.state_current;

if (fly_carry_alarm > 0) fly_carry_alarm -= 1;

if (carry_state != player_state_fly_carry && (!carry_inst.on_ground || carry_inst.y_speed < 0))
{
    var carry_allow; carry_allow = (carry_state == player_state_air || carry_state == player_state_jump);

    if (carry_allow)
    {
        var carry_down;

        with (carry_inst) carry_down = player_get_input(INP_DOWN, CHECK_HELD);

        if (abs(floor(x) - floor(carry_inst.x)) < 12 && abs(floor(y) + 32 - floor(carry_inst.y)) < 12 && fly_carry_alarm == 0 && !carry_down)
        {
            with (carry_inst) player_set_state(player_state_fly_carry);
            audio_play_sfx("snd_grab", true);
        }
    }
}

if (carry_inst.state_current == player_state_fly_carry)
{
    carry_inst.x = x;
    carry_inst.y = y + 32;
    carry_inst.image_xscale = image_xscale;
    carry_inst.layer = layer;
    fly_carry = true;
}
else if (fly_carry != false) fly_carry = false;
