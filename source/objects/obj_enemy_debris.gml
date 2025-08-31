#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debris Initialization

image_speed = 0;
x_speed = 0;
y_speed = 0;
gravity_force = 0.15;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (game_ispaused()) exit;

var game_speed; game_speed = game_get_speed();

x += x_speed * game_speed;
y += y_speed * game_speed;
y_speed += gravity_force * game_speed;

if (!in_view(self)) instance_destroy();
