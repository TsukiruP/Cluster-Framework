/// room_set_data(transition, zone, act, background, [water level], [kickoff], [run end x])

transition_type = argument[0];
room_zone       = argument[1];
room_act        = argument[2];
room_background = argument[3];

// Set water level:
if(argument_count >= 5) room_water_level = argument[4];
else room_water_level = -1;

// Set kickoff
if(argument_count >= 6) {
    room_kickoff = argument[5];

    if(room_kickoff == KICKOFF_RUN && argument_count >= 7) room_run_end_x = argument[6];
    else room_run_end_x = -1;
} else {
    room_kickoff   =  KICKOFF_DEFAULT;
    room_run_end_x = -1;
}
