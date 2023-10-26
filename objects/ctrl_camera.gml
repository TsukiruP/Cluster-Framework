#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Initialization

// View variables:
view_object[0] = id;
view_xhalf     = global.display_width / 2;
view_yhalf     = global.display_height / 2;

// Border variables:
border_left  = x - 8;
border_right = x + 8;
border_up    = y - 32;
border_down  = y + 32;

// Limit variables:
limit_left   = 0;
limit_right  = room_width;
limit_top    = 0;
limit_bottom = room_height;

// Focus handle:
focus_handle = global.player_instance[0];

// Camera variables:
camera_speed             = 6.5;
camera_x                 = x;
camera_y                 = y;
camera_x_shift           = 0;
camera_y_shift           = 0;
camera_lag               = 0;
camera_up_timer          = 0;
camera_down_timer        = 0;
camera_position_distance = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Lag

if(camera_lag > 0) camera_lag -= 1;
else camera_lag = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Shift

// Shift around the player:
if(player_exists(0)) {
    if(focus_handle == global.player_instance[0]) {
        // Up timer:
        if(focus_handle.action_state == ACTION_LOOK) camera_up_timer = min(camera_up_timer + 1, 120);
        else camera_up_timer = 0;

        // Down timer:
        if(focus_handle.action_state == ACTION_CROUCH) camera_down_timer = min(camera_down_timer + 1, 120);
        else camera_down_timer = 0;

        // Shift upwards:
        if(camera_up_timer >= 120 && focus_handle.y > limit_top - view_yhalf) camera_y_shift = max(-104, camera_y_shift - 2);

        // Shift downwards:
        else if(camera_down_timer >= 120 && focus_handle.y < limit_bottom + view_yhalf) camera_y_shift = min(88, camera_y_shift + 2);

        // Center camera:
        else camera_y_shift = max(0, abs(camera_y_shift) - 2) * sign(camera_y_shift);

        // Camera pan:
        if((focus_handle.action_state == ACTION_PEEL_OUT && focus_handle.peel_out_timer > 15) || focus_handle.peel_out_flag == true) {
            camera_x_shift = approach(camera_x_shift, 64 * focus_handle.animation_direction, 2);
        } else camera_x_shift = max(0, abs(camera_x_shift - 2) * sign(camera_x_shift));
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Movement

// Update borders:
border_left   = camera_x - 8;
border_right  = camera_x + 8;
border_top    = camera_y - 32;
border_bottom = camera_y + 32;

// Focus on player:
if(player_exists(0)) {
    if(focus_handle == global.player_instance[0]) {
        if(camera_position_distance == 0) {
            // Horizontal movement:
            if(camera_lag == 0) {
                // Move to the right:
                if(focus_handle.x > border_right && focus_handle.x <= limit_right + view_xhalf) camera_x += min(abs(focus_handle.x - border_right), 16);

                // Move to the left
                if(focus_handle.x < border_left && focus_handle.x >= limit_left - view_xhalf) camera_x -= min(abs(border_left - focus_handle.x), 16);
            }
        }

        if(focus_handle.action_state != ACTION_DEATH) {
            if(camera_position_distance == 0) {
                // Airborne vertical movement:
                if(focus_handle.ground == false) {
                    if(focus_handle.y > border_bottom && focus_handle.y < limit_bottom + view_yhalf) camera_y += focus_handle.y - border_bottom;

                    if(focus_handle.y < border_top && focus_handle.y > limit_top - view_yhalf) camera_y -= border_top - focus_handle.y;
                }

                // Grounded vertical movement:
                if(focus_handle.ground == true) {
                    if(focus_handle.y != camera_y) {
                        if(abs(focus_handle.y - focus_handle.yprevious) <= 6) {
                            if(focus_handle.y > camera_y && focus_handle.y < limit_bottom + view_yhalf) camera_y += min(abs(focus_handle.y - camera_y), 6);

                            if(focus_handle.y < camera_y && focus_handle.y > limit_top - view_yhalf) camera_y -= min(abs(camera_y - focus_handle.y), 6);
                        } else {
                            if(focus_handle.y > camera_y && focus_handle.y < limit_bottom + view_yhalf) camera_y += min(abs(focus_handle.y - camera_y), 16);

                            if(focus_handle.y < camera_y && focus_handle.y < limit_top - view_yhalf) camera_y -= min(abs(camera_y - focus_handle.y), 16);
                        }
                    }
                }
            }
            // Camera near borders:
            if(focus_handle.y > limit_bottom + view_yhalf) camera_y = approach(camera_y, limit_bottom + view_yhalf, 3);

            if(focus_handle.y < limit_top - view_yhalf) camera_y = approach(camera_y, limit_top - view_yhalf, 3);

            if(focus_handle.x > limit_right + view_xhalf) camera_x = approach(camera_x, limit_right + view_xhalf, 3);

            if(focus_handle.x < limit_left - view_xhalf) camera_x = approach(camera_x, limit_left - view_xhalf, 3);
        }
    }
}

// Focus on other objects:
if(focus_handle != noone && focus_handle != global.player_instance[0]) {
    if(focus_handle.x != camera_x) {
        if(focus_handle.x > camera_x && camera_x <= limit_right - view_xhalf) camera_x += min(abs(focus_handle.x - camera_x), camera_speed);

        if(focus_handle.x < camera_x && camera_x >= limit_left - view_xhalf) camera_x -= min(abs(camera_x - focus_handle.x), camera_speed);
    }

    if(focus_handle.y != camera_y) {
        if(focus_handle.y > camera_y && camera_y < limit_buttom - view_yhalf) camera_y += min(abs(focus_handle.y - camera_y), camera_speed);
        if(focus_handle.y < camera_y && camera_y > limit_top - view_yhalf) camera_y -= min(abs(camera_y - focus_handle.y), camera_speed);
    }
}

// Update positions:
x = floor(camera_x + camera_x_shift);
y = floor(camera_y + camera_y_shift);
