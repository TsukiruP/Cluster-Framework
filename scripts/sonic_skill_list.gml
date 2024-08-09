/// sonic_skill_list(id)
//

/*
var skill_id;

// Skill id:
skill_id = argument0;

// Ground skills:
if (skill_id == SONIC_SPECIAL_G) {

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

    // Special exclusive:
}
