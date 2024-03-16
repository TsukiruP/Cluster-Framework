#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

// State variables:
magnetized = false;
lifespan   = 0;

// Movement variables:
x_speed   = 0;
y_speed   = 0;
y_gravity = 0.09375;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Magnetized Ring

if(magnetized == true) instance_create(x, y, obj_ring_magnetized);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if(dropped == true) {
    // Decrease lifespan alarm:
    lifespan = max(lifespan - 1 * global.object_ratio, 0);

    // Horizontal movement:
    if(place_meeting(x + x_speed, y, par_solid)) x_speed *= -0.25;
    else x += x_speed * global.object_ratio;

    // Verical movement:
    y_speed += y_gravity * global.object_ratio;

    if(place_meeting(x, y + y_speed, par_solid) || (y_speed >= 0 && place_meeting(x, y + y_speed, par_platform) && !place_meeting(x, y, par_platform))) y_speed *= -0.75;
    else y += y_speed * global.object_ratio;

    // Destroy:
    if(lifespan <= 0 || !in_view()) instance_destroy();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Magnetization

if(player_exists(0)) {
    // Update status:
    if(global.player_instance[0].shield_data == SHIELD_MAGNETIC) {
        if(distance_to_object(global.player_instance[0]) < 64) {
            magnetized = true;
            instance_destroy();
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Ring

if(dropped == false || lifespan >= 90 || (dropped == true && lifespan < 90 && (lifespan / 4) mod 2)) {
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

// Size:
event_inherited();
