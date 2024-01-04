#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Initialization

// View object:
view_object[0] = id;

// Limit variables:
limit_left   = 0;
limit_right  = room_width;
limit_top    = 0;
limit_bottom = room_height;

// Focus handle:
focus_handle = global.player_instance[0];

// Camera variables:
camera_x                 = x;
camera_y                 = y;
camera_x_shift           = 0;
camera_y_shift           = 0;
camera_lag_alarm         = 0;
camera_look_timer        = 0;
camera_position_distance = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Lag

if(camera_lag_alarm > 0) camera_lag_alarm -= 1;
else camera_lag_alarm = 0;
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
        var look_direction;

        // Look direction:
        look_direction = (focus_handle.action_state == ACTION_CROUCH) - (focus_handle.action_state == ACTION_LOOK);

        // Look timer:
        //if(look_direction != 0) camera_look_timer = clamp(camera_look_timer + (1 * look_direction), -120, 120);
        //else camera_look_timer = 0;
        camera_look_timer = clamp(camera_look_timer + (1 * look_direction), -120, 120);
        if(sign(camera_look_timer) != look_direction) camera_look_timer = 0;

        // Shift camera upwards:
        if(camera_look_timer <= -120) camera_y_shift = max(camera_y_shift - 2, - 104);

        // Shift camera downwards:
        else if(camera_look_timer >= 120) camera_y_shift = min(camera_y_shift + 2, 88);

        // Center camera:
        else camera_y_shift = max(abs(camera_y_shift) - 2, 0) * sign(camera_y_shift);

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

var camera_speed_cap;

// Update borders:
var border_left, border_right, border_top, border_bottom;

border_left   = camera_x - 8;
border_right  = camera_x + 8;
border_top    = camera_y - 32;
border_bottom = camera_y + 32;

// Focus on player:
if(player_exists(0)) {
    if(focus_handle == global.player_instance[0]) {
        // Camera speed cap:
        camera_speed_cap = 16;

        if(camera_position_distance == 0) {
            // Horizontal movement:
            if(camera_lag_alarm == 0) {
                if(focus_handle.x < border_left) camera_x -= min(border_left - focus_handle.x, camera_speed_cap);
                else if(focus_handle.x > border_right) camera_x += min(focus_handle.x - border_right, camera_speed_cap);
            }
        }

        if(focus_handle.action_state != ACTION_DEATH) {
            if(camera_position_distance == 0) {
                // Airborne vertical movement:
                if(focus_handle.ground == false) {
                    if(focus_handle.y < border_top) camera_y -= min(border_top - focus_handle.y, camera_speed_cap);
                    else if(focus_handle.y > border_bottom) camera_y += min(focus_handle.y - border_bottom, camera_speed_cap);
                }

                // Grounded vertical movement:
                else {
                    if(focus_handle.y < camera_y + focus_handle.roll_offset) camera_y -= min(camera_y - focus_handle.roll_offset - focus_handle.y, camera_speed_cap);
                    else if(focus_handle.y > camera_y + focus_handle.roll_offset) camera_y += min(focus_handle.y - camera_y - focus_handle.roll_offset, camera_speed_cap);
                }
            }
        }
    }
}

// Focus on other objects:
if(focus_handle != noone && (!player_exists(0) || focus_handle != global.player_instance[0])) {
    // Camera speed cap:
    camera_speed_cap = 6;

    // Horizontal movement:
    if(focus_handle.x < camera_x) camera_x -= min(camera_x - focus_handle.x, camera_speed_cap);
    else if(focus_handle.x > camera_x) camera_x += min(focus_handle.x - camera_x, camera_speed_cap);

    // Vertical movement:
    if(focus_handle.y < camera_y) camera_y -= min(camera_y - focus_handle.y, camera_speed_cap);
    else if(focus_handle.y > camera_y) camera_y += min(focus_handle.y - camera_y, camera_speed_cap);
}


// Limit camera position:
var view_xhalf, view_yhalf;

view_xhalf = global.display_width / 2;
view_yhalf = global.display_height / 2;
x          = clamp(x, limit_left + view_xhalf, limit_right - view_yhalf);
y          = clamp(y, limit_top + view_yhalf, limit_bottom - view_yhalf);

// Update positions:
x = floor(camera_x + camera_x_shift);
y = floor(camera_y + camera_y_shift);
