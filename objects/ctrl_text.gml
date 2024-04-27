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
text_clear       = false;
text_overflow    = false;

// Header variables:
header_message = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Tuesday

if (text_clear == false) {
    // Advance text:
    if (text_current == text_target && text_alpha[2] == 1 && text_overflow == false && input_check(INP_ACCEPT, CHECK_PRESSED)) {
        // Update text target:
        if (text_target != text_length) text_target += 1;
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Box Alpha

if (text_message != "") {
    // Box alpha:
    if (text_alpha[0] < 0.6) {
        text_alpha[0] += text_alpha[1];
    } else {
        text_alpha[0] = 0.6;
    }

    // Text alpha:
    if (text_clear == false) {
        // Fade in text:
        if (text_current == text_target) {
            if (text_alpha[2] < 1) {
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
                    text_overflow  = false;
                    text_current   = text_target;

                    text_scroll[0] = 0;
                    text_scroll[1] = 0;
                    text_scroll[4] = false;

                    text_alpha[2]  = 0;
                }
            }
        }
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

// Draw box:
draw_set_color(c_blue);
draw_set_alpha(text_alpha[0]);

draw_rectangle(view_xview[view_current], view_yview[view_current] + global.display_height - 19 - 59, view_yview[view_current] + global.display_width, view_yview[view_current] + global.display_height - 19, false);

// Draw text:
if (text_message != "") {
    var font_height, text_height;

    draw_set_font(global.font_system);

    font_height = string_height("Test");
    text_height = string_height_ext(text_message[text_current], font_height, global.display_width - (text_position[0] * 2));

    // Cutoff:
    d3d_set_viewport(0, global.display_height - text_position[1], global.display_width, font_height * 3)

    // Overflow:
    if (((text_height / font_height) - (text_scroll[0] / font_height) <= text_scroll[3]) && (text_scroll[0] == text_scroll[1])) {
        text_overflow = false;
    } else {
        if (text_scroll[4] == false) text_overflow = true;
    }

    // Scroll:
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

    draw_set_color(c_white);
    draw_set_alpha(text_alpha[2]);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);

    draw_text_ext(text_position[0], -text_scroll[0], text_message[text_current], font_height, global.display_width - (text_position[0] * 2));
}
#define KeyPress_32
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
text_message_set("What a thrill...", "With darkness and silence through the night...");
