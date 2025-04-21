/// draw_enemy_border()
/// @desc Draws the enemy's movement borders when in debug mode.
/// @returns {void}

if (game_get_debug_visible())
{
    var x1; x1 = floor(xstart) - border_left;
    var y1; y1 = floor(ystart) - hurtbox_top + hurtbox_y_offset;
    var x2; x2 = floor(xstart) + border_right;
    var y2; y2 = floor(ystart) + hurtbox_bottom + hurtbox_y_offset;

    draw_set_color(c_red);
    draw_rectangle(x1, y1, x2, y2, true);
    draw_reset();
}
