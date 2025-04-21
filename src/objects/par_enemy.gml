#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Enemy Initialization

event_inherited();
reaction_index = player_reaction_enemy;
attackbox_element = ELEM_NONE;
class = ENE_BASIC;
vitality = 3;
vitality_alarm = 0;
invin_alarm = 0;
x_offset = 0;
y_offset = 0;
explosion_x_offset = 0;
explosion_y_offset = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarms

if (game_ispaused(mnu_pause)) exit;

if (vitality_alarm > 0) vitality_alarm -= 1;
if (invin_alarm > 0) invin_alarm -= 1;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Enemy

// Enemy:
image_alpha = pick((class == ENE_SUPER && invin_alarm > 0), 1, time_sync(invin_alarm, 2, 2));
draw_sprite_ext(sprite_index, -1, floor(x) + x_offset * sign(image_xscale), floor(y) + y_offset * sign(image_yscale), image_xscale, image_yscale, gravity_direction, c_white, image_alpha);

// Vitality:
if (class == ENE_SUPER && vitality <= sprite_get_number(spr_enemy_vitality) && vitality_alarm > 0) draw_sprite(spr_enemy_vitality, vitality - 1, x, y - 64 * sign(image_yscale));
