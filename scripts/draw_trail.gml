/// draw_trail(sprite, width, alpha)
// I didn't bother understanding how the trail works. These variables don't have any names anyhow.

var pth, wid, stp, stp_i, xt, xt_i, sgn, a, a_i, x1, y1, x2, y2, i, px, py, nx, ny, vert_count;

xt  = 0
wid = argument1 / 2;
col = draw_get_color();

xt_i = 0.1
texture_set_repeat(true);

px = ds_list_find_value(trail_x, 0);
py = ds_list_find_value(trail_y, 0);

draw_primitive_begin_texture(pr_trianglestrip, sprite_get_texture(argument0, 0));
size = ds_list_size(trail_x)

for(i = 0; i < size; i += 1) {
    nx = ds_list_find_value(trail_x, i)
    ny = ds_list_find_value(trail_y, i)

    dir = point_direction(px, py, nx, ny);
    dx = lengthdir_x(wid, dir + 90);
    dy = lengthdir_y(wid, dir + 90);

    //Alpha is either as set, or automatic
    a = draw_get_alpha()
    if(argument2 == 1) then a = (i - 1) / size

    xt = (i - 1) / size
    draw_vertex_texture_color(px + dx, py + dy, xt, 0, col, a * ds_list_find_value(trail_al, i));
    draw_vertex_texture_color(px - dx, py - dy, xt, 1, col, a * ds_list_find_value(trail_al, i));
    px = nx;
    py = ny;

    xt += xt_i;
}
draw_primitive_end();
