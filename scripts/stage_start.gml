/// stage_start()
//

// Player controls:
if(player_exists(0)) {
    if(global.player_instance[0].control_type != 1) global.player_instance[0].control_type = 1;
}

// Add time:
if(instance_exists(ctrl_stage)) global.add_time = true;

// Show HUD:
if(instance_exists(ctrl_hud)) ctrl_hud.hide = false;
