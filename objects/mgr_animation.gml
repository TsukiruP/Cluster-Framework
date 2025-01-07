#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Initialization

// Animation grid:
animation_grid = ds_grid_create(0, 0);
animation_init_sonic();
animation_init_classic();
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_grid_destroy(animation_grid);
