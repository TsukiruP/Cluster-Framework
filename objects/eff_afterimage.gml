#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Out

if (image_alpha > 0) image_alpha -= 0.1;
else instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Afterimage

// Miles' tails:
if (miles_tails_sprite != noone) draw_sprite_ext(miles_tails_sprite, floor(miles_tails_frame), floor(x + miles_tails_x), floor(y + miles_tails_y), miles_tails_direction * animation_x_scale, animation_y_scale, miles_tails_angle, c_white, image_alpha);

// Character:
draw_sprite_ext(sprite_index, floor(image_index), floor(x), floor(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
