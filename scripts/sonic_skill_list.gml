/// sonic_skill_list(id)
//

var skill_id;

skill_id = argument0;

// Ground skill:
if (skill_id == SONIC_AUX_G) {
    switch (global.sonic_skill[skill_id]) {
        // Slide:
        case 1:
            return player_set_state(sonic_state_skid);
            break;

        // Hammer;
        case 2:
            return player_set_state(player_state_hammer);
            break;

    }
}

// Air skills:
else {
    if (global.sonic_skill[skill_id] <= 1 && global.sonic_skill[SONIC_SHIELD] == true && status_shield_allow == true) {
        // Elemental shields:
        if (status_shield >= SHIELD_FIRE) {
            routine_queued = player_routine_shield;
            jump_state     = true;
            animation_skip = true;

            // Play sound:
            switch (status_shield) {
                // Fire:
                case SHIELD_FIRE:
                    sound_play_single("snd_shield_fire_dash");
                    break;

                // Lightning:
                case SHIELD_LIGHTNING:
                    sound_play_single("snd_shield_lightning_jump");
                    break;

                // Bubble:
                case SHIELD_BUBBLE:
                    sound_play_single("snd_shield_bubble_bound");
                    break;
            }

            if (status_shield == SHIELD_BUBBLE) {
                return player_set_state(player_state_bound);
            } else {
                return player_set_state(player_state_air);
            }
        }

        // Insta-shield:
        else if (global.sonic_skill[skill_id] == 1 && status_shield <= SHIELD_MAGNETIC) {
            jump_state          = true;
            status_shield_allow = false;
            routine_queued      = player_routine_insta;
            player_set_animation("insta");

            return player_set_state(player_state_air);
        }
    }

    // Jump Dash:
    else if (global.sonic_skill[skill_id] == 2) {

    }
}

// No skill takes place:
return false;
