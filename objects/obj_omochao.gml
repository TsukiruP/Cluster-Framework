#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

event_inherited();

hurtbox_set(11, 11, 10, 10, 2, 5);

draw_x = x;
draw_y = y;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause))
{
    exit;
}

if (instance_exists(player_handle))
{
    if (player_handle.hint_allow == false)
    {
        switch (player_handle.character_id)
        {
            case CHAR_SONIC:
                sprite_index = spr_omochao_sonic;
                break;
        }

        with (player_handle)
        {
            if (text_get_clear() && animation_current == "omochao")
            {
                player_set_animation("omochao_end");
            }

            if (mgr_text.body_box_alpha == 0 && animation_current == "stand")
            {
                hint_allow = true;
            }
        }
    }

    if (player_handle.hint_allow == true)
    {
        sprite_index = spr_omochao_idle;
    }
}

if (player_handle == noone && sprite_index != spr_omochao_idle)
{
    sprite_index = spr_omochao_idle;
}

if (sprite_index == spr_omochao_idle)
{
    image_index = sync_rate(game_get_time(), 3, sprite_get_number(sprite_index));
    image_xscale = 1;
    draw_x = x;
    draw_y = y;
}

else
{
    // Image index:
    image_index = player_handle.image_index;
    image_xscale = player_handle.image_xscale;
    draw_x = floor(player_handle.x);
    draw_y = floor(player_handle.y);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Omochao

draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, 1, 0, c_white, 1);
event_inherited();
