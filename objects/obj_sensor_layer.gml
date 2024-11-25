#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Sensor Initialization

event_inherited();

// Hurtbox:
hurtbox_set(8, 8, 7, 7, 8, 8);

// Reaction:
reaction_index = player_reaction_sensor_layer;

// Layer:
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

// Exit if not in debug mode:
if (!game_get_debug())
{
    exit;
}

// Image index:
image_index = layer;

// Sensor:
draw_self();

// Collision:
event_inherited();
