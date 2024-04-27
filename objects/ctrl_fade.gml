#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Initialization

fade_speed  = 0;
fade_timer  = 0;
fade_target = 0;
fade_color  = c_black;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Timer

if (fade_timer != fade_target) {
    fade_timer += fade_speed;

    if (fade_timer <= 0 && sign(fade_speed) == -1) instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Fade

draw_set_color(fade_color);
draw_set_alpha(fade_timer);

draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + global.display_width, view_yview[view_current] + global.display_height, false);

// Reset draw variables:
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
