#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Magnetized Ring Initialization

event_inherited();
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Ring

if(dropped == true) {
    with(instance_create(x, y, obj_ring)) {
        lifespan = 256;
        dropped  = true;
        x_speed  = other.hspeed;
        y_speed  = other.vspeed;
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

image_index = global.object_time div 100;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if(player_exists(0)) {
    var player_handle, xx, yy;

    player_handle = global.player_instance[0];
    xx            = sign(player_handle.x - x);
    yy            = sign(player_handle.y - y);

    hspeed += (xx * (0.1875 + (0.75 * (sign(hspeed) != xx)))) * global.object_ratio;
    vspeed += (yy * (0.1875 + (0.75 * (sign(vspeed) != yy)))) * global.object_ratio;
    speed   = clamp(speed, -64, 64);

    if(player_handle.shield_data != SHIELD_MAGNETIC) {
        dropped = true;
        instance_destroy();
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Ring

draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
