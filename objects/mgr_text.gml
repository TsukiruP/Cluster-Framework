#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Font Initialization

global.font_system = font_add_sprite(fnt_system, ord(" "), true, 0);
global.font_title_card = font_add_sprite(fnt_title_card_zone, ord(" "), true, -4);
global.font_hud = font_add_sprite(fnt_hud, ord("0"), false, 1);

global.font_hud_s4e2 = font_add_sprite(fnt_hud_s4e2, ord("0"), false, 1);
global.font_score_s4e2 = font_add_sprite(fnt_score_s4e2, ord("0"), false, 1);
global.font_time_s4e2 = font_add_sprite(fnt_time_s4e2, ord("0"), false, 1);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Initialization

// Font height:
draw_set_font(global.font_system);

font_height = string_height("Test");

// Body variables:
body_hide = false;
body_overflow = false;
body_clear = false;

body_message = "";
body_length = 0;
body_current = 0;
body_target = 0;
body_x = 42;
body_y = 70;
body_height = 0;

body_alpha = 0;
body_alpha_rate = 0.05;
body_box_alpha = 0;

// Body scroll variables:
body_scroll_complete = false;

body_scroll_current = 0;
body_scroll_target = 0;
body_scroll_max = 3;
body_scroll_rate = font_height * body_scroll_max;

// Subject variables:
subject_complete = false;

subject_message = "";
subject_height = 0;
subject_lines = 0;

subject_alpha = 0;
subject_box_alpha = 0;

// Log variables:
log_hide = true;
log_message = "";
log_scroll = 0;
log_spacing = 32;
log_height = 0;

log_alpha = 0;
log_fade_alpha = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debug Initialization

debug_section = 0;

debug_title = "";
debug_stats = "";
debug_message = "";

debug_x1 = view_xview[view_current] + 4;
debug_y1 = view_yview[view_current] + 4;
debug_x2 = debug_x1;
debug_y2 = debug_y1;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

// Skip:
if (body_clear == false && log_hide == true && (body_alpha == 1 || subject_alpha == 1) && input_get_check(INP_START, CHECK_PRESSED))
{
    body_clear = true;
}

if (body_clear == false)
{
    // Hide:
    if (!game_ispaused(mnu_pause) && (body_message != "" || subject_message != "" || log_alpha != 0) && input_get_check(INP_SELECT, CHECK_PRESSED)) body_hide = !body_hide;

    if (body_hide == false)
    {
        var scroll_min, scroll_max, scroll_up, scroll_down, scroll_direction;

        // Height:
        draw_set_font(global.font_system);

        subject_height = string_height_ext(subject_message, font_height, screen_get_width() - (body_x * 2));
        subject_lines = (subject_height / font_height) - 1;
        body_height = string_height_ext(body_message[body_current], font_height, screen_get_width() - (body_x * 2));
        log_height = string_height_ext(log_message, font_height, screen_get_width() - body_x);

        // Overflow:
        if (((body_height / font_height) - (body_scroll_current / font_height) <= body_scroll_max) && (body_scroll_current == body_scroll_target))
        {
            body_overflow = false;
        }
        else
        {
            if (body_scroll_complete == false)
            {
                body_overflow = true;
            }
        }

        // Open log:
        if ((game_ispaused(mnu_pause) || body_message != "" || subject_message != "") && log_message != "" && (log_alpha == 0 || log_alpha == 1) && input_get_check(INP_HELP, CHECK_PRESSED))
        {
            log_hide = !log_hide;

            if (log_hide == false && log_height > screen_get_height() - log_spacing)
            {
                log_scroll = log_height - (screen_get_height() - log_spacing);
            }
        }

        // Text box:
        if (log_hide == true)
        {
            // Confirm:
            if (input_get_check(INP_CONFIRM, CHECK_PRESSED))
            {
                // Subject:
                if (subject_complete == false && subject_message != "" && subject_alpha == 1)
                {
                    subject_complete = true;
                }

                // Body:
                else if (body_current == body_target && body_alpha == 1)
                {
                    // Advance text:
                    if (body_overflow == false)
                    {
                        // Update text target:
                        if (body_target != body_length)
                        {
                            body_target += 1;
                        }

                        // Clear text:
                        else
                        {
                            body_clear = true;
                        }
                    }

                    // Advance scroll:
                    else
                    {
                        // Update scroll target:
                        if (body_scroll_complete == true)
                        {
                            body_scroll_target += body_scroll_rate;
                            body_scroll_complete = false;
                        }
                    }
                }
            }
        }

        // Log:
        else
        {
            // Cancel:
            if (input_get_check(INP_CANCEL, CHECK_PRESSED))
            {
                log_hide = true;
            }
        }

        // Manual Scroll:
        if (log_hide == true)
        {
            scroll_min = body_scroll_current;
            scroll_max = (body_scroll_current < body_scroll_target);
        }
        else
        {
            scroll_min = log_scroll;
            scroll_max = ((log_height - log_scroll) > (screen_get_height() - log_spacing));
        }

        scroll_up = ((input_get_check(INP_UP, CHECK_PRESSED) || input_get_time(INP_UP, 30)) && scroll_min > 0);
        scroll_down = ((input_get_check(INP_DOWN, CHECK_PRESSED) || input_get_time(INP_DOWN, 30)) && scroll_max);
        scroll_direction = scroll_down - scroll_up;

        // Textbox scroll:
        if (log_hide == true && body_scroll_target != 0 && (body_scroll_complete == true))
        {
            body_scroll_current += scroll_direction;
        }

        // Log scroll:
        else if (log_hide == false && (log_height > screen_get_height() - log_spacing))
        {
            log_scroll += scroll_direction;
        }
    }
}

