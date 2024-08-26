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
            return player_routine_shield();
        }

        // Insta-shield:
        else if (global.sonic_skill[skill_id] == 1 && status_shield <= SHIELD_MAGNETIC) {
            // Set status:
            status_shield_allow = false;
            status_insta_alarm  = 8;

            // Queue effect:
            effect_queue = EFF_INSTA;

            // Set animation:
            player_set_animation("insta");

            // Play sound:
            sound_play("snd_shield_insta");

            return player_set_state(player_state_jump, false);
        }
    }

    // Jump Dash:
    else if (global.sonic_skill[skill_id] == 2) {

    }
}

// No skill takes place:
return false;
