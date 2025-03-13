#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bullet Initialization

event_inherited();
reaction_index = player_reaction_bullet;
attackbox_element = ELEM_NONE;
x_speed = 0;
y_speed = 0;
gravity_force = 0;
reflect = false;
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

x += x_speed * game_speed;
y += y_speed * game_speed;
y_speed += gravity_force * game_speed;

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}

if (!in_view(self)) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Bullet

draw_self_floored();