// Automatic Scroll:
if (body_overflow == true)
{
    if (body_scroll_complete == false)
    {
        if (body_scroll_current < body_scroll_target)
        {
            body_scroll_current += 1;
        }
        else
        {
            body_scroll_current = body_scroll_target;
            body_scroll_complete = true;
        }
    }
}
else
{
    if (body_scroll_current == body_scroll_target && body_scroll_target != 0)
    {
        if (body_scroll_complete != true)
        {
            body_scroll_complete = true;
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Subject Alpha

var subject_box_alpha_rate;

// Box alpha rate:
subject_box_alpha_rate = game_setting_get("interface_alpha") / 20;

// Fade in subject:
if (body_clear == false && subject_complete == false && subject_message != "")
{
    // Bar:
    if (subject_box_alpha < game_setting_get("interface_alpha"))
    {
        subject_box_alpha += subject_box_alpha_rate;
    }
    else
    {
        subject_box_alpha = game_setting_get("interface_alpha");
    }

    // Subject:
    if (subject_alpha < 1)
    {
        // Add topic to log:
        if (subject_alpha == 0)
        {
            log_message += subject_message + "#";
        }

        subject_alpha += body_alpha_rate;
    }
    else
    {
        subject_alpha = 1;
    }
}

// Fade out subject:
else
{
    // Bar:
    if (subject_box_alpha > 0)
    {
        subject_box_alpha -= subject_box_alpha_rate;
    }
    else
    {
        subject_box_alpha = 0;
    }

    // Subject:
    if (subject_alpha > 0)
    {
        subject_alpha -= body_alpha_rate;
    }
    else
    {
        subject_alpha = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Body Alpha

var body_box_alpha_rate;

// Box alpha rate:
body_box_alpha_rate = game_setting_get("interface_alpha") / 20;

// Fade in text:
if (body_clear == false && body_message != "" && (subject_complete == true || subject_message == ""))
{
    // Box:
    if (body_box_alpha < game_setting_get("interface_alpha"))
    {
        body_box_alpha += body_box_alpha_rate;
    }
    else
    {
        body_box_alpha = game_setting_get("interface_alpha");
    }

    // Text:
    if (body_current == body_target)
    {
        if (body_alpha < 1)
        {
            // Add text to log:
            if (body_alpha == 0) log_message += body_message[body_current] + "#";

            body_alpha += body_alpha_rate;
        }
        else
        {
            body_alpha = 1;
        }
    }

    // Fade out text:
    else
    {
        if (body_alpha > -0.5)
        {
            body_alpha -= body_alpha_rate;

            if (body_alpha == -0.5)
            {
                body_current = body_target;

                body_scroll_current = 0;
                body_scroll_target = 0;
                body_scroll_complete = false;

                body_alpha = 0;

                body_overflow = false;
            }
        }
    }
}

// Fade out text:
else
{
    // Box:
    if (body_box_alpha > 0)
    {
        body_box_alpha -= body_box_alpha_rate;
    }
    else
    {
        body_box_alpha = 0;
    }

    // Text:
    if (body_alpha > 0)
    {
        body_alpha -= body_alpha_rate;
    }
    else
    {
        body_alpha = 0;
    }
}

if (body_clear == true && (body_message != "" || subject_message != "") && body_alpha == 0 && subject_alpha == 0)
{
    body_hide = false;
    body_clear = false;

    body_message = "";
    body_length = 0;
    body_current = 0;
    body_target = 0;

    body_scroll_current = 0;
    body_scroll_target = 0;
    body_scroll_complete = false;

    subject_complete = false;
    subject_message = "";

    log_hide = true;
    log_message += "#";
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Log Alpha

if (log_hide == false)
{
    // Fade:
    if (log_fade_alpha < 0.6)
    {
        log_fade_alpha += 0.03;
    }
    else
    {
        log_fade_alpha = 0.6;
    }

    // Log:
    if (log_alpha < 1)
    {
        log_alpha += body_alpha_rate;
    }
    else
    {
        log_alpha = 1;
    }
}
else
{
    // Fade:
    if (log_fade_alpha > 0)
    {
        log_fade_alpha -= 0.03;
    }
    else
    {
        log_fade_alpha = 0;
    }

    // Log:
    if (log_alpha > 0)
    {
        log_alpha -= body_alpha_rate;
    }
    else
    {
        log_alpha = 0;
    }
}
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Release Fonts

font_delete(global.font_system);
font_delete(global.font_title_card);
font_delete(global.font_hud);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Subject

// Don't draw if hidden:
if (body_hide == true)
{
    exit;
}

// Viewport:
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());

// Box:
draw_set1(game_get_interface_color(), subject_box_alpha);
draw_rectangle(0, (screen_get_height() / 2) - 9 - ((font_height / 2) * subject_lines), screen_get_width(), (screen_get_height() / 2) + 10 + ((font_height / 2) * subject_lines), false);

// Font:
draw_set_font(global.font_system);
draw_set1(c_white, subject_alpha);

// Subject:
draw_set2(fa_center, fa_middle);
draw_text(screen_get_width() / 2, screen_get_height() / 2, subject_message);

// Reset:
draw_reset();
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Text

// Don't draw if hidden:
if (body_hide == true)
{
    exit;
}

var textbox_bottom, texbox_height;

// Box:
textbox_bottom = screen_get_height() - 19;
textbox_height = 59;

draw_set1(game_get_interface_color(), body_box_alpha);
draw_rectangle(0, textbox_bottom - textbox_height, screen_get_width(), textbox_bottom, false);

// Viewport:
d3d_set_viewport(0, screen_get_height() - body_y, screen_get_width(), font_height * body_scroll_max);

// Font:
draw_set_font(global.font_system);
draw_set1(c_white, body_alpha);

// Body:
draw_set2(fa_left, fa_top);
draw_text_ext(body_x, -body_scroll_current, body_message[body_current], font_height, screen_get_width() - (body_x * 2));

// Arrow:
draw_set_alpha(1);
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());

if (body_overflow == true && body_alpha == 1 && body_scroll_complete == true)
{
    draw_sprite(fnt_system, 95, (screen_get_width() / 2) - 6, screen_get_height() - 29);
}

// Reset:
draw_reset();
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Log

// Don't draw if hidden:
if (body_hide == true)
{
    exit;
}

// Fade:
draw_set1(c_black, log_fade_alpha);
draw_rectangle(0, 0, screen_get_width(), screen_get_height(), false);

// Viewport:
d3d_set_viewport(0, 16, screen_get_width(), screen_get_height() - log_spacing);

// Font:
draw_set_font(global.font_system);
draw_set1(c_white, log_alpha);

// Log:
draw_set2(fa_left, fa_top);
draw_text_ext(body_x / 2, -log_scroll, log_message, font_height, screen_get_width() - body_x);

// Reset:
draw_reset();
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());
