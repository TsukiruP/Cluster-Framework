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
force = 8;
angle = ANGLE_RIGHT;
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

//field force: number
//field angle: enum(ANGLE_RIGHT, ANGLE_UP)

/*preview
sprite_index = Sprite(pick(Field("angle", 0) == ANGLE_UP, "spr_dash_panel_hor", "spr_dash_panel_vert"))
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Panel Initialization

if (angle == ANGLE_UP && sign(image_xscale) == -1) angle = angle_wrap(360 - angle);
if (angle == ANGLE_RIGHT && sign(image_yscale) == -1) angle = angle_wrap(180 - angle);

if (angle mod 180 == 0) hitbox_set_hurtbox(28, 0, 28, 7);
else
{
    sprite_index = spr_dash_panel_vert;
    hitbox_set_hurtbox(0, 29, 7, 27);
}
