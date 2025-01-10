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

draw_set_font(global.font_system);
font_height = string_height("Test");

text_hide = false;
text_clear = false;
text_handle = noone;
text_alpha_rate = 0.05;

body_overflow = false;
body_list = ds_list_create();
body_length = 0;
body_current = 0;
body_target = 0;
body_x = 42;
body_y = 70;
body_height = 0;
body_alpha = 0;
body_box_alpha = 0;

body_scroll_complete = false;
body_scroll_current = 0;
body_scroll_target = 0;
body_scroll_max = 3;
body_scroll_rate = font_height * body_scroll_max;

subject_complete = false;
subject_string = "";
subject_height = 0;
subject_lines = 0;
subject_alpha = 0;
subject_box_alpha = 0;

log_hide = true;
log_string = "";
log_scroll = 0;
log_spacing = 32;
log_height = 0;
log_alpha = 0;
log_fade_alpha = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (text_clear == false && text_handle == noone && log_hide == true && (body_alpha == 1 || subject_alpha == 1) && input_get_check(INP_START, CHECK_PRESSED))
{
    text_clear = true;
}

if (text_clear == false)
{
    if (!game_ispaused(mnu_pause) && (!ds_list_empty(body_list) || subject_string != "" || log_alpha != 0) && input_get_check(INP_HIDE, CHECK_PRESSED))
    {
        text_hide = !text_hide;
    }

    if (text_hide == false)
    {
        var scroll_min, scroll_max, scroll_up, scroll_down, scroll_direction;

        draw_set_font(global.font_system);
        subject_height = string_height_ext(subject_string, font_height, screen_get_width() - (body_x * 2));
        subject_lines = (subject_height / font_height) - 1;
        body_height = string_height_ext(ds_list_find_value(body_list, body_current), font_height, screen_get_width() - (body_x * 2));
        log_height = string_height_ext(log_string, font_height, screen_get_width() - body_x);

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

        if ((game_ispaused(mnu_pause) || !ds_list_empty(body_list) || subject_string != "") && log_string != "" && (log_alpha == 0 || log_alpha == 1) && input_get_check(INP_LOG, CHECK_PRESSED))
        {
            log_hide = !log_hide;

            if (log_hide == false && log_height > screen_get_height() - log_spacing)
            {
                log_scroll = log_height - (screen_get_height() - log_spacing);
            }
        }

        if (log_hide == true)
        {
            if (text_handle == noone && input_get_check(INP_CONFIRM, CHECK_PRESSED))
            {
                if (subject_complete == false && subject_string != "" && subject_alpha == 1)
                {
                    subject_complete = true;

                    if (ds_list_empty(body_list))
                    {
                        text_clear = true;
                    }
                }
                else if (body_current == body_target && body_alpha == 1)
                {
                    if (body_overflow == false)
                    {
                        if (body_target != body_length)
                        {
                            body_target += 1;
                        }
                        else
                        {
                            text_clear = true;
                        }
                    }
                    else
                    {
                        if (body_scroll_complete == true)
                        {
                            body_scroll_target += body_scroll_rate;
                            body_scroll_complete = false;
                        }
                    }
                }
            }
        }
        else
        {
            if (input_get_check(INP_CANCEL, CHECK_PRESSED))
            {
                log_hide = true;
            }
        }

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

        if (log_hide == true && body_scroll_target != 0 && (body_scroll_complete == true))
        {
            body_scroll_current += scroll_direction;
        }
        else if (log_hide == false && (log_height > screen_get_height() - log_spacing))
        {
            log_scroll += scroll_direction;
        }
    }
}

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

subject_box_alpha_rate = game_get_config("interface_alpha") / 20;

