#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sensor Initialization

event_inherited();

hurtbox_set(8, 8, 7, 7, 8, 8);
reaction_index = player_reaction_sensor_layer;
layer = 0;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field layer: enum(0, 1)

/*preview
    var layer;

    layer = Field("layer", 0);

    draw_sprite(Sprite("spr_sensor_layer", layer), 0, x, y);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Sensor

if (!game_get_debug()) exit;

image_index = layer;
draw_self();
event_inherited();
