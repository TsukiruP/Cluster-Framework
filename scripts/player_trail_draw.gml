/// player_trail_draw()
/* Draws the player's trial. */

if (trail_alpha == -1)
{
    exit;
}

var i, width, color, size, px, py, nx, ny, dir, dx, dy, alpha;

width = 10;
color = player_trail_color();
size = ds_list_size(trail_alpha);

draw_set_blend_mode(bm_add);
texture_set_repeat(true);
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(spr_trail, 0));

for (i = 1; i < size; i += 1)
{
    // Get previous and current coordinates:
    px = ds_list_find_value(x_list, i - 1);
    py = ds_list_find_value(y_list, i - 1);
    nx = ds_list_find_value(x_list, i);
    ny = ds_list_find_value(y_list, i);
    
    // Calculate angle and vectors:
    dir = point_direction(nx, ny, px, py) + 90;
    dx = lengthdir_x(width, dir);
    dy = lengthdir_y(width, dir);
    
    // Calculate alpha, then render:
    alpha = ds_list_find_value(trail_alpha, i) * ((i - 1) / size);
    
    draw_vertex_texture_color(nx + dx, ny + dy, (i - 1) / size, 0, color, alpha);
    draw_vertex_texture_color(nx - dx, ny - dy, (i - 1) / size, 1, color, alpha);
}

draw_primitive_end();
draw_set_blend_mode(bm_normal);
