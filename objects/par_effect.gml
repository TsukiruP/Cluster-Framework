#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effect Initialization

image_speed = 0;
x_speed = 0;
y_speed = 0;
sequence_init();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

x += x_speed;
y += y_speed;
sequence_execute();
