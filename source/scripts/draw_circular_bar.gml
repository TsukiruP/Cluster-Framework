/// draw_circular_bar(x, y, r, w, val, col, alpha)
/// @desc
/// @param {number} x
/// @param {number} y
/// @param {number} r
/// @param {number} w
/// @param {number} val
/// @param {color} col
/// @param {number} alpha
/// @returns {void}

var _x; _x = argument0;
var _y; _y = argument1;
var _r; _r = argument2;
var _w; _w = argument3;
var _val; _val = argument4;
var _col; _col = argument5;
var _alpha; _alpha = argument6;

if (_val > 0)
{
    var section_count; section_count = 60;
    var section_size; section_size = 360;
    var section_val; section_val = _val * section_count;

    if (section_val > 0)
    {
        draw_set1(_col, _alpha);

        pie_surface = surface_set("pie", screen_get_width(), screen_get_height());

        //draw_clear_alpha(c_blue, 0.7);
        //draw_clear_alpha(c_black, 0);

        draw_primitive_begin(pr_trianglefan);
        draw_vertex(_r, _r);

        for ({var i; i = 0}; i <= section_val; i += 1)
        {
            var len; len = (i * section_size) + 90;
            var tx; tx = lengthdir_x(_r, len);
            var ty; ty = lengthdir_y(_r, len);

            draw_vertex(_r + tx, _r + ty);
        }

        draw_primitive_end();
        draw_reset();

        //draw_set_blend_mode(bm_subtract);
        //draw_set_color(c_black);
        //draw_circle(_r - 1, _r - 1, _r - _w, false);
        draw_reset();
        surface_reset();
        draw_surface(pie_surface, _x - _r, _y - _r);
    }
}
