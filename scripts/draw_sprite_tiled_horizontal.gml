/// draw_sprite_tiled_horizontal(sprite, subimg, x, y)
/* Draws a sprite at a given position, and tiles horizontally across the entire view. */

var sprite_step, sprite_start, sprite_end, sprite_current;

sprite_step  = sprite_get_width(argument0);
sprite_start = view_xview[view_current] + ((argument2 - view_xview[view_current]) mod sprite_step) - sprite_step;
sprite_end   = view_xview[view_current] + view_wview[view_current] + sprite_step;

for (sprite_current = sprite_start; sprite_current <= sprite_end; sprite_current += sprite_step)
{
    draw_sprite(argument0, argument1, sprite_current, argument3);
}
