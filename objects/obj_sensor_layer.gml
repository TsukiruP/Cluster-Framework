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

// Collision layer:
collision_layer = 0;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field collision_layer: enum(0, 1)

/*preview
    var collision_layer;

    collision_layer = Field("collision_layer", 0);

    draw_sprite(Sprite("spr_sensor_layer", collision_layer), 0, x, y);
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Sensor

// Exit if not in debug mode:
if (global.game_debug == false)
{
    exit;
}

// Image index:
image_index = collision_layer;

// Sensor:
draw_self();

// Collision:
event_inherited();
