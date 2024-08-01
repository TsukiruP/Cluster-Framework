#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Font Initialization

global.font_system     = font_add_sprite(fnt_system, ord(" "), true, 0);
global.font_title_card = font_add_sprite(fnt_title_card_zone, ord(" "), true, -4);
global.font_hud        = font_add_sprite(fnt_hud, ord("0"), false, 1);

global.font_hud_s4e2   = font_add_sprite(fnt_hud_s4e2, ord("0"), false, 1);
global.font_score_s4e2 = font_add_sprite(fnt_score_s4e2, ord("0"), false, 1);
global.font_time_s4e2  = font_add_sprite(fnt_time_s4e2, ord("0"), false, 1);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Initialization

// Text variables:
text_hide        = false;
text_overflow    = false;
text_clear       = false;

text_message = "";
text_length  = 0;
text_current = 0;
text_target  = 0;
text_x       = 42;
text_y       = 70;

text_scroll[0]   = 0;     // Scroll current
text_scroll[1]   = 0;     // Scroll target
text_scroll[2]   = 42;    // Scroll rate
text_scroll[3]   = 3;     // Scroll max
text_scroll[4]   = false; // Scroll complete

text_alpha[0]    = 0;    // Box alpha
text_alpha[1]    = 0.03; // Box rate
text_alpha[2]    = 0;    // Text alpha
text_alpha[3]    = 0.05; // Text rate

// Topic variables:
topic_complete = false;

topic_message  = "";
topic_alpha[0] = 0; // Bar alpha;
topic_alpha[1] = 0; // Text alpha;

// Log variables:
log_hide     = true;
log_message  = "";
log_scroll   = 0;

log_alpha[0] = 0; // Background alpha
log_alpha[1] = 0; // Text alpha

// Height variables:
draw_set_font(global.font_system);

font_height  = string_height("Test");
topic_height = 0;
topic_lines  = 0;
text_height  = 0;
log_height   = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug Initialization

debug_section = 0;

debug_title   = "";
debug_stats   = "";
debug_message = "";

debug_x1      = view_xview[view_current] + 4;
debug_y1      = view_yview[view_current] + 4;
debug_x2      = debug_x1;
debug_y2      = debug_y1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

// Skip:
if (text_clear == false && log_hide == true && (text_alpha[2] == 1 || topic_alpha[1] == 1) && input_get_check(INP_START, CHECK_PRESSED)) {
    text_clear = true;
}

