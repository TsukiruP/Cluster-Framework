/// stage_start()
//

// Player input lock:
if (player_exists(0) != noone) {
    with (player_exists(0)) {
        if (input_lock != false) input_lock = false;
    }
}

// Add time:
if (instance_exists(ctrl_stage)) ctrl_stage.add_time = true;

// Show HUD:
if (instance_exists(ctrl_hud)) ctrl_hud.hide = false;
