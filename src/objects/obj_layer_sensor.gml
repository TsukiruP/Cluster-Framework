#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sensor Initialization

event_inherited();
reaction_index = player_reaction_layer_sensor;
layer = 0;
hitbox_set_hurtbox(8, 8, 7, 7, 8, 8);
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field layer: enum(0, 1)

/*preview
sprite_index = Sprite("spr_layer_sensor", Field("layer", 0));
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Sensor

if (!game_get_debug_visible()) exit;

image_index = layer;
draw_self();
