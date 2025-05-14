#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Super Skid Initialization

event_inherited();
sequence_set(seq_super_skid);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

var player_state; player_state = player_inst.state_current;
var player_peel; player_peel = player_inst.peel_out;
var player_boost; player_boost = player_inst.boost_mode;
var player_animation; player_animation = player_inst.animation_current;

event_inherited();
if (player_state != sonic_state_skid || !(player_peel || player_boost) || player_animation != "skid") instance_destroy();
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

var draw_x; draw_x = x + (csine * 13 * player_xscale);
var draw_y; draw_y = y - (sine * 13 * player_xscale);

if (sprite_exists(sprite_index)) draw_sprite_ext(sprite_index, -1, draw_x, draw_y, player_xscale, 1, player_rotation, c_white, 1);
