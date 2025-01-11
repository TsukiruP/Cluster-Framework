/// screen_is_equal(width, height)
/* Returns whether the screen size matches the given dimensions. */

with (ctrl_screen)
{
    return screen_width == argument0 && screen_height == argument1;
}
