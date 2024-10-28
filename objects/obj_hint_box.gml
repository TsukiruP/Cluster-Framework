#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hint Box Initialization

event_inherited();

// Hurtbox:
hurtbox_set(21, 17, 19, 16, 0, 31);

// Draw variables:
draw_y = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

// Exit if the stage is paused or text is active:
if (game_ispaused())
{
    exit;
}

player_handle = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause))
{
    exit;
}

// Match player:
if (instance_exists(player_handle))
{
    with (player_handle)
    {
        // Clear text:
        if (ctrl_text.text_clear == true && animation_current == "look")
        {
            player_set_animation("look_end");
        }

        // Reset hint:
        if (ctrl_text.text_alpha[0] == 0 && animation_current == "stand")
        {
            hint_allow = true;
        }
    }
}

// Float:
draw_y = hover(y, floor(global.object_time) * 0.03, 2);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Hint Box

// Hint Box:
draw_sprite_ext(sprite_index, instance_exists(player_handle) + 1, x, draw_y, image_xscale, 1, 0, c_white, 1);

// Collision:
event_inherited();
