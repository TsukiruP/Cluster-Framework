#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debuff Initialization

event_inherited();
sequence_set(sequence_debuff);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

if (player_inst.status_speed != SPEED_SLOW && player_inst.status_panic_alarm <= 0) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debuff

var player_rotation; player_rotation = player_inst.mask_rotation;
var sine; sine = dsin(player_inst.mask_rotation);
var csine; csine = dcos(player_inst.mask_rotation);

var draw_x; draw_x = x - (sine * 16);
var draw_y; draw_y = y - (csine * 16);

if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, 1, 1, player_rotation, c_white, 1);
}
