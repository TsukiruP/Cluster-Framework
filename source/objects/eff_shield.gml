#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shield Initialization

event_inherited();
shield_reset = false;
shield_hide = false;
shield_advance = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (player_inst.status_invin != INVIN_BUFF)
{
    switch (player_inst.status_shield)
    {
        case SHIELD_MAGNETIC:
            if (sequence_index != seq_shield_magnetic) sequence_set(seq_shield_magnetic);
            break;

        case SHIELD_BUBBLE:
            if ((sequence_index != seq_shield_bubble && sequence_index != seq_shield_bubble_bound && sequence_index != seq_shield_bubble_recoil) || shield_reset)
            {
                sequence_set(seq_shield_bubble);
            }
            break;

        case SHIELD_FIRE:
            if ((sequence_index != seq_shield_fire && sequence_index != seq_shield_fire_dash) || shield_reset) sequence_set(seq_shield_fire);
            break;

        case SHIELD_LIGHTNING:
            if (sequence_index != seq_shield_lightning) sequence_set(seq_shield_lightning);
            break;

        default:
            if (sequence_index != seq_shield_basic) sequence_set(seq_shield_basic);
    }
}
else if (sequence_index != seq_shield_invin) sequence_set(seq_shield_invin);

if (shield_reset != false) shield_reset = false;

event_inherited();
if (player_inst.status_shield == SHIELD_NONE && player_inst.status_invin != INVIN_BUFF) instance_destroy();
shield_advance = (player_inst.status_shield == SHIELD_BASIC || player_inst.status_shield == SHIELD_MAGNETIC || player_inst.status_invin == INVIN_BUFF);

if (!game_ispaused(mnu_pause) && ((player_inst.status_shield == SHIELD_BUBBLE && sequence_index == seq_shield_bubble) ||
    (config_get("advance_flicker") && shield_advance))) shield_hide = mod_time(sequence_moment, 2, 2);
else shield_hide = false;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set Index

switch (player_inst.status_shield)
{
    case SHIELD_BUBBLE:
        sequence_set(seq_shield_bubble_bound);
        break;

    case SHIELD_FIRE:
        image_xscale = player_inst.image_xscale;
        sequence_set(seq_shield_fire_dash);
        break;
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bubble Recoil

sequence_set(seq_shield_bubble_recoil);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Shield

var player_rotation; player_rotation = player_inst.gravity_direction;

if (sprite_index != spr_shield_fire_dash && image_xscale != 1) image_xscale = 1;

if ((config_get("advance_flicker") && shield_advance) || !shield_advance) image_alpha = 1;
else image_alpha = 0.6;

if (sprite_exists(sprite_index))
{
    if (!shield_hide) draw_sprite_ext(sprite_index, -1, x, y, image_xscale, 1, player_rotation, c_white, image_alpha);
    else if (player_inst.status_shield == SHIELD_BUBBLE &&
        player_inst.status_invin != INVIN_BUFF) draw_sprite_ext(spr_shield_bubble_shell, sequence_moment_previous div 12, x, y, image_xscale, 1, player_rotation, c_white, image_alpha);

}
