/// player_routine_skill()


// Ground skill:
if (on_ground == true && input_player[INP_AUX, CHECK_PRESSED] == true) {
    switch (character_id) {
        // Sonic:
        case CHAR_SONIC:
            return sonic_skill_list(SONIC_AUX_G);
            break;
    }
}

// No skill takes place:
return false;
