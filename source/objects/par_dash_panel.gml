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
angle = ANGLE_RIGHT;
force = 8;
sfx_alarm = 0;
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

image_index = mod_time(game_get_time(), 1, sprite_get_number(sprite_index));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field angle: enum(ANGLE_RIGHT, ANGLE_UP)
//field force: number

/*preview
sprite_index = Sprite(pick(Field("angle", 0) == ANGLE_UP, "spr_dash_panel_hor", "spr_dash_panel_vert"))
*/
