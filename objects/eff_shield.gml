#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shield Initialization

event_inherited();

// Shield variables:
shield_hide  = false;
shield_alpha = 0.6;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Index

// Shields:
if (player_handle.status_invin != INVIN_BUFF) {
    // Update shield:
    switch (player_handle.status_shield) {
        // Magnetic:
        case SHIELD_MAGNETIC:
            if (ctl_index != ctl_shield_magnetic) {
                timeline_set(ctl_shield_magnetic);
            }
            break;

        // Fire:
        case SHIELD_FIRE:
            if (ctl_index != ctl_shield_fire) {
                timeline_set(ctl_shield_fire);
            }
            break;

        // Bubble:
        case SHIELD_LIGHTNING:
            if (ctl_index != ctl_shield_lightning) {
                timeline_set(ctl_shield_lightning);
            }
            break;

        // Bubble:
        case SHIELD_BUBBLE:
            if (ctl_index != ctl_shield_bubble) {
                timeline_set(ctl_shield_bubble);
            }
            break;

        // Basic:
        default:
            if (ctl_index != ctl_shield_basic) {
                timeline_set(ctl_shield_basic);
            }
    }
}

// Invincibility:
else {
    if (ctl_index != ctl_shield_invin) {
        timeline_set(ctl_shield_invin);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animate

event_inherited();

var shield_advance;

// Update depth:
if ((player_handle.status_shield == SHIELD_FIRE && (image_index mod 2) != 0) || (player_handle.status_shield == SHIELD_LIGHTNING && ctl_time > 48)) {
    depth = player_handle.depth + 1;
} else {
    depth = player_handle.depth - 1;
}

// Advance shields:
shield_advance = (player_handle.status_shield == SHIELD_BASIC || player_handle.status_shield == SHIELD_MAGNETIC || player_handle.status_invin == INVIN_BUFF);

// Hide:
if (!game_ispaused(ctrl_pause) && (player_handle.status_shield == SHIELD_BUBBLE || (global.advance_flicker == true && shield_advance == true))) {
    // Hide:
    shield_hide = sync_rate(ctl_time, 2, 2);
} else {
    shield_hide = false;
}

// Alpha:
if ((global.advance_flicker == true && shield_advance == true) || shield_advance == false) {
    shield_alpha = 1;
} else {
    shield_alpha = 0.6;
}

// Destroy:
if (player_handle.status_shield == SHIELD_NONE && player_handle.status_invin != INVIN_BUFF) {
    player_handle.shield_handle = noone;
    instance_destroy();
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Shield

if (sprite_exists(sprite_index)) {
    // Shield:
    if (shield_hide == false) {
        draw_sprite_ext(sprite_index, image_index, x, y, 1, 1, 0, c_white, shield_alpha);
    }

    // Switch to bubble shield shell:
    else if (player_handle.status_shield == SHIELD_BUBBLE) {
        draw_sprite(spr_shield_bubble_shell, ctl_time_previous div 12, x, y)
    }

}
