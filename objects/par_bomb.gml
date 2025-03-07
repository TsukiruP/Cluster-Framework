#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bomb Initialization

event_inherited();
reaction_index = player_reaction_bomb;
y_speed = 0;
gravity_force = 0;
sequence_init();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused()) exit;

var game_speed; game_speed = game_get_speed();

y += y_speed * game_speed;
y_speed += gravity_force * game_speed;

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}

if (!in_view(self, 64)) instance_destroy();
if (position_meeting(x, y, par_solid)) bomb_destroy();
