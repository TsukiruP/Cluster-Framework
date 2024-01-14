/// parallax_add_node(direction, background, xfactor, xspeed, xscroll, xoffset, xseparation, yfactor, yspeed, yscroll, yoffset, yseparation, left, top, width, height)
// Create or resize grid if needed.
if (parallax_nodes == -1) parallax_nodes = ds_grid_create(16, 1);
else ds_grid_resize(parallax_nodes, 16, parallax_nodes_count + 1);

// Add information to grid
ds_grid_set(parallax_nodes,  0, parallax_nodes_count, argument0);
ds_grid_set(parallax_nodes,  1, parallax_nodes_count, argument1);
ds_grid_set(parallax_nodes,  2, parallax_nodes_count, argument2);
ds_grid_set(parallax_nodes,  3, parallax_nodes_count, argument3);
ds_grid_set(parallax_nodes,  4, parallax_nodes_count, argument4);
ds_grid_set(parallax_nodes,  5, parallax_nodes_count, argument5);
ds_grid_set(parallax_nodes,  6, parallax_nodes_count, argument6);
ds_grid_set(parallax_nodes,  7, parallax_nodes_count, argument7);
ds_grid_set(parallax_nodes,  8, parallax_nodes_count, argument8);
ds_grid_set(parallax_nodes,  9, parallax_nodes_count, argument9);
ds_grid_set(parallax_nodes, 10, parallax_nodes_count, argument10);
ds_grid_set(parallax_nodes, 11, parallax_nodes_count, argument11);
ds_grid_set(parallax_nodes, 12, parallax_nodes_count, argument12);
ds_grid_set(parallax_nodes, 13, parallax_nodes_count, argument13);
ds_grid_set(parallax_nodes, 14, parallax_nodes_count, argument14);
ds_grid_set(parallax_nodes, 15, parallax_nodes_count, argument15);

// Done:
parallax_nodes_count += 1;
