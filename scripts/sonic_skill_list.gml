/// sonic_skill_list(id)

var skill_id;

// Skill id:
skill_id = argument0;

// Ground skills:
if (skill_id == SONIC_SPECIAL_G) {

}

// Air skills:
else {
    // Shield actions:

    // Insta-shield:
    if (global.sonic_skill[skill_id] == 0 && status_shield <= SHIELD_MAGNETIC && status_shield_usable == true) {
        // Disable shield:
        status_shield_usable = false;

        // Set action:
        player_set_action(player_action_jump);

        // Set animation:
        player_set_animation("insta");

        // Create shield:
        with (instance_create(x, y, eff_player)) {
            ctl_initialize(ctl_shield_insta);

            depth         = other.depth;
            image_xscale  = other.image_xscale;
            player_handle = other.id;
        }

        // Play sound:
        sound_play("snd_shield_insta");
    }

    // Air dash:

    // Jump exclusive:

    // Special exclusive:
}
