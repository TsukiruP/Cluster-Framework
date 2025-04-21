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
variant = 0;
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

image_index = time_sync(game_get_time(), 1, sprite_get_number(sprite_index));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field variant: enum(0, 1)
//field force: number
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Panel Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_dash_panel_vertical;
        angle = pick(sign(image_xscale) == -1, ANGLE_UP, ANGLE_DOWN);
        hitbox_set_hurtbox(0, 29, 7, 27);
        break;

    default:
        sprite_index = spr_dash_panel_horizontal;
        angle = pick(sign(image_yscale) == -1, ANGLE_RIGHT, ANGLE_LEFT);
        hitbox_set_hurtbox(28, 0, 28, 7);
}
