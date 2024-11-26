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

// Text variables:
text_hide = false;
text_overflow = false;
text_clear = false;

text_message = "";
text_length = 0;
text_current = 0;
text_target = 0;
text_x = 42;
text_y = 70;
text_height = 0;

text_alpha = 0;
text_alpha_rate = 0.05;
text_box_alpha = 0;

// Text scroll variables:
text_scroll_complete = false;

text_scroll_current = 0;
text_scroll_target = 0;
text_scroll_max = 3;
text_scroll_rate = font_height * text_scroll_max;

// Topic variables:
topic_complete = false;

topic_message = "";
topic_height = 0;
topic_lines = 0;

topic_alpha = 0;
topic_box_alpha = 0;

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
if (text_clear == false && log_hide == true && (text_alpha == 1 || topic_alpha == 1) && input_get_check(INP_START, CHECK_PRESSED))
{
    text_clear = true;
}

if (text_clear == false)
{
    // Hide:
    if (!game_ispaused(mnu_pause) && (text_message != "" || topic_message != "" || log_alpha != 0) && input_get_check(INP_SELECT, CHECK_PRESSED)) text_hide = !text_hide;

    if (text_hide == false)
    {
        var scroll_min, scroll_max, scroll_up, scroll_down, scroll_direction;

        // Height:
        draw_set_font(global.font_system);

        topic_height = string_height_ext(topic_message, font_height, screen_get_width() - (text_x * 2));
        topic_lines = (topic_height / font_height) - 1;
        text_height = string_height_ext(text_message[text_current], font_height, screen_get_width() - (text_x * 2));
        log_height = string_height_ext(log_message, font_height, screen_get_width() - text_x);

        // Overflow:
        if (((text_height / font_height) - (text_scroll_current / font_height) <= text_scroll_max) && (text_scroll_current == text_scroll_target))
        {
            text_overflow = false;
        }
        else
        {
            if (text_scroll_complete == false)
            {
                text_overflow = true;
            }
        }

        // Open log:
        if ((game_ispaused(mnu_pause) || text_message != "" || topic_message != "") && log_message != "" && (log_alpha == 0 || log_alpha == 1) && input_get_check(INP_HELP, CHECK_PRESSED))
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
                // Topic:
                if (topic_complete == false && topic_message != "" && topic_alpha == 1)
                {
                    topic_complete = true;
                }

                // Text:
                else if (text_current == text_target && text_alpha == 1)
                {
                    // Advance text:
                    if (text_overflow == false)
                    {
                        // Update text target:
                        if (text_target != text_length)
                        {
                            text_target += 1;
                        }

                        // Clear text:
                        else
                        {
                            text_clear = true;
                        }
                    }

                    // Advance scroll:
                    else
                    {
                        // Update scroll target:
                        if (text_scroll_complete == true)
                        {
                            text_scroll_target += text_scroll_rate;
                            text_scroll_complete = false;
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
            scroll_min = text_scroll_current;
            scroll_max = (text_scroll_current < text_scroll_target);
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
        if (log_hide == true && text_scroll_target != 0 && (text_scroll_complete == true))
        {
            text_scroll_current += scroll_direction;
        }

        // Log scroll:
        else if (log_hide == false && (log_height > screen_get_height() - log_spacing))
        {
            log_scroll += scroll_direction;
        }
    }
}

// Automatic Scroll:
if (text_overflow == true)
{
    if (text_scroll_complete == false)
    {
        if (text_scroll_current < text_scroll_target)
        {
            text_scroll_current += 1;
        }
        else
        {
            text_scroll_current = text_scroll_target;
            text_scroll_complete = true;
        }
    }
}
else
{
    if (text_scroll_current == text_scroll_target && text_scroll_target != 0)
    {
        if (text_scroll_complete != true)
        {
            text_scroll_complete = true;
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Topic Alpha

var topic_box_alpha_rate;

// Box alpha rate:
topic_box_alpha_rate = game_setting_get("interface_alpha") / 20;

// Fade in topic:
if (text_clear == false && topic_complete == false && topic_message != "")
{
    // Bar:
    if (topic_box_alpha < game_setting_get("interface_alpha"))
    {
        topic_box_alpha += topic_box_alpha_rate;
    }
    else
    {
        topic_box_alpha = game_setting_get("interface_alpha");
    }

    // Topic:
    if (topic_alpha < 1)
    {
        // Add topic to log:
        if (topic_alpha == 0)
        {
            log_message += topic_message + "#";
        }

        topic_alpha += text_alpha_rate;
    }
    else
    {
        topic_alpha = 1;
    }
}

// Fade out topic:
else
{
    // Bar:
    if (topic_box_alpha > 0)
    {
        topic_box_alpha -= topic_box_alpha_rate;
    }
    else
    {
        topic_box_alpha = 0;
    }

    // Topic:
    if (topic_alpha > 0)
    {
        topic_alpha -= text_alpha_rate;
    }
    else
    {
        topic_alpha = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text Alpha

var text_box_alpha_rate;

// Box alpha rate:
text_box_alpha_rate = game_setting_get("interface_alpha") / 20;

// Fade in text:
if (text_clear == false && text_message != "" && (topic_complete == true || topic_message == ""))
{
    // Box:
    if (text_box_alpha < game_setting_get("interface_alpha"))
    {
        text_box_alpha += text_box_alpha_rate;
    }
    else
    {
        text_box_alpha = game_setting_get("interface_alpha");
    }

    // Text:
    if (text_current == text_target)
    {
        if (text_alpha < 1)
        {
            // Add text to log:
            if (text_alpha == 0) log_message += text_message[text_current] + "#";

            text_alpha += text_alpha_rate;
        }
        else
        {
            text_alpha = 1;
        }
    }

    // Fade out text:
    else
    {
        if (text_alpha > -0.5)
        {
            text_alpha -= text_alpha_rate;

            if (text_alpha == -0.5)
            {
                text_current = text_target;

                text_scroll_current = 0;
                text_scroll_target = 0;
                text_scroll_complete = false;

                text_alpha = 0;

                text_overflow = false;
            }
        }
    }
}

// Fade out text:
else
{
    // Box:
    if (text_box_alpha > 0)
    {
        text_box_alpha -= text_box_alpha_rate;
    }
    else
    {
        text_box_alpha = 0;
    }

    // Text:
    if (text_alpha > 0)
    {
        text_alpha -= text_alpha_rate;
    }
    else
    {
        text_alpha = 0;
    }
}

if (text_clear == true && (text_message != "" || topic_message != "") && text_alpha == 0 && topic_alpha == 0)
{
    text_hide = false;
    text_clear = false;

    text_message = "";
    text_length = 0;
    text_current = 0;
    text_target = 0;

    text_scroll_current = 0;
    text_scroll_target = 0;
    text_scroll_complete = false;

    topic_complete = false;
    topic_message = "";

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
        log_alpha += text_alpha_rate;
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
        log_alpha -= text_alpha_rate;
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
/// Draw Topic

// Don't draw if hidden:
if (text_hide == true)
{
    exit;
}

// Viewport:
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());

// Box:
draw_set1(game_get_interface_color(), topic_box_alpha);
draw_rectangle(0, (screen_get_height() / 2) - 9 - ((font_height / 2) * topic_lines), screen_get_width(), (screen_get_height() / 2) + 10 + ((font_height / 2) * topic_lines), false);

// Topic:
draw_set_font(global.font_system);
draw_set1(c_white, topic_alpha);

// Topic:
draw_set2(fa_center, fa_middle);
draw_text(screen_get_width() / 2, screen_get_height() / 2, topic_message);

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
if (text_hide == true)
{
    exit;
}

var textbox_bottom, texbox_height;

// Box:
textbox_bottom = screen_get_height() - 19;
textbox_height = 59;

draw_set1(game_get_interface_color(), text_box_alpha);
draw_rectangle(0, textbox_bottom - textbox_height, screen_get_width(), textbox_bottom, false);

// Viewport:
d3d_set_viewport(0, screen_get_height() - text_y, screen_get_width(), font_height * text_scroll_max);

// Font:
draw_set_font(global.font_system);
draw_set1(c_white, text_alpha);

// Text:
draw_set2(fa_left, fa_top);
draw_text_ext(text_x, -text_scroll_current, text_message[text_current], font_height, screen_get_width() - (text_x * 2));

// Arrow:
draw_set_alpha(1);
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());

if (text_overflow == true && text_alpha == 1 && text_scroll_complete == true)
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
if (text_hide == true)
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
draw_text_ext(text_x / 2, -log_scroll, log_message, font_height, screen_get_width() - text_x);

// Reset:
draw_reset();
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());
