#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Initialization

fade_speed  = 0;
fade_alpha  = 0;
fade_target = 0;
fade_color  = c_black;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Alpha

if (fade_alpha != fade_target) {
    fade_alpha += fade_speed;

    if (fade_alpha <= 0 && sign(fade_speed) == -1) instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Fade

draw_set_color(fade_color);
draw_set_alpha(fade_alpha);

draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + global.display_width, view_yview[view_current] + global.display_height, false);

// Reset:
draw_reset();
