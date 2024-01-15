/// player_action_list()
// A handy list of the action scripts.

// Don't bother if in the middle of respawning/dying:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

switch (character_data) {
    case CHAR_SONIC:
        break;

    case CHAR_MILES:
        miles_action_fly();
        break;

    case CHAR_KNUCKLES:
        break;

    case CHAR_CLASSIC:
        classic_action_clock_up();
        break;
}

player_action_jump();
player_action_look();
player_action_crouch();
player_action_tag();
player_action_spin_dash();
player_action_roll();
player_action_skid();
player_action_push();
/*player_action_balance();
