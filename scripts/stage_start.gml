/// stage_start()
/* Sets up everything for a stage to start. */

// Input lock:
with (obj_player)
{
    input_lock = false;
}

stage_set_time_allow(true);
hud_set_hide(false);
