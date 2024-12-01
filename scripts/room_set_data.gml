/// room_set_data(transition, [bgm, background, zone, act, water level, start, run end x])
// Sets the room data.

// Initialize:
transition_id = argument0;

room_bgm = "";
room_background = -1;
room_zone = "";
room_act = 0;
room_water_level = -1;
room_start = START_IDLE;
room_run_target = -1;

// Set BGM:
if (argument_count >= 2)
{
    room_bgm = argument[1];
}

// Set background:
if (argument_count >= 3)
{
    room_background = argument[2];
}

// Set zone:
if (argument_count >= 4)
{
    room_zone = argument[3];
}

// Set act:
if (argument_count >= 5)
{
    room_act = argument[4];
}

// Set water level:
if (argument_count >= 6)
{
    room_water_level = argument[5];
}

// Set start:
if (argument_count >= 7)
{
    room_start = argument[6];

    if (room_start == START_RUN && argument_count >= 8)
    {
        room_run_target = argument[7];
    }
}
