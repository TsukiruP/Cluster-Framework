#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Goal Ring Initialization

event_inherited();
reaction_index = player_reaction_goal_ring;
goal_state = 0;
spin_count = 0;
sparkle_alarm = 0;
clear_alarm = 0;
hitbox_set_hurtbox(28, 36, 28, 36);
sequence_init(seq_goal_ring);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused()) exit;

if (sparkle_alarm > 0) sparkle_alarm -= 1;
if (clear_alarm > 0) clear_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

if (goal_state)
{
    // Sparkles:
    if (sparkle_alarm == 0)
    {
        sparkle_alarm = 16;
        effect_create(x + irandom_range(-28, 28), y + irandom_range(-28, 28), seq_goal_ring_sparkle, depth - 1);
    }

    sequence_execute();
}

switch (goal_state)
{
    case 1:
        if (spin_count == 0)
        {
            goal_state = 2;
            sequence_set(seq_goal_ring_clear);
        }
        break;

    case 2:
        if (sequence_position(60))
        {
            goal_state = 3;
            clear_alarm = 128;
            audio_stop_sfx("snd_sign_post");
            audio_play_sfx("snd_goal_ring_clear");

            for ({var i; i = ANGLE_RIGHT}; i <= ANGLE_RIGHT_DOWN; i += ANGLE_RIGHT_UP)
            {
                var sparkle_inst; sparkle_inst = effect_create(x, y, seq_goal_ring_sparkle, depth - 1);

                with (sparkle_inst)
                {
                    x_speed = dcos(i) * 2;
                    y_speed = -dsin(i) * 2;
                }
            }
        }
        break;

    case 3:
        if (clear_alarm == 0)
        {
            goal_state = 4;
            save_auto();
            transition_create(rm_debug);
        }
        break;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

/*preview
draw_rectangle(x - 28, y - 36, x + 28, y + 39, true);
*/
