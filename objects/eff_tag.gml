#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Tag Initialization

event_inherited();
sequence_set(seq_tag_call);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (player_inst.tag_leader && sequence_index != seq_tag_catch) sequence_set(seq_tag_catch);

event_inherited();
if (player_inst.tag_leader_time < 32 && sequence_index == seq_tag_call) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Tag

var player_xscale; player_xscale = player_inst.image_xscale;
var player_rotation; player_rotation = player_inst.mask_direction;
var sine; sine = dsin(player_inst.mask_direction);
var csine; csine = dcos(player_inst.mask_direction);

var draw_x; draw_x = x + (csine * 10 * player_xscale);
var draw_y; draw_y = y - (sine * 10 * player_xscale);

if (sprite_exists(sprite_index))
{
    draw_sprite_ext(sprite_index, -1, draw_x, draw_y, 1, 1, player_rotation, c_white, 1);
}
