/// particle_create(part, x, y)
// Creates a generic effect for the sprite given.

with (ctrl_particle) {
    part_particles_create(particle_system, argument1, argument2, ds_map_get(particle_map, argument0), 1);
}
