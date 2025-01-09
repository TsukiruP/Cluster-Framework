#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shield Initialization

event_inherited();

// Shield variables:
shield_reset = false;
shield_hide = false;
shield_advance = false;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Index

var ctl_target;

// Shields:
if (player_handle.status_invin != INVIN_BUFF)
{
    // Update shield:
    switch (player_handle.status_shield)
    {
        // Magnetic:
        case SHIELD_MAGNETIC:
            if (ctl_index != ctl_shield_magnetic)
            {
                ctl_set(ctl_shield_magnetic);
            }
            break;

        // Bubble:
        case SHIELD_BUBBLE:
            if ((ctl_index != ctl_shield_bubble && ctl_index != ctl_shield_bubble_bound && ctl_index != ctl_shield_bubble_recoil) || shield_reset == true)
            {
                ctl_set(ctl_shield_bubble);
            }
            break;

        // Fire:
        case SHIELD_FIRE:
            if ((ctl_index != ctl_shield_fire && ctl_index != ctl_shield_fire_dash) || shield_reset == true)
            {
                ctl_set(ctl_shield_fire);
            }
            break;

        // Lightning:
        case SHIELD_LIGHTNING:
            if (ctl_index != ctl_shield_lightning)
            {
                ctl_set(ctl_shield_lightning);
            }
            break;

        // Basic:
        default:
            if (ctl_index != ctl_shield_basic)
            {
                ctl_set(ctl_shield_basic);
            }
    }
}

// Invincibility:
else
{
    if (ctl_index != ctl_shield_invin)
    {
        ctl_set(ctl_shield_invin);
    }
}

// Reset:
shield_reset = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

event_inherited();

// Depth:
if ((player_handle.status_shield == SHIELD_FIRE && (image_index mod 2) != 0 && ctl_index != ctl_shield_fire_dash) || (player_handle.status_shield == SHIELD_LIGHTNING && ctl_moment > 48))
{
    depth = player_handle.depth + 2;
}
else
{
    depth = player_handle.depth - 2;
}

// Advance shields:
shield_advance = (player_handle.status_shield == SHIELD_BASIC || player_handle.status_shield == SHIELD_MAGNETIC || player_handle.status_invin == INVIN_BUFF);

// Hide:
if (!game_ispaused(mnu_pause) && ((player_handle.status_shield == SHIELD_BUBBLE && ctl_index == ctl_shield_bubble) || (game_get_config("advance_flicker") && shield_advance == true)))
{
    // Hide:
    shield_hide = sync_rate(ctl_moment, 2, 2);
}
else
{
    shield_hide = false;
}

// Destroy:
if (player_handle.status_shield == SHIELD_NONE && player_handle.status_invin != INVIN_BUFF)
{
    instance_destroy();
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Set Index

switch (player_handle.status_shield)
{
    // Bubble bound:
    case SHIELD_BUBBLE:
        ctl_set(ctl_shield_bubble_bound);
        break;

        // Fire dash:
    case SHIELD_FIRE:
        image_xscale = player_handle.image_xscale;
        ctl_set(ctl_shield_fire_dash);
        break;
}
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bubble Recoil

ctl_set(ctl_shield_bubble_recoil);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Shield

var player_rotation, sine, csine, draw_x, draw_y;

// Rotation:
player_rotation = player_handle.gravity_direction;

// Reset direction:
if (sprite_index != spr_shield_fire_dash)
{
    image_xscale = 1;
}

// Alpha:
if ((game_get_config("advance_flicker") && shield_advance == true) || shield_advance == false)
{
    image_alpha = 1;
}
else
{
    image_alpha = 0.6;
}

if (sprite_exists(sprite_index))
{
    // Shield:
    if (shield_hide == false)
    {
        draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, 1, player_rotation, c_white, image_alpha);
    }

    // Switch to bubble shield shell:
    else if (player_handle.status_shield == SHIELD_BUBBLE && player_handle.status_invin != INVIN_BUFF)
    {
        draw_sprite_ext(spr_shield_bubble_shell, ctl_moment_previous div 12, x, y, image_xscale, 1, player_rotation, c_white, image_alpha);
    }

}
