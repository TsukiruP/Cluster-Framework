#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Particle Initialization

// Image speed:
image_speed = 0;

// Particle map:
particle_map = ds_map_create();

// Particle system:
particle_system = part_system_create();

part_system_automatic_update(particle_system, false);
part_system_automatic_draw(particle_system, false);

// Skid dust:
ds_map_add(particle_map, EFFECT_SKID, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_SKID), spr_skid_dust, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_SKID), 14, 14);

// Ring sparkle:
ds_map_add(particle_map, EFFECT_RING, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_RING), spr_ring_sparkle, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_RING), 16, 16);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Particles

part_system_update(particle_system);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Particles

part_system_drawit(particle_system);
