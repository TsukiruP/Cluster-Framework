#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

// Image speed:
image_speed = 0;

// State variables:
magnetized = false;
dropped    = false;
drop_alarm = 0;

//
x_speed   = 0;
y_speed   = 0;
y_gravity = 0.09375;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

if(dropped == true) {
    // Decrease drop alarm:
    drop_alarm -= 1;

    // Image_speed:
    image_speed = (drop_alarm / 2) / 256;

    // Destroy:
    if(drop_alarm <= 0) instance_destroy();

    // Alpha:
    if(drop_alarm < 25) image_alpha += (0 - image_alpha) * 0.05;
} else {
    image_index = global.object_time div 100;
    drop_alarm  = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Dropped movement:
if(magnetized == false && dropped == true && in_view()) {
    if(!place_meeting(x + x_speed, y, par_solid)) x += x_speed;
    else x_speed *= -0.25;

    if(!place_meeting(x, y + y_speed, par_solid)) y += y_speed;
    else y_speed *= -0.75;

    // Add gravity force:
    y_speed += y_gravity;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Magnetized

if(player_exists()) {
    // Update status:
    if(magnetized == false) {
        if(global.player_instance[0].shield_data == SHIELD_MAGNETIC) {
            if(distance_to_object(global.player_instance[0]) < 64) {
                magnetized = true;
                dropped    = false;
            }
        }

        // Destroy if out of view:
        if(dropped == true) {
            if(x < view_xview[view_current] - sprite_width || x > view_xview[view_current] + view_wview[view_current] + sprite_width
            || y < view_yview[view_current] - sprite_height || y > view_yview[view_current] + view_hview[view_current] + sprite_height) instance_destroy();
        }
    } else {
        if(global.player_instance[0].shield_data != SHIELD_MAGNETIC) {
            magnetized = false;
            dropped    = true;
            drop_alarm = 256;
        }

        // Move towards player:
        var xx, yy;

        xx = sign(global.player_instance[0].x - x);
        yy = sign(global.player_instance[0].y - y);

        x_speed += xx * (0.1875 + (0.75 * (sign(x_speed) != xx)));
        y_speed += yy * (0.1875 + (0.75 * (sign(y_speed) != yy)));
        x_speed  = clamp(x_speed, -64, 64);
        y_speed  = clamp(y_speed, -64, 64);

        x += x_speed;
        y += y_speed;
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Ring

if(dropped == false || drop_alarm >= 90 || (dropped == true && drop_alarm < 90 && (drop_alarm div 4) mod 2)) {
    draw_sprite_ext(sprite_index, -1, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
