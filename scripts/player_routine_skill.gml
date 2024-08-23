/// player_routine_skill()
// Executes player skills based on the character.

// Ground skill:
if (on_ground == true && input_player[INP_AUX, CHECK_PRESSED] == true) {
    switch (character_id) {
        // Sonic:
        case CHAR_SONIC:
            return sonic_skill_list(SONIC_AUX_G);
            break;
    }
}

// Air skill:
else if (on_ground == false) {
    // Jump skill:
    if (input_player[INP_JUMP, CHECK_PRESSED] == true) {
        switch (character_id) {
            // Sonic:
            case CHAR_SONIC:
                return sonic_skill_list(SONIC_JUMP);
                break;
        }
    }
}

// No skill takes place:
return false;