if (text_clear == false) {
    // Hide:
    if (!game_ispaused(ctrl_pause) && (text_message != "" || topic_message != "" || log_alpha[1] != 0) && input_get_check(INP_SELECT, CHECK_PRESSED)) text_hide = !text_hide;

    if (text_hide == false) {
        var scroll_min, scroll_max, scroll_up, scroll_down, scroll_direction;

        // Height:
        draw_set_font(global.font_system);

        topic_height = string_height_ext(topic_message, font_height, global.display_width - (text_x * 2));
        topic_lines  = (topic_height / font_height) - 1;
        text_height  = string_height_ext(text_message[text_current], font_height, global.display_width - (text_x * 2));
        log_height   = string_height_ext(log_message, font_height, global.display_width - text_x);

        // Overflow:
        if (((text_height / font_height) - (text_scroll[0] / font_height) <= text_scroll[3]) && (text_scroll[0] == text_scroll[1])) {
            text_overflow = false;
        } else {
            if (text_scroll[4] == false) text_overflow = true;
        }

        // Open log:
        if ((game_ispaused(ctrl_pause) || text_message != "" || topic_message != "") && log_message != "" && (log_alpha[1] == 0 || log_alpha[1] == 1) && input_get_check(INP_HELP, CHECK_PRESSED)) {
            log_hide = !log_hide;

            if (log_hide == false && log_height > global.display_height - 32) {
                log_scroll = log_height - (global.display_height - 32);
            }
        }

        // Text box:
        if (log_hide == true) {
            // Accept:
            if (input_get_check(INP_ACCEPT, CHECK_PRESSED)) {
                // Topic:
                if (topic_complete == false && topic_message != "" && topic_alpha[1] == 1) {
                    topic_complete = true;
                }

                // Text:
                else if (text_current == text_target && text_alpha[2] == 1) {
                    // Advance text:
                    if (text_overflow == false) {
                        // Update text target:
                        if (text_target != text_length) {
                            text_target += 1;
                        }

                        // Clear text:
                        else {
                            text_clear = true;
                        }
                    }

                    // Advance scroll:
                    else {
                        // Update scroll target:
                        if (text_scroll[4] == true) {
                            text_scroll[1] += text_scroll[2];
                            text_scroll[4]  = false;
                        }
                    }
                }
            }
        }

        // Log:
        else {
            // Cancel:
            if (input_get_check(INP_CANCEL, CHECK_PRESSED)) {
                log_hide = true;
            }
        }

        // Manual Scroll:
        if (log_hide == true) {
            scroll_min = text_scroll[0];
            scroll_max = (text_scroll[0] < text_scroll[1]);
        } else {
            scroll_min = log_scroll;
            scroll_max = ((log_height - log_scroll) > (global.display_height - 32));
        }

        scroll_up        = ((input_get_check(INP_UP, CHECK_PRESSED) || input_get_timer(INP_UP, 30)) && scroll_min > 0);
        scroll_down      = ((input_get_check(INP_DOWN, CHECK_PRESSED) || input_get_timer(INP_DOWN, 30)) && scroll_max);
        scroll_direction = scroll_down - scroll_up;

        // Textbox scroll:
        if (log_hide == true && text_scroll[1] != 0 && (text_scroll[4] == true)) {
            text_scroll[0] += scroll_direction;
        }

        // Log scroll:
        else if (log_hide == false && (log_height > global.display_height - 32)) {
            log_scroll += scroll_direction;
        }
    }
}

