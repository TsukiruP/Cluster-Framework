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
focus_handle = player_exists(0);

// Camera variables:
camera_x                 = x;
camera_y                 = y;
camera_x_shift           = 0;
camera_y_shift           = 0;
camera_speed_cap         = 16;
camera_lag_alarm         = 0;
camera_look_timer        = 0;
camera_position_distance = 0;

// Border variables:
border_left   = 0;
border_right  = 0;
border_top    = 0;
border_bottom = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lag

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

if (camera_lag_alarm > 0) {
    camera_lag_alarm -= 1;
} else {
    camera_lag_alarm = 0;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shift

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

// Shift around the player:
if (focus_handle != noone) {
    if (focus_handle == player_exists(0)) {
        var look_direction;

        // Look direction:
        look_direction = (focus_handle.action_current == player_action_crouch) - (focus_handle.action_current == player_action_look);

        // Look timer:
        camera_look_timer = clamp(camera_look_timer + (1 * look_direction), -120, 120);
        
        if (sign(camera_look_timer) != look_direction) {
            camera_look_timer = 0;
        }
        
        // Shift camera upwards:
        if (camera_look_timer <= -120) {
            camera_y_shift = max(camera_y_shift - 2, - 104);
        }
        
        // Shift camera downwards:
        else if (camera_look_timer >= 120) {
            camera_y_shift = min(camera_y_shift + 2, 88);
        }
        
        // Center camera:
        else {
            camera_y_shift = max(abs(camera_y_shift) - 2, 0) * sign(camera_y_shift);
        }

        // Camera pan:
        //if ((focus_handle.action_state == ACTION_PEEL_OUT && focus_handle.peel_out_timer > 15) || focus_handle.peel_out_flag == true) {
            //camera_x_shift = approach(camera_x_shift, 64 * focus_handle.image_xscale, 2);
        //} else {
            camera_x_shift = max(0, abs(camera_x_shift - 2) * sign(camera_x_shift));
       //}
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Update borders:
border_left   = camera_x - 8;
border_right  = camera_x + 8;
border_top    = camera_y - 32;
border_bottom = camera_y + 32;

// Don't bother if the stage is paused:
if (game_is_paused(ctrl_pause)) {
    exit;
}

if (focus_handle != noone) {
    // Player focus:
    if (focus_handle == player_exists(0)) {
        // Speed cap:
        camera_speed_cap = 16;
        
        if (camera_position_distance == 0) {
            // Horizontal movement:
            if (camera_lag_alarm == 0) {
                // Move left:
                if (focus_handle.x < border_left) {
                    camera_x -= min(border_left - focus_handle.x, camera_speed_cap);
                }
                
                // Move right:
                else if (focus_handle.x > border_right) {
                    camera_x += min(focus_handle.x - border_right, camera_speed_cap);
                }
                
                // Vertical movement:
                if (focus_handle.action_current != player_action_death) {
                    var roll_offset, reference_up, reference_bottom;
                    
                    // Roll offset:
                    roll_offset = focus_handle.roll_offset * focus_handle.y_direction;
                    
                    // References:
                    if (focus_handle.ground == true) {
                        reference_up     = camera_y;
                        reference_bottom = camera_y;
                    } else {
                        reference_up     = border_top;
                        reference_bottom = border_bottom;
                    }
                    
                    // Move up:
                    if (focus_handle.y < (reference_up + roll_offset)) {
                        camera_y -= min(reference_up - (focus_handle.y - roll_offset), camera_speed_cap);
                    }
                    
                    // Move down:
                    else if (focus_handle.y > (reference_bottom + roll_offset)) {
                        camera_y += min((focus_handle.y - (roll_offset)) - reference_bottom, camera_speed_cap);
                    }
                }
            }
        }
    }
    
    // Object focus:
    else {
        // Speed cap:
        camera_speed_cap = 6;
        
        // Move left:
        if (focus_handle.x < camera_x) {
            camera_x -= min(camera_x - focus_handle.x, camera_speed_cap);
        }
        
        // Move right:
        else if (focus_handle.x > camera_x) {
            camer_x += min(focus_handle.x - camera_x, camera_speed_cap);
        }
        
        // Move up:
        if (focus_handle.y < camera_y) {
            camera_y -= min(focus_handle.y - camera_y, camera_speed_cap);
        }
        
        // Move down:
        else if (focus_handle.y > camera_y) {
            camera_y += min(focus_handle.y - camera_y, camera_speed_cap);
        }
    }
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
