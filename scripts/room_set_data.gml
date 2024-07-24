/// room_set_data(transition, [music, background, zone, act, water level, opener, run end x])

transition_type = argument[0];

// Set music:
if (argument_count >= 2) {
    room_music = argument[1];
} else {
    room_music = "";
}

// Set background:
if (argument_count >= 3) {
    room_background = argument[2];
} else {
    room_background = -1;
}

// Set zone:
if (argument_count >= 4) {
    room_zone = argument[3];
} else {
    room_zone = "Placeholder";
}

// Set act:
if (argument_count >= 5) {
    room_act = argument[4];
} else {
    room_act = 0;
}

// Set water level:
if (argument_count >= 6) {
    room_water_level = argument[5];
} else {
    room_water_level = -1;
}

// Set start:
if (argument_count >= 7) {
    room_opener = argument[6];

    if (room_opener == OPENER_RUN && argument_count >= 8) {
        room_run_target = argument[7];
    } else {
        room_run_target = -1;
    }
} else {
    room_opener     =  OPENER_IDLE;
    room_run_target = -1;
}
