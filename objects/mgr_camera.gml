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
limit_left = 0;
limit_right = room_width;
limit_top = 0;
limit_bottom = room_height;

// Focus handle:
focus_handle = player_get_instance(0);

// Camera variables:
camera_x = x;
camera_y = y;
camera_x_shift = 0;
camera_y_shift = 0;
camera_speed_cap = 16;
camera_lag_alarm = 0;
camera_look_timer = 0;
camera_position_distance = 0;

// Border variables:
border_left = 0;
border_right = 0;
border_top = 0;
border_bottom = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lag

// Exit if the stage is paused:
if (game_ispaused(mgr_pause))
{
    exit;
}

if (camera_lag_alarm > 0)
{
    camera_lag_alarm -= 1;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shift

// Exit if the stage is paused:
if (game_ispaused(mgr_pause))
{
    exit;
}

// Shift around the player:
if (instance_exists(player_get_instance(0)))
{
    if (focus_handle == player_get_instance(0))
    {
        var look_direction;

        // Look direction:
        look_direction = (focus_handle.state_current == player_state_crouch) - (focus_handle.state_current == player_state_look);

        if (look_direction != 0)
        {
            // Look timer:
            if (camera_look_timer < 120)
            {
                camera_look_timer += 1;
            }

            if (camera_look_timer == 120)
            {
                switch (look_direction)
                {
                    // Shift upwards:
                    case -1:
                        if (camera_y_shift > -104)
                        {
                            camera_y_shift -= 2;
                        }
                        break;

                    // Shift downwards:
                    case 1:
                        if (camera_y_shift < 88)
                        {
                            camera_y_shift += 2;
                        }
                        break;
                }
            }
        }

        // Reset:
        else
        {
            // Reset:
            if (camera_y_shift != 0)
            {
                camera_y_shift = max(abs(camera_y_shift) - 2, 0) * sign(camera_y_shift);
            }

            if (camera_look_timer != 0)
            {
                camera_look_timer = 0;
            }
        }

        // Peel out pan:
        if ((focus_handle.state_current == sonic_state_peel_out && focus_handle.peel_out_alarm <= 14) || focus_handle.peel_out == true)
        {
            if (camera_x_shift != 64 * focus_handle.image_xscale)
            {
                camera_x_shift += 2 * focus_handle.image_xscale;
            }
        }
        else
        {
            if (camera_x_shift != 0)
            {
                camera_x_shift = max(abs(camera_x_shift) - 2, 0) * sign(camera_x_shift);
            }
        }

        /*
        // Look timer:
        if (abs(camera_look_timer) != 120)
        {
            camera_look_timer += look_direction;
        }

        // Reset:
        if (sign(camera_look_timer) != look_direction)
        {
            camera_look_timer = 0;
        }

        // Shift camera upwards:
        if (camera_y_shift > -104 && camera_look_timer <= -120)
        {
            camera_y_shift = max(camera_y_shift - 2, -104);
        }

        // Shift camera downwards:
        else if (camera_y_shift < 88 && camera_look_timer >= 120)
        {
            camera_y_shift = min(camera_y_shift + 2, 88);
        }

        // Center camera:
        else if (camera_y_shift != 0)
        {
            camera_y_shift = max(abs(camera_y_shift) - 2, 0) * sign(camera_y_shift);
        }

        // Camera pan:
        //if ((focus_handle.state_state == ACTION_PEEL_OUT && focus_handle.peel_out_timer > 15) || focus_handle.peel_out_flag == true) {
        //camera_x_shift = approach(camera_x_shift, 64 * focus_handle.image_xscale, 2);
        //} else {
        camera_x_shift = max(0, abs(camera_x_shift - 2) * sign(camera_x_shift));
        //}
        */
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

// Update borders:
border_left = camera_x - 8;
border_right = camera_x + 8;
border_top = camera_y - 32;
border_bottom = camera_y + 32;

// Exit if the stage is paused:
if (game_ispaused(mgr_pause))
{
    exit;
}

if (instance_exists(focus_handle))
{
    // Player focus:
    if (focus_handle == player_get_instance(0))
    {
        if (camera_position_distance == 0)
        {
            if (camera_lag_alarm == 0)
            {
                var player_offset;

                // Player offset:
                player_offset = 0;

                if (focus_handle.on_ground == true)
                {
                    player_offset = focus_handle.y_offset * dsin(focus_handle.mask_rotation);
                }

                // Move left:
                if (focus_handle.x < (border_left - player_offset))
                {
                    camera_x -= min((border_left - player_offset) - focus_handle.x, 24);
                }

                // Move right:
                else if (focus_handle.x > (border_right + player_offset))
                {
                    camera_x += min(focus_handle.x - (border_right + player_offset), 24);
                }

                // Vertical movement:
                if (focus_handle.state_current != player_state_death)
                {
                    var focus_y;

                    // Have the camera compare a bit higher on the screen:
                    focus_y = focus_handle.y;

                    // Airborne:
                    if (focus_handle.on_ground == false)
                    {
                        // Move up:
                        if (focus_y < border_top)
                        {
                            camera_y -= min(border_top - focus_y, 24);
                        }

                        // Move down:
                        else if (focus_y > border_bottom)
                        {
                            camera_y += min(focus_y - border_bottom, 24);
                        }
                    }

                    // Ground:
                    else if (focus_handle.on_ground == true)
                    {
                        var camera_speed_cap;

                        // Speed cap:
                        camera_speed_cap = 6;

                        if (focus_handle.x_speed >= 8)
                        {
                            camera_speed_cap = 24;
                        }

                        // Move up:
                        if (focus_y < (camera_y - focus_handle.y_offset))
                        {
                            camera_y -= min((camera_y - focus_handle.y_offset) - focus_y, camera_speed_cap);
                        }

                        // Move down:
                        else if (focus_y > (camera_y + focus_handle.y_offset))
                        {
                            camera_y += min(focus_y - (camera_y + focus_handle.y_offset), camera_speed_cap);
                        }
                    }
                }
            }
        }
    }

    // Object focus:
    else
    {
        // Horizontal:
        if (focus_handle.x != camera_x)
        {
            var camera_distance_x;

            // Distance:
            camera_distance_x = focus_handle.x - camera_x;

            camera_x += min(abs(camera_distance_x), 6) * sign(camera_distance_x);
        }

        // Vertical:
        if (focus_handle.y != camera_y)
        {
            var camera_distance_y;

            // Distance:
            camera_distance_y = focus_handle.y - camera_y;

            camera_y += min(abs(camera_distance_y), 6) * sign(camera_distance_y);
        }
    }
}

// Limit camera position:
var view_xhalf, view_yhalf;

view_xhalf = global.display_width / 2;
view_yhalf = global.display_height / 2;
x = clamp(x, limit_left + view_xhalf, limit_right - view_yhalf);
y = clamp(y, limit_top + view_yhalf, limit_bottom - view_yhalf);

// Update positions:
x = floor(camera_x + camera_x_shift);
y = floor(camera_y + camera_y_shift) + 16;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Camera
/*
// Exit if not in debug mode:
if (global.game_debug == false) {
    exit;
}

// Borders:
draw_rectangle(floor(camera_x) - 8, floor(camera_y) - 32, floor(camera_x) + 8, floor(camera_y) + 32, true);

// Center:
draw_line(floor(camera_x) - 8, floor(camera_y), floor(camera_x) + 8, floor(camera_y));
