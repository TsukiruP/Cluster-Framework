#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// (De)activate Instances

// Deactivate everything:
instance_deactivate_all(true);

// Activate indestructable objects:
instance_activate_object(par_indestructable);

// Activate large region:
instance_activate_region(view_xview[view_current] - global.display_width / 2, view_yview[view_current] - global.display_height / 2, view_wview[view_current] + global.display_width, view_hview[view_current] + global.display_height, true);

// Deactivate badniks:
instance_deactivate_object(par_badnik);

// Activate player & view regions:
if(instance_exists(par_player)) {
    // Cycle through player instances:
    var player_count, player_handle;

    // Player count:
    player_count = instance_number(par_player);

    for(i = 0; i < player_count; i += 1) {
        player_handle = instance_find(par_player, i);
        if(player_handle == noone) continue;

        instance_activate_region(player_handle.x - global.display_width / 2, player_handle.y - global.display_height / 2, global.display_width, global.display_height, true);
    }
}

instance_activate_region(view_xview[view_current] - 64, view_yview[view_current] - 64, view_wview[view_current] + 128, view_hview[view_current] + 128, true);
