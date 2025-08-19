#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Credits Initialization

credits_state = 0;
credits_string = credits_get();
credits_x = 16;
credits_y = screen_get_height() + 14;
credits_fade_alpha = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (credits_state == 1)
{
    // Scroll:
    var credits_up; credits_up = input_get_check(INP_UP, CHECK_HELD);
    var credits_down; credits_down = input_get_check(INP_DOWN, CHECK_HELD);
    var credits_direction; credits_direction = credits_down - credits_up;

    if (credits_direction != 0) credits_y += 2 * credits_direction;
    else credits_y -= 1;

    // Skip:
    if (input_get_check(INP_START, CHECK_PRESSED) || input_get_check(INP_CANCEL, CHECK_PRESSED)) credits_state = 2;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

switch (credits_state)
{
    // Fade In:
    case 0:
        if (credits_fade_alpha < 0.6) credits_fade_alpha += 0.02;
        else credits_state = 1;
        break;

    // Scroll:
    case 1:
        credits_y = clamp(credits_y, -string_height(credits_string) - 14, screen_get_height() + 14);

        if (credits_y == -string_height(credits_string) - 14) credits_state = 2;
        break;

    // Fade Out:
    case 2:
        if (image_alpha > 0) image_alpha -= 0.05;
        if (credits_fade_alpha > 0) credits_fade_alpha -= 0.02;
        if (image_alpha == 0 && credits_fade_alpha == 0) instance_destroy();
        break;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Credits

// Fade:
draw_rectangle_view(c_black, credits_fade_alpha);

// Credits:
draw_set_alpha(image_alpha);
draw_text(view_xview[view_current] + credits_x, view_yview[view_current] + credits_y, credits_string);
draw_reset();
