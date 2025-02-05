#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Initialization

event_inherited();
depth = -11000;
reaction_index = player_reaction_water;
surface = true;
hitbox_set_hurtbox(0, 0, sprite_width, sprite_height);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

image_index = time_sync(game_get_time(), 6, sprite_get_number(spr_water_surface));
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field surface: true

/*preview
depth = 1000;
image_alpha = 0.5;

if (Field("surface", 0))
{
    var i;

    for (i = 0; i < image_xscale; i += 1)
    {
        draw_sprite(Sprite("spr_water_surface", 0), 0, x + 8 * i, y);
    }
}
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Water

var water_width, water_height;

water_width = min(sprite_width, view_xview[view_current] + view_wview[view_current]);
water_height = min(sprite_height, view_yview[view_current] + view_hview[view_current]);

// Filter:
draw_set_blend_mode_ext(bm_dest_color, bm_src_alpha_sat);
draw_rect(x, y, water_width, water_height, make_color_rgb(57, 132, 222));
draw_reset();

// Surface:
if (surface) draw_sprite_tiled_extra(spr_water_surface, image_index, x, y, 1, 1, 0, c_white, 1, sprite_width / 8, 1);
