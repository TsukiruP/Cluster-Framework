#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Panel Initialization

event_inherited();
depth = -10;
reaction_index = player_reaction_dash_panel;
flip = false;
force = 8;
sfx_alarm = 0;
hurtbox_set(28, 0, 28, 7);
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0) sfx_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

image_index = time_sync(game_get_time(), 1, sprite_get_number(sprite_index));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field gravity_direction: enum(0, 90, 180, 270)
//field flip: false
//field force: number

/*preview
var flip;

flip = Field("flip", 0);

image_angle = gravity_direction;
image_xscale = 1;
if (flip) image_xscale = -1;
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Dash Panel

draw_self();
event_inherited();
