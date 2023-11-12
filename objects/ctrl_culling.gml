#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// (De)activate Instances

// Deactivate everything:
instance_deactivate_all(true);

// Activate GM 8.2 core:
instance_activate_object(gm82core_object);

// Activate indestructable objects:
instance_activate_object(par_indestructable);
instance_activate_object(obj_ring_magnetized);

// Activate region around view:
instance_activate_region(view_xview[view_current] - 64, view_yview[view_current] - 64, view_wview[view_current] + 128, view_hview[view_current] + 128, true);

// Activate region around players:
with(obj_player) {
    if(!in_view()) instance_activate_region(x - 64, y - 64, 128, 128, true);
}
