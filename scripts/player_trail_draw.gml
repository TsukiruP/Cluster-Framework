/// player_trail_draw()
/// @desc Draws a trail.
/// @returns {void}

if (trail_alpha == -1) exit;

var width; width = 10;
var color; color = player_trail_color();
var size; size = ds_list_size(trail_alpha);

draw_set_blend_mode(bm_add);
texture_set_repeat(true);
draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(spr_trail, 0));

for ({var i; i = 1}; i < size; i += 1)
{
    // Get previous and current coordinates:
    var px; px = ds_list_find_value(x_list, i - 1);
    var py; py = ds_list_find_value(y_list, i - 1);
    var nx; nx = ds_list_find_value(x_list, i);
    var ny; ny = ds_list_find_value(y_list, i);
    
    // Calculate angle and vectors:
    var dir; dir = point_direction(nx, ny, px, py) + 90;
    var dx; dx = lengthdir_x(width, dir);
    var dy; dy = lengthdir_y(width, dir);
    
    // Calculate alpha, then render:
    var alpha; alpha = ds_list_find_value(trail_alpha, i)* ((i - 1) / size);
    
    draw_vertex_texture_color(nx + dx, ny + dy, (i - 1) / size, 0, color, alpha);
    draw_vertex_texture_color(nx - dx, ny - dy, (i - 1) / size, 1, color, alpha);
}

draw_primitive_end();
draw_set_blend_mode(bm_normal);