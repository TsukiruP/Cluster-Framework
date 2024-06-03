/// particle_create(part, x, y, [xscale, yscale])
// Creates a generic effect for the sprite given.




var xscale, yscale;

// Set xscale:
if (argument_count >= 4) xscale = argument[3];
else xscale = 1;

// Set yscale:
if (argument_count >= 5) yscale = argument[4];
else yscale = 1;

with (instance_create(argument[1], argument[2], eff_dummy)) {
    timeline_set(argument[0]);
    image_xscale = xscale;
    image_yscale = yscale;
}

/*
with (ctrl_particle) {
    part_type_scale(ds_map_get(particle_map, argument[0]), xscale, yscale);
    part_particles_create(particle_system, argument[1], argument[2], ds_map_get(particle_map, argument[0]), 1);
}
