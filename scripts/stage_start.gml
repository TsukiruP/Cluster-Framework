/// stage_start()
//

// Player controls:
if(player_exists()) {
    if(global.player_id.control_type != 1) global.player_id.control_type = 1;
}

// Add time:
if(instance_exists(ctrl_stage)) global.add_time = true;

// Show HUD:
if(instance_exists(ctrl_hud)) ctrl_hud.hide = false;
