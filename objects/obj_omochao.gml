#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Omochao Initialization

event_inherited();

// Hurtbox:
hurtbox_set(11, 11, 10, 10, 2, 5);

// Draw variables:
draw_x = x;
draw_y = y;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Exit if the stage is paused:
if (game_ispaused(mnu_pause))
{
    exit;
}

// Match player:
if (instance_exists(player_handle))
{
    if (player_handle.hint_allow == false)
    {
        // Change sprite index:
        switch (player_handle.character_id)
        {
            // Sonic:
            case CHAR_SONIC:
                sprite_index = spr_omochao_sonic;
                break;
        }

        with (player_handle)
        {
            // Clear text:
            if (mgr_text.text_clear == true && animation_current == "omochao")
            {
                player_set_animation("omochao_end");
            }

            // Reset hint:
            if (mgr_text.body_box_alpha == 0 && animation_current == "stand")
            {
                hint_allow = true;
            }
        }
    }

    // Reset immediately:
    if (player_handle.hint_allow == true)
    {
        sprite_index = spr_omochao_idle;
    }
}

// Reset sprite index:
if (player_handle == noone && sprite_index != spr_omochao_idle)
{
    sprite_index = spr_omochao_idle;
}

// Idle:
if (sprite_index == spr_omochao_idle)
{
    // Image index:
    image_index = sync_rate(game_get_time(), 3, sprite_get_number(sprite_index));

    // Draw coordinates:
    draw_x = x;
    draw_y = y;

    // Image xscale:
    image_xscale = 1;
}

// Picked up:
else
{
    // Image index:
    image_index = player_handle.image_index;

    // Draw coordinates:
    draw_x = floor(player_handle.x);
    draw_y = floor(player_handle.y);

    // Image xscale:
    image_xscale = player_handle.image_xscale;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Omochao

// Omochao:
draw_sprite_ext(sprite_index, image_index, draw_x, draw_y, image_xscale, 1, 0, c_white, 1);

// Collision:
event_inherited();
