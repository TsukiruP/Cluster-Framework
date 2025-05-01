#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

event_inherited();
draw_x = x;
draw_y = y;
hitbox_set_hurtbox(9, 6, 13, 15);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

var omochao_index; omochao_index = spr_omochao_idle;

with (player_inst)
{
    if (animation_previous == "omochao_end") hint_allow = true;
    if (character_index != CHAR_CLASSIC && !hint_allow) omochao_index = pick(character_index, spr_omochao_sonic, spr_omochao_miles);
}

if (sprite_index != omochao_index) sprite_index = omochao_index;

if (text_get_clear())
{
    with (player_inst)
    {
        if (animation_previous != "omochao_end") player_set_animation("omochao_end");
    }
}

if (sprite_index == spr_omochao_idle)
{
    image_index = mod_time(game_get_time(), 3, sprite_get_number(sprite_index));
    image_xscale = 1;
    draw_x = x;
    draw_y = y;
}
else
{
    image_index = min(sprite_get_number(sprite_index) - 1, player_inst.image_index);
    image_xscale = player_inst.image_xscale;
    draw_x = floor(player_inst.x);
    draw_y = floor(player_inst.y);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Omochao

draw_sprite_ext(sprite_index, -1, draw_x, draw_y, image_xscale, image_yscale, gravity_direction, c_white, 1);
