#define Create_0
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
font_height  = 0;
topic_height = 0;
topic_lines  = 0;
text_height  = 0;
log_height   = 0;
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
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

// Skip:
if (text_clear == false && log_hide == true && (text_alpha[2] == 1 || topic_alpha[1] == 1) && input_check(INP_START, CHECK_PRESSED)) text_clear = true;

if (text_clear == false) {
    // Hide:
    if (!game_paused(ctrl_pause) && (text_message != "" || topic_message != "" || log_alpha[1] != 0) && input_check(INP_SELECT, CHECK_PRESSED)) text_hide = !text_hide;

    if (text_hide == false) {
        var scroll_min, scroll_max, scroll_direction;

        // Height:
        draw_set_font(global.font_system);

        font_height  = string_height("Test");
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
        if ((game_paused(ctrl_pause) || text_message != "" || topic_message != "") && log_message != "" && (log_alpha[1] == 0 || log_alpha[1] == 1) && input_check(INP_HELP, CHECK_PRESSED)) {
            log_hide = !log_hide;

            if (log_hide == false && log_height > global.display_height - 32) {
                log_scroll = log_height - (global.display_height - 32);
            }
        }

        // Text box:
        if (log_hide == true) {
            // Accept:
            if (input_check(INP_ACCEPT, CHECK_PRESSED)) {
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
            if (input_check(INP_CANCEL, CHECK_PRESSED)) {
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

        scroll_direction = ((input_check(INP_DOWN, CHECK_PRESSED) || ctrl_input.input_timer[INP_DOWN] > 25) && scroll_max) - ((input_check(INP_UP, CHECK_PRESSED) || ctrl_input.input_timer[INP_UP] > 25) && scroll_min > 0);

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
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_text(global.display_width / 2, global.display_height / 2, topic_message);

// Reset draw variables:
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
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

// Text:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(text_alpha[2]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(text_x, -text_scroll[0], text_message[text_current], font_height, global.display_width - (text_x * 2));

// Arrow:
draw_set_alpha(1);
d3d_set_viewport(0, 0, global.display_width, global.display_height);

if (text_overflow == true && text_scroll[4] == true && text_alpha[2] == 1) {
    draw_sprite(fnt_system, 95, (global.display_width / 2) - 6, global.display_height - 29);
}

// Reset draw variables:
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
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

// Log:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(log_alpha[1]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text_ext(text_x / 2, -log_scroll, log_message, font_height, global.display_width - text_x);

// Reset draw variables:
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
d3d_set_viewport(0, 0, global.display_width, global.display_height);
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
topic_message_set("Work in Progress");

text_message_set(
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et ex porttitor, laoreet neque a, imperdiet ipsum. Vestibulum eu sapien dapibus, aliquam ex eget, tempus enim. In placerat ipsum nunc, eu condimentum ipsum ornare eget. Praesent tortor turpis, mattis vel pretium vel, luctus vitae justo. Maecenas nibh ligula, fringilla eget magna sed, malesuada malesuada orci. Praesent eu pulvinar eros. Nulla facilisi. Duis iaculis sollicitudin lacus.",
"Cras ornare consequat urna at tristique. Mauris interdum risus at tellus suscipit, nec aliquam velit porttitor. Nunc non ante et purus sollicitudin hendrerit. Nulla rhoncus, nisl id finibus rhoncus, magna eros volutpat lorem, in elementum augue sapien sit amet libero. Morbi eu dui in leo porttitor pellentesque placerat in ante. Curabitur ut mauris laoreet, suscipit nibh vel, vehicula diam. In dapibus tincidunt nisl, vitae tincidunt odio gravida sit amet. Curabitur aliquam urna id leo consequat, et eleifend magna consectetur. Donec vestibulum nunc eget eros dapibus, id suscipit mi condimentum. In et efficitur lorem. Interdum et malesuada fames ac ante ipsum primis in faucibus. Nunc at porttitor diam. Nulla scelerisque urna non ligula vulputate, nec consectetur sapien lobortis. Morbi ultrices vel dui pellentesque laoreet.");
