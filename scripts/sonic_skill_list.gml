/// sonic_skill_list(id)
//

var skill_id;

skill_id = argument0;

// Ground skill:
if (skill_id == SONIC_AUX_G) {
    switch (global.sonic_skill[skill_id]) {
        // Slide:
        case 1:
            return player_set_state(sonic_state_slide);
            break;

        // Hammer;
        case 2:
            return player_set_state(player_state_hammer);
            break;

    }
}

// No skill takes place:
return false;

/*
var skill_id;

// Skill id:
skill_id = argument0;

// Ground skills:
if (skill_id == SONIC_AUX_G) {

}

// Slam skills:
else if (skill_id == SONIC_SLAM) {

}

// Air skills:
else {
    // Shields:
    if (global.sonic_skill[skill_id] <= 1 && global.sonic_skill[skill_id] == true && status_shield_allow == true) {
        // Elemental shields:
        if (status_shield >= SHIELD_FIRE) {
            player_routine_shield()
        }

        // Insta-shield:
        else if (global.sonic_skill[skill_id] == 1 && status_shield <= SHIELD_MAGNETIC) {
            player_routine_insta();
        }
    }

    // Air dash:
    else if (global.sonic_skill[skill_id] == 2) {

    }

    // Jump exclusive:

    // Auxiliary exclusive:
}
