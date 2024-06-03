/// game_start()
//

// Player input lock:
if (player_exists(0) != noone) {
    with (player_exists(0)) {
        if (input_lock != false) input_lock = false;
    }
}

// Allow time:
global.time_allow = true;

// Show HUD:
if (instance_exists(ctrl_hud)) {
    ctrl_hud.hud_hide = false;
}
