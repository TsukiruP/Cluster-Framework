#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Initialization

// Title variables:
title_start = false;
title_flash = 10;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Inputs

if (title_start == false)
{
    if (input_get_check(INP_START, CHECK_PRESSED))
    {
        title_start = true;
    }
}
else
{
    if (game_get_time() mod 5 == 0)
    {
        title_flash -= 1;

        if (title_flash == 0)
        {
            instance_destroy();
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title

var title_x, title_y, start_hide;

title_x = screen_get_width() / 2;
title_y = screen_get_height() / 2 - sprite_get_height(spr_realizing_hopper) / 8;
start_hide = sync_rate(game_get_time(), 30, 2);

// Title:
draw_sprite(spr_realizing_hopper, 0, title_x, title_y);

// Start:
if (title_start == true)
{
    start_hide = sync_rate(game_get_time(), 5, 2);
}


if (!start_hide)
{
    draw_sprite(spr_title_start, 0, title_x, title_y + sprite_get_height(spr_realizing_hopper) / 2 + sprite_get_height(spr_title_start) * 3);
}
