#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();

// Flags:
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

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

if (dropped == true) {
    // Destroy if out of view:
    if(!in_view()) {
        instance_destroy();
    }

    // Add speed:
    x += x_speed * global.object_ratio;

    // Add gravity:
    y_speed += y_gravity * global.object_ratio;
    y       += y_speed * global.object_ratio;

    // Terrain collision:
    if ((prop_point_check(bbox_left, y) && x_speed < 0) || (prop_point_check(bbox_right, y) && x_speed > 0)) {
        x_speed *= -1;
    }

    if ((prop_point_check(x, bbox_top) && y_speed < 0) || (prop_point_check(x, bbox_bottom) && y_speed > 0)) {
        y_speed *= -1;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Magnetization

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

if(instance_exists(instance_player(0))) {
    var player_handle;

    // Player handle:
    player_handle = instance_player(0);

    // Update status:
    if(player_handle.status_shield == SHIELD_MAGNETIC || player_handle.status_shield == SHIELD_LIGHTNING) {
        if(distance_to_object(global.player_instance[0]) < 64) {
            magnetized = true;
            instance_destroy();
        }
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lifespan

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

if (dropped == true) {
    // Decrease lifespan alarm:
    lifespan = max(lifespan - 1 * global.object_ratio, 0);

    // Destroy:
    if(lifespan <= 0) {
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

// Ring:
if(dropped == false || lifespan >= 90 || (dropped == true && lifespan < 90 && (lifespan div 4) mod 2)) {
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}

// Size:
event_inherited();
