#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Initialization

view_object[0] = id;

limit_left = 0;
limit_right = room_width;
limit_top = 0;
limit_bottom = room_height;

focus_handle = stage_get_player(0);

camera_x = x;
camera_y = y;
camera_x_shift = 0;
camera_y_shift = 0;
camera_speed_cap = 16;
camera_lag_alarm = 0;
camera_look_alarm = 120;
camera_position_distance = 0;

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

if (game_ispaused(mnu_pause))
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

if (game_ispaused(mnu_pause))
{
    exit;
}

if (instance_exists(stage_get_player(0)))
{
    if (focus_handle == stage_get_player(0))
    {
        var look_direction;

        look_direction = (focus_handle.state_current == player_state_crouch) - (focus_handle.state_current == player_state_look);

        if (look_direction != 0)
        {
            if (camera_look_alarm > 0)
            {
                camera_look_alarm -= 1;
            }

            if (camera_look_alarm == 0)
            {
                switch (look_direction)
                {
                    case -1:
                        if (camera_y_shift > -104)
                        {
                            camera_y_shift -= 2;
                        }
                        break;

                    case 1:
                        if (camera_y_shift < 88)
                        {
                            camera_y_shift += 2;
                        }
                        break;
                }
            }
        }
        else
        {
            if (camera_y_shift != 0)
            {
                camera_y_shift = max(abs(camera_y_shift) - 2, 0) * sign(camera_y_shift);
            }

            if (camera_look_alarm != 120)
            {
                camera_look_alarm = 120;
            }
        }

        if ((focus_handle.state_current == sonic_state_peel_out && focus_handle.peel_out_alarm <= 14) || focus_handle.peel_out)
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
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

border_left = camera_x - 8;
border_right = camera_x + 8;
border_top = camera_y - 32;
border_bottom = camera_y + 32;

if (game_ispaused(mnu_pause))
{
    exit;
}

if (instance_exists(focus_handle))
{
    if (focus_handle == stage_get_player(0))
    {
        if (camera_position_distance == 0)
        {
            if (camera_lag_alarm == 0)
            {
                var player_offset;

                player_offset = 0;

                if (focus_handle.on_ground)
                {
                    player_offset = focus_handle.camera_offset * dsin(focus_handle.mask_rotation);
                }

                if (focus_handle.x < (border_left - player_offset))
                {
                    camera_x -= min((border_left - player_offset) - focus_handle.x, 24);
                }
                else if (focus_handle.x > (border_right + player_offset))
                {
                    camera_x += min(focus_handle.x - (border_right + player_offset), 24);
                }

                if (focus_handle.state_current != player_state_death)
                {
                    var focus_y;

                    focus_y = focus_handle.y;

                    if (!focus_handle.on_ground)
                    {
                        if (focus_y < border_top)
                        {
                            camera_y -= min(border_top - focus_y, 24);
                        }

                        else if (focus_y > border_bottom)
                        {
                            camera_y += min(focus_y - border_bottom, 24);
                        }
                    }
                    else if (focus_handle.on_ground)
                    {
                        var camera_speed_cap;

                        camera_speed_cap = 6;

                        if (focus_handle.x_speed >= 8)
                        {
                            camera_speed_cap = 24;
                        }

                        if (focus_y < (camera_y - focus_handle.camera_offset))
                        {
                            camera_y -= min((camera_y - focus_handle.camera_offset) - focus_y, camera_speed_cap);
                        }
                        else if (focus_y > (camera_y + focus_handle.camera_offset))
                        {
                            camera_y += min(focus_y - (camera_y + focus_handle.camera_offset), camera_speed_cap);
                        }
                    }
                }
            }
        }
    }
    else
    {
        if (focus_handle.x != camera_x)
        {
            var camera_distance_x;

            camera_distance_x = focus_handle.x - camera_x;
            camera_x += min(abs(camera_distance_x), 6) * sign(camera_distance_x);
        }

        if (focus_handle.y != camera_y)
        {
            var camera_distance_y;

            camera_distance_y = focus_handle.y - camera_y;
            camera_y += min(abs(camera_distance_y), 6) * sign(camera_distance_y);
        }
    }
}

var view_xhalf, view_yhalf;

view_xhalf = screen_get_width() / 2;
view_yhalf = screen_get_height() / 2;
x = clamp(x, limit_left + view_xhalf, limit_right - view_yhalf);
y = clamp(y, limit_top + view_yhalf, limit_bottom - view_yhalf);
x = floor(camera_x + camera_x_shift);
y = floor(camera_y + camera_y_shift) + 16;
