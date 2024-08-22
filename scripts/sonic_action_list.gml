/// sonic_action_list(id)
//

var action_id;

action_id = argument0;

// Ground action:
if (action_id == SONIC_AUX_G) {
    switch (global.sonic_action[action_id]) {
        // Slide:
        case 1:
            break;

        // Hammer;
        //case 2:
        default:
            return player_set_state(player_state_hammer);
            //break;

    }
}

// No action was taken:
return false;

/*
var action_id;

// Skill id:
action_id = argument0;

// Ground skills:
if (action_id == SONIC_AUX_G) {

}

// Slam skills:
else if (action_id == SONIC_SLAM) {

}

// Air skills:
else {
    // Shields:
    if (global.sonic_skill[action_id] <= 1 && global.sonic_skill[action_id] == true && status_shield_allow == true) {
        // Elemental shields:
        if (status_shield >= SHIELD_FIRE) {
            player_routine_shield()
        }

        // Insta-shield:
        else if (global.sonic_skill[action_id] == 1 && status_shield <= SHIELD_MAGNETIC) {
            player_routine_insta();
        }
    }

    // Air dash:
    else if (global.sonic_skill[action_id] == 2) {

    }

    // Jump exclusive:

    // Auxiliary exclusive:
}
