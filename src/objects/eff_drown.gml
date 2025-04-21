#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Drown Initialization

event_inherited();
active = true;
drown_y = 0;
drown_max_y = 20;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

if (active)
{
    drown_y += drown_max_y/38;

    if (floor(drown_y) > drown_max_y)
    {
        active = false;
        drown_y = 0;
    }
}

event_inherited();
if (player_inst.drown_index == -1) instance_destroy();
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Drown

var draw_y; draw_y = y - player_inst.y_radius - drown_y;

image_index = player_inst.drown_index;
if (active) draw_sprite_ext(spr_drown, -1, x, draw_y, 1, 1, 0, c_white, 1);
