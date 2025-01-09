/// game_room_add(room, [transition, music, background, zone, act, water, start, run])
/* Adds room data in the room grid. */

with (mgr_game)
{
    if (!ds_grid_value_exists(room_grid, 0, 0, ds_grid_width(room_grid) - 1, ds_grid_height(room_grid) - 1, argument0))
    {
        var grid_y, room_transition, room_music, room_background, room_zone, room_act, room_water, room_start, room_run;

        ds_grid_resize(room_grid, ds_grid_width(room_grid), ds_grid_height(room_grid) + 1);
        grid_y = ds_grid_height(room_grid) - 1;

        room_transition = TRANS_FADE;
        room_music = "";
        room_background = -1;
        room_zone = "";
        room_act = 0;
        room_water = -1;
        room_start = START_IDLE;
        room_run = -1;

        if (argument_count >= 2)
        {
            room_transition = argument[1];
        }

        if (argument_count >= 3)
        {
            room_music = argument[2];
        }

        if (argument_count >= 4)
        {
            room_background = argument[3];
        }

        if (argument_count >= 5)
        {
            room_zone = argument[4];
        }

        if (argument_count >= 6)
        {
            room_act = argument[5];
        }

        if (argument_count >= 7)
        {
            room_water = argument[6];
        }

        if (argument_count >=8)
        {
            room_start = argument[7];
        }

        if (argument_count >= 9)
        {
            if (room_start == START_RUN)
            {
                room_run = argument[8];
            }
        }

        ds_grid_set(room_grid, 0, grid_y, argument0);
        ds_grid_set(room_grid, 1, grid_y, room_transition);
        ds_grid_set(room_grid, 2, grid_y, room_music);
        ds_grid_set(room_grid, 3, grid_y, room_background);
        ds_grid_set(room_grid, 4, grid_y, room_zone);
        ds_grid_set(room_grid, 5, grid_y, room_act);
        ds_grid_set(room_grid, 6, grid_y, room_water);
        ds_grid_set(room_grid, 7, grid_y, room_start);
        ds_grid_set(room_grid, 8, grid_y, room_run);
    }
}
