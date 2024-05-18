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

if (dropped == true) {
    with (instance_create(x, y, obj_ring)) {
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
/// Movement

// Don't bother if the game is paused:
if (game_paused()) exit;

if (player_exists(0) != noone) {
    var player_handle, xx, yy;

    // Move towards the player:
    player_handle = player_exists(0);
    xx            = sign(player_handle.x - x);
    yy            = sign(player_handle.y - y);

    hspeed += (xx * (0.1875 + (0.75 * (sign(hspeed) != xx))));
    vspeed += (yy * (0.1875 + (0.75 * (sign(vspeed) != yy))));
    speed   = clamp(speed, -64, 64) * global.object_ratio;

    // Drop a normal ring when no longer magnetized:
    if (player_handle.shield_data != SHIELD_MAGNETIC && player_handle.shield_data != SHIELD_LIGHTNING) {
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

// Ring:
draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
