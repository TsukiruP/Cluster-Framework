/// start_trail(length, color1, color2)

trail_length = argument0;
trail_x      = ds_list_create();
trail_y      = ds_list_create();
trail_al     = ds_list_create();

/*
ps = part_system_create();
pt = part_type_create();
pe = part_emitter_create(ps);

part_system_depth(ps, depth - 1);
part_type_shape(pt, 7);
part_type_blend(pt, 1);
part_type_alpha3(pt, 0.3, 0.35, 1);
part_type_color3(pt, argument1, argument2, argument1);
part_type_direction(pt, 0, 360, 50, 0);
part_type_speed(pt, 2, 3, 0.20, 0);
part_type_gravity(pt, 0, 0)
part_type_size(pt, 0.50, 0.50, 0, 0.20);
part_type_life(pt, 2.5, 2.5);
part_type_orientation(pt, 0, 0, 0, 0, 0);
part_type_scale(pt, 1, 1);
