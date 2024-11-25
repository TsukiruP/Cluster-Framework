/// stage_start()
// Sets up everything for a stage to start.

// Player input lock:
if (instance_exists(stage_get_player(0)))
{
    with (stage_get_player(0))
    {
        if (input_lock != false)
        {
            input_lock = false;
        }
    }
}

// Allow time:
stage_set_timer_allow(true);

// Show HUD:
if (instance_exists(mgr_hud))
{
    mgr_hud.hud_hide = false;
}
