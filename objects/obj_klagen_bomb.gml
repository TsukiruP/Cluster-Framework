#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Klagen Bomb Initialization

event_inherited();
klagen_range = 64;
klagen_drop = false;
explosive_alarm = 0;
explosive_y = y + 15 * image_yscale;
explosive_inst = explosive_create(x, explosive_y, seq_klagen_bomb_explosive);
sequence_init(seq_klagen_bomb);
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Explosive

if (instance_exists(explosive_inst)) instance_destroy_id(explosive_inst);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();
if (explosive_alarm > 0) explosive_alarm = roundto_step(explosive_alarm, -sequence_speed);

if (instance_exists(explosive_inst))
{
    if (explosive_inst.y == explosive_y)
    {
        if (!klagen_drop)
        {
            var player_inst; player_inst = enemy_get_player_below(klagen_range, true);

            if (instance_exists(player_inst))
            {
                klagen_drop = true;
                explosive_alarm = 10;
            }
        }
        else if (explosive_alarm == 0) explosive_inst.gravity_force = 0.05;
    }
    else if (explosive_inst.y != explosive_y && explosive_inst.gravity_force == 0) explosive_inst.y = approach(explosive_inst.y, explosive_y, 4/60 * sequence_speed);
}
else
{
    if (explosive_inst != noone)
    {
        explosive_alarm = 64;
        explosive_inst = noone;
    }
    else if (explosive_alarm == 0)
    {
        klagen_drop = false;
        explosive_inst = explosive_create(x, y, seq_klagen_bomb_explosive);
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