if (text_clear == false && subject_complete == false && subject_string != "")
{
    if (subject_box_alpha < game_get_config("interface_alpha"))
    {
        subject_box_alpha += subject_box_alpha_rate;
    }
    else
    {
        subject_box_alpha = game_get_config("interface_alpha");
    }

    if (subject_alpha < 1)
    {
        if (subject_alpha == 0)
        {
            log_string += subject_string + "#";
        }

        subject_alpha += text_alpha_rate;
    }
    else
    {
        subject_alpha = 1;
    }
}
else
{
    if (subject_box_alpha > 0)
    {
        subject_box_alpha -= subject_box_alpha_rate;
    }
    else
    {
        subject_box_alpha = 0;
    }

    if (subject_alpha > 0)
    {
        subject_alpha -= text_alpha_rate;
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

body_box_alpha_rate = game_get_config("interface_alpha") / 20;

if (text_clear == false && !ds_list_empty(body_list) && (subject_complete == true || subject_string == ""))
{
    if (body_box_alpha < game_get_config("interface_alpha"))
    {
        body_box_alpha += body_box_alpha_rate;
    }
    else
    {
        body_box_alpha = game_get_config("interface_alpha");
    }

    if (body_current == body_target)
    {
        if (body_alpha < 1)
        {
            if (body_alpha == 0)
            {
                log_string += ds_list_find_value(body_list, body_current) + "#";
            }

            body_alpha += text_alpha_rate;
        }
        else
        {
            body_alpha = 1;
        }
    }

    else
    {
        if (body_alpha > -0.5)
        {
            body_alpha -= text_alpha_rate;

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
else
{
    if (body_box_alpha > 0)
    {
        body_box_alpha -= body_box_alpha_rate;
    }
    else
    {
        body_box_alpha = 0;
    }

    if (body_alpha > 0)
    {
        body_alpha -= text_alpha_rate;
    }
    else
    {
        body_alpha = 0;
    }
}

if (text_clear == true && (!ds_list_empty(body_list) || subject_string != "") && body_alpha == 0 && subject_alpha == 0)
{
    text_hide = false;
    text_clear = false;
    text_handle = noone;

    ds_list_clear(body_list);
    body_length = 0;
    body_current = 0;
    body_target = 0;

    body_scroll_current = 0;
    body_scroll_target = 0;
    body_scroll_complete = false;

    subject_complete = false;
    subject_string = "";

    log_hide = true;
    log_string += "#";
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Log Alpha

if (log_hide == false)
{
    if (log_fade_alpha < 0.6)
    {
        log_fade_alpha += 0.03;
    }
    else
    {
        log_fade_alpha = 0.6;
    }

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
    if (log_fade_alpha > 0)
    {
        log_fade_alpha -= 0.03;
    }
    else
    {
        log_fade_alpha = 0;
    }

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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Release Body List

ds_list_destroy(body_list);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Subject

if (text_hide == true)
{
    exit;
}

// Box:
draw_set1(game_get_interface_color(), subject_box_alpha);
draw_rectangle(0, (screen_get_height() / 2) - 9 - ((font_height / 2) * subject_lines), screen_get_width(), (screen_get_height() / 2) + 10 + ((font_height / 2) * subject_lines), false);

// Subject:
draw_set_font(global.font_system);
draw_set1(c_white, subject_alpha);
draw_set2(fa_center, fa_middle);
draw_text(screen_get_width() / 2, screen_get_height() / 2, subject_string);

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Text

if (text_hide == true)
{
    exit;
}

var text_box_bottom, texbox_height;

// Box:
text_box_bottom = screen_get_height() - 19;
text_box_height = 59;

draw_set1(game_get_interface_color(), body_box_alpha);
draw_rectangle(0, text_box_bottom - text_box_height, screen_get_width(), text_box_bottom, false);

// Viewport:
d3d_set_viewport(0, screen_get_height() - body_y, screen_get_width(), font_height * body_scroll_max);

// Body:
draw_set_font(global.font_system);
draw_set1(c_white, body_alpha);
draw_set2(fa_left, fa_top);
draw_text_ext(body_x, -body_scroll_current, ds_list_find_value(body_list, body_current), font_height, screen_get_width() - (body_x * 2));

// Arrow:
draw_set_alpha(1);
d3d_set_viewport(0, 0, screen_get_width(), screen_get_height());

if (body_overflow == true && body_alpha == 1 && body_scroll_complete == true)
{
    draw_sprite(fnt_system, 95, (screen_get_width() / 2) - 6, screen_get_height() - 29);
}

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Log

if (text_hide == true)
{
    exit;
}

// Fade:
draw_set1(c_black, log_fade_alpha);
draw_rectangle(0, 0, screen_get_width(), screen_get_height(), false);

// Viewport:
d3d_set_viewport(0, 16, screen_get_width(), screen_get_height() - log_spacing);

// Log:
draw_set_font(global.font_system);
draw_set1(c_white, log_alpha);
draw_set2(fa_left, fa_top);
draw_text_ext(body_x / 2, -log_scroll, log_string, font_height, screen_get_width() - body_x);

draw_reset();