// Automatic Scroll:
if (text_overflow == true) {
    if (text_scroll[4] == false) {
        if (text_scroll[0] < text_scroll[1]) {
            text_scroll[0] += 1;
        } else {
            text_scroll[0] = text_scroll[1];
            text_scroll[4] = true;
        }
    }
} else {
    if (text_scroll[0] == text_scroll[1] && text_scroll[1] != 0) {
        if (text_scroll[4] != true) text_scroll[4] = true;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug

var menu_left, menu_right, menu_direction, player_handle;

// Menu:
menu_left      = keyboard_check_pressed(vk_numpad4);
menu_right     = keyboard_check_pressed(vk_numpad6);
menu_direction = menu_right - menu_left;

if (menu_direction != 0) {
    debug_section += menu_direction;
}

debug_section = wrap(debug_section, 0, 5);

// Player handle:
player_handle = instance_player(0);

// Sections
switch (debug_section) {
    // Player:
    case 1:
        // Title:
        debug_title = "- Player -";

        if (instance_exists(player_handle)) {
            var player_x, player_y, player_action_current, player_action_previous, player_g_speed, player_x_speed, player_y_speed, player_ground, player_mode, player_layer, player_angle;

            // Player variables:
            player_x              = floor(player_handle.x);
            player_y              = floor(player_handle.y);

            player_action_current  = (script_get_name(player_handle.action_current));
            player_action_previous = (script_get_name(player_handle.action_previous));

            player_g_speed         = player_handle.g_speed;
            player_x_speed         = player_handle.x_speed;
            player_y_speed         = player_handle.y_speed;

            player_ground          = player_handle.ground;
            player_layer           = player_handle.layer;
            player_angle           = player_handle.ground_angle;

            // Stats:
            debug_stats = "X: " + string(player_x) + "#" +
                        "Y: " + string(player_y) + "#" + "#" +
                        "Action: " + player_action_current + "#" +
                        "Prev: " + player_action_previous + "#" + "#" +
                        "Ground Speed: " + string(player_g_speed) + "#" +
                        "X Speed: " + string(player_x_speed) + "#" +
                        "Y Speed: " + string(player_y_speed);
        }
        break;

    // Character:
    case 2:
        // Title:
        debug_title = "- Character -";

        if (instance_exists(player_handle)) {
            // Stats:
            switch (player_handle.character_id) {
                default:
                    debug_stats = "Clock Up State: " + string(player_handle.clock_up_state) + "#" +
                                    "Clock Up Alarm: " + string(player_handle.clock_up_alarm) + "#" +
                                    "Clock Up Timer: " + string(player_handle.clock_up_timer);
            }
        }
        break;

    // Status:
    case 3:
        // Title:
        debug_title = "- Status -";

        if (instance_exists(player_handle)) {
            var player_shield, player_usable, player_state, player_invin, player_invin_alarm, player_speed, player_speed_alarm, player_panic, player_panic_alarm, player_swap, player_swap_alarm;

            // Player variables:
            player_shield      = player_handle.status_shield;
            player_usable      = player_handle.status_shield_usable;
            player_state       = player_handle.status_shield_state;

            player_invin       = player_handle.status_invin;
            player_invin_alarm = player_handle.status_invin_alarm;

            player_speed       = player_handle.status_speed;
            player_speed_alarm = player_handle.status_speed_alarm;

            player_panic       = player_handle.status_panic;
            player_panic_alarm = player_handle.status_panic_alarm;

            player_swap        = player_handle.status_swap;
            player_swap_alarm  = player_handle.status_swap_alarm;

            // Stats:
            debug_stats = "Shield: " + string(player_shield) + "#" +
                            "Usable: " + string(player_usable) + "#" +
                            "State: " + string(player_state) + "#" + "#" +
                            "Invin: " + string(player_invin) + "#" +
                            "Invin Alarm: " + string(player_invin_alarm);
        }
        break;

    // Water:
    case 4:
        // Title:
        debug_title = "- W ater -";

        if (instance_exists(player_handle)) {
            var player_surface, player_splash, player_underwater, player_air, player_alarm, player_countdown;

            // Player variables:
            player_surface    = player_handle.water_surface;
            player_splash     = player_handle.splash_alarm;

            player_underwater = player_handle.underwater;
            player_air        = player_handle.air_remaining;
            player_alarm      = player_handle.air_alarm;

            player_countdown  = player_handle.drown_countdown;

            // Stats:
            debug_stats = "Surface: " + string(player_surface) + "#" +
                            "Splash Alarm: " + string(player_splash) + "#" + "#" +

                            "Underwater: " + string(player_underwater) + "#" +
                            "Air: " + string(player_air) + "#" +
                            "Air Alarm: " + string(player_alarm) + "#" + "#" +

                            "Countdown: " + string(player_countdown);
        }
        break;

    // Animation:
    case 5:
        // Title:
        debug_title = "- Animation -";

        if (instance_exists(player_handle)) {
            var player_current, player_target, player_previous, player_variant, player_finished, player_reverse, player_alarm;

            // Player variables:
            player_current  = player_handle.animation_current;
            player_target   = player_handle.animation_target;
            player_previous = player_handle.animation_previous;
            player_variant  = player_handle.animation_variant;

            player_finished = player_handle.animation_finished;
            player_reverse  = player_handle.animation_reverse;
            player_alarm    = player_handle.animation_alarm;

            // Stats:
            debug_stats = "Current: " + string(player_current) + "#" +
                            "Target: " + string(player_target) + "#" +
                            "Previous: " + string(player_previous) + "#" +
                            "Variant: " + string(player_variant) + "#" + "#" +

                            "Finished: " + string(player_finished) + "#" +
                            "Reversed: " + string(player_reverse) + "#" +
                            "Alarm: " + string(player_alarm);
        }
        break;

    // Game:
    default:
        // Title:
        debug_title = "- Game -";

        // Stats:
        debug_stats = "Game Speed: " + string_format(global.game_speed, 1, 2) + "#" +
                        "Game Time: " + string(global.game_time) + "#" +
                        "Object Time: " + string(global.object_time) + "#" +
                        "Rings: " + string(global.game_rings) + "#" +
                        "Score: " + string(global.game_score) + "#" + "#" +

                        "Room: " + string(room) + "#" +
                        "Room Name: " + room_name(room) + "#" + "#" +

                        "Checkpoint X: " + string(global.checkpoint_x) + "#" +
                        "Checkpoint Y: " + string(global.checkpoint_y) + "#" +
                        "Checkpoint Time: " + string(global.checkpoint_time);
}

debug_message = debug_title + "#" + debug_stats;
debug_x2      = debug_x1 + string_width(debug_message) + 8;
debug_y2      = debug_y1 + string_height(debug_message) + 8;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Topic Alpha

// Fade in topic:
if (text_clear == false && topic_complete == false && topic_message != "") {
    // Bar:
    if (topic_alpha[0] < 0.6) {
        topic_alpha[0] += text_alpha[1];
    } else {
        topic_alpha[0] = 0.6;
    }

    // Topic:
    if (topic_alpha[1] < 1) {
        // Add topic to log:
        if (topic_alpha[1] == 0) log_message += topic_message + "#";

        topic_alpha[1] += text_alpha[3];
    } else {
        topic_alpha[1] = 1;
    }
}

// Fade out topic:
else {
    // Bar:
    if (topic_alpha[0] > 0) {
        topic_alpha[0] -= text_alpha[1];
    } else {
        topic_alpha[0] = 0;
    }

    // Topic:
    if (topic_alpha[1] > 0) {
        topic_alpha[1] -= text_alpha[3];
    } else {
        topic_alpha[1] = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Alpha

// Fade in text:
if (text_clear == false && text_message != "" && (topic_complete == true || topic_message == "")) {
    // Box:
    if (text_alpha[0] < 0.6) {
        text_alpha[0] += text_alpha[1];
    } else {
        text_alpha[0] = 0.6;
    }

    // Text:
    if (text_current == text_target) {
        if (text_alpha[2] < 1) {
            // Add text to log:
            if (text_alpha[2] == 0) log_message += text_message[text_current] + "#";

            text_alpha[2] += text_alpha[3];
        } else {
            text_alpha[2] = 1;
        }
    }

    // Fade out text:
    else {
        if (text_alpha[2] > -0.5) {
            text_alpha[2] -= text_alpha[3];

            if (text_alpha[2] == -0.5) {
                text_current   = text_target;

                text_scroll[0] = 0;
                text_scroll[1] = 0;
                text_scroll[4] = false;

                text_alpha[2]  = 0;

                text_overflow  = false;
            }
        }
    }
}

// Fade out text:
else {
    // Box:
    if (text_alpha[0] > 0) {
        text_alpha[0] -= text_alpha[1];
    } else {
        text_alpha[0] = 0;
    }

    // Text:
    if (text_alpha[2] > 0) {
        text_alpha[2] -= text_alpha[3];
    } else {
        text_alpha[2] = 0;
    }
}

if (text_clear == true && (text_message != "" || topic_message != "") && text_alpha[2] == 0 && topic_alpha[0] == 0) {
    text_hide      = false;
    text_clear     = false;

    text_message   = "";
    text_length    = 0;
    text_current   = 0;
    text_target    = 0;

    text_scroll[0] = 0;
    text_scroll[1] = 0;
    text_scroll[4] = false;

    topic_complete = false;
    topic_message  = "";

    log_hide       = true;
    log_message   += "#";
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Log Alpha

if (log_hide == false) {
    // Background:
    if (log_alpha[0] < 0.6) {
        log_alpha[0] += text_alpha[1];
    } else {
        log_alpha[0] = 0.6;
    }

    // Log:
    if (log_alpha[1] < 1) {
        log_alpha[1] += text_alpha[3];
    } else {
        log_alpha[1] = 1;
    }
} else {
    // Background:
    if (log_alpha[0] > 0) {
        log_alpha[0] -= text_alpha[1];
    } else {
        log_alpha[0] = 0;
    }

    // Log:
    if (log_alpha[1] > 0) {
        log_alpha[1] -= text_alpha[3];
    } else {
        log_alpha[1] = 0;
    }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Release fonts

font_delete(global.font_system);
font_delete(global.font_title_card);
font_delete(global.font_hud);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Topic

// Don't draw if hidden:
if (text_hide == true) {
    exit;
}

// Viewport:
d3d_set_viewport(0, 0, global.display_width, global.display_height);

// Box:
draw_set_color(make_color_rgb(global.textbox_red, global.textbox_green, global.textbox_blue));
draw_set_alpha(topic_alpha[0]);

draw_rectangle(0, (global.display_height / 2) - 9 - ((font_height / 2) * topic_lines), global.display_width, (global.display_height / 2) + 10 + ((font_height / 2) * topic_lines), false);

// Topic:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(topic_alpha[1]);

// Topic:
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(global.display_width / 2, global.display_height / 2, topic_message);

// Reset:
draw_reset();
d3d_set_viewport(0, 0, global.display_width, global.display_height);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Text

// Don't draw if hidden:
if (text_hide == true) {
    exit;
}

// Box:
draw_set_color(make_color_rgb(global.textbox_red, global.textbox_green, global.textbox_blue));
draw_set_alpha(text_alpha[0]);

draw_rectangle(0, global.display_height - 19 - 59, global.display_width, global.display_height - 19, false);

// Viewport:
d3d_set_viewport(0, global.display_height - text_y, global.display_width, font_height * 3);

// Font:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(text_alpha[2]);

// Text:
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(text_x, -text_scroll[0], text_message[text_current], font_height, global.display_width - (text_x * 2));

// Arrow:
draw_set_alpha(1);
d3d_set_viewport(0, 0, global.display_width, global.display_height);

if (text_overflow == true && text_scroll[4] == true && text_alpha[2] == 1) {
    draw_sprite(fnt_system, 95, (global.display_width / 2) - 6, global.display_height - 29);
}

// Reset:
draw_reset();
d3d_set_viewport(0, 0, global.display_width, global.display_height);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Log

// Don't draw if hidden:
if (text_hide == true) {
    exit;
}

// Background:
draw_set_color(c_black);
draw_set_alpha(log_alpha[0]);

draw_rectangle(0, 0, global.display_width, global.display_height, false);

// Viewport:
d3d_set_viewport(0, 16, global.display_width, global.display_height - 32);

// Font:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(log_alpha[1]);

// Log:
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(text_x / 2, -log_scroll, log_message, font_height, global.display_width - text_x);

// Reset:
draw_reset();
d3d_set_viewport(0, 0, global.display_width, global.display_height);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Debug

// Box:
draw_set_color(make_color_rgb(global.textbox_red, global.textbox_green, global.textbox_blue));
draw_set_alpha(0.6);

draw_rectangle(debug_x1, debug_y1, debug_x2, debug_y2, false);

// Font:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(1);

// Title:
draw_set_halign(fa_center);
draw_set_valign(fa_top);

draw_text_ext((debug_x1 + debug_x2) div 2, debug_y1 + 4, debug_title, font_height, debug_x2 - debug_x1);

// Stats:
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(debug_x1 + 4, debug_y1 + 4 + string_height(debug_title), debug_stats, font_height, debug_x2 - debug_x1);

// Reset:
draw_reset();
