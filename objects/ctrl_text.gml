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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Initialization

// Text variables:
text_state       = 0;
text_message     = "";
text_length      = 0;
text_current     = 0;
text_target      = 0;
text_position[0] = 42; // Text x
text_position[1] = 70; // Text y

text_scroll[0]   = 0;     // Scroll current
text_scroll[1]   = 0;     // Scroll target
text_scroll[2]   = 42;    // Scroll rate
text_scroll[3]   = 3;     // Scroll max
text_scroll[4]   = false; // Scroll complete

text_alpha[0]    = 0;    // Box alpha
text_alpha[1]    = 0.03; // Box rate
text_alpha[2]    = 0;    // Text alpha
text_alpha[3]    = 0.05; // Text rate

text_hide        = false;
text_overflow    = false;
text_clear       = false;

// Header variables:
header_message = 0;

// Log variables:
log_hide     = true;
log_message  = "";
log_scroll   = 0;

log_alpha[0] = 0; // Background alpha
log_alpha[1] = 0; // Text alpha
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Tuesday

if (text_clear == false) {
    // Check log:
    if (log_hide == true) {
        // Advance text:
        if (text_current == text_target && text_alpha[2] == 1 && text_overflow == false && input_check(INP_ACCEPT, CHECK_PRESSED)) {
            // Update text target:
            if (text_target != text_length) {
                text_target += 1;
            }

            // Clear text:
            else {
                text_clear   = true;
                log_message += "#";
            }
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Box Alpha

if (text_clear == false) {
    if (text_message != "") {
        // Box:
        if (text_alpha[0] < 0.6) {
            text_alpha[0] += text_alpha[1];
        } else {
            text_alpha[0] = 0.6;
        }

        // Text:
        if (text_clear == false) {
            // Fade in text:
            if (text_current == text_target) {
                if (text_alpha[2] < 1) {
                    // Add message to log:
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
    }
}

// Clear text:
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

    if (text_alpha[0] == 0 && text_alpha[2] == 0) {
        text_message   = "";
        text_length    = 0;
        text_current   = 0;
        text_target    = 0;

        text_scroll[0] = 0;
        text_scroll[1] = 0;
        text_scroll[4] = false;

        text_overflow  = false;
        text_clear     = false;
    }
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
/// Draw Text Box

if (text_message != "") {
    var font_height, text_height;

    // Box:
    draw_set_color(c_blue);
    draw_set_alpha(text_alpha[0]);

    draw_rectangle(view_xview[view_current], view_yview[view_current] + global.display_height - 19 - 59, view_xview[view_current] + global.display_width, view_yview[view_current] + global.display_height - 19, false);

    // Font:
    draw_set_font(global.font_system);
    draw_set_color(c_white);
    draw_set_alpha(text_alpha[2]);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    font_height = string_height("Test");
    text_height = string_height_ext(text_message[text_current], font_height, global.display_width - (text_position[0] * 2));

    // Cutoff:
    d3d_set_viewport(0, global.display_height - text_position[1], global.display_width, font_height * 3);

    // Overflow:
    if (((text_height / font_height) - (text_scroll[0] / font_height) <= text_scroll[3]) && (text_scroll[0] == text_scroll[1])) {
        text_overflow = false;
    } else {
        if (text_scroll[4] == false) text_overflow = true;
    }

    // Scroll:
    if (log_hide == true) {
        if (text_overflow == true) {
            if (text_scroll[4] == true && input_check(INP_ACCEPT, CHECK_PRESSED)) {
                text_scroll[0]  = text_scroll[1];
                text_scroll[1] += text_scroll[2];
                text_scroll[4]  = false;
            }

            if (text_scroll[4] == false) {
                if (text_scroll[0] < text_scroll[1]) text_scroll[0] += 1;
                else {
                    text_scroll[0] = text_scroll[1];
                }

                if (text_scroll[0] = text_scroll[1]) text_scroll[4] = true;
            }
        }

        if (text_scroll[4] == true && text_scroll[1] != 0) {
            var scroll_direction;

            scroll_direction = ((input_check(INP_DOWN, CHECK_PRESSED) || ctrl_input.input_timer[INP_DOWN] > 25) && text_scroll[0] < text_scroll[1]) - ((input_check(INP_UP, CHECK_PRESSED) || ctrl_input.input_timer[INP_UP] > 25) && text_scroll[0] > 0);
            text_scroll[0]  += scroll_direction;
        }
    }

    // Text:
    draw_text_ext(text_position[0], -text_scroll[0], text_message[text_current], font_height, global.display_width - (text_position[0] * 2));
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

var font_height, log_height;

// Background:
draw_set_color(c_black);
draw_set_alpha(log_alpha[0]);

draw_rectangle(0, 0, global.display_width, global.display_height, false);

// Font:
draw_set_font(global.font_system);
draw_set_color(c_white);
draw_set_alpha(log_alpha[1]);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

font_height = string_height("Test");
log_height  = string_height_ext(log_message, font_height, global.display_width - text_position[0]);

// Hide:
if (input_check(INP_HELP, CHECK_PRESSED) && (log_alpha[0] == 0 || log_alpha[1] == 1)) {
    log_hide = !log_hide;

    if (log_hide == false && log_height > global.display_height - 32) {
        log_scroll = log_height - (global.display_height - 32);
    }
}

// Scroll:
if (log_height > global.display_height - 32) {
    var scroll_direction;

    scroll_direction = ((input_check(INP_DOWN, CHECK_PRESSED) || ctrl_input.input_timer[INP_DOWN] > 25) && ((log_height - log_scroll) > (global.display_height - 32))) - ((input_check(INP_UP, CHECK_PRESSED) || ctrl_input.input_timer[INP_UP] > 25) && log_scroll > 0);
    log_scroll      += scroll_direction;
}

// Cutoff:
d3d_set_viewport(0, 16, global.display_width, global.display_height - 32);

// Log:
draw_text_ext(text_position[0] / 2, -log_scroll, log_message, font_height, global.display_width - text_position[0]);

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
text_message_add_many(
"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce suscipit enim in elit eleifend tempus. Vivamus id nisl sed orci ultrices tristique. Duis placerat ante interdum nunc varius bibendum. Curabitur ultrices pellentesque eros, a finibus nisl varius ac. Maecenas sodales, erat eget ornare congue, quam elit venenatis felis, non suscipit lectus diam vel tortor. Praesent in pellentesque massa, eu facilisis diam. Curabitur at posuere sapien, at mattis elit. Suspendisse at hendrerit mi.",
"Donec tincidunt congue tortor ac accumsan. Aenean placerat metus pharetra, mollis elit at, pellentesque nulla. Proin vehicula dui sit amet tellus elementum, id ullamcorper magna rhoncus. Duis imperdiet tempor mauris sit amet suscipit. Nulla fringilla, nisl eget tempor blandit, urna ex bibendum erat, a pellentesque nunc nibh luctus augue. Morbi condimentum convallis lacus, eget pellentesque erat blandit in. Quisque lobortis ante nec tempor pharetra. Cras leo velit, sollicitudin sit amet condimentum quis, placerat vel neque. Vestibulum ut aliquam leo, in congue erat. In vehicula eleifend faucibus. Nullam eu bibendum purus. Phasellus tempor elit eu consectetur dignissim. Integer convallis erat ac sollicitudin blandit. Suspendisse vulputate congue convallis. Donec neque mi, venenatis quis ex in, scelerisque vestibulum nisl. Sed eget viverra elit.");
