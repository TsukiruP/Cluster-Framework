/// stage_start()
// Sets up everything for a stage to start.

// Input lock:
with (obj_player)
{
    input_lock = false;
}

// Allow time:
stage_set_time_allow(true);

// Show HUD:
hud_set_hide(false);
