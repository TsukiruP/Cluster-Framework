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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Explosion Initialization


// Small explosion:
ds_map_add(particle_map, EFFECT_EXPL_SM, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_EXPL_SM), spr_explosion_small, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_EXPL_SM), 45, 45);

// Large explosion:
ds_map_add(particle_map, EFFECT_EXPL_LG, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_EXPL_LG), spr_explosion_large, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_EXPL_LG), 31, 31);

// Badnik explosion:
ds_map_add(particle_map, EFFECT_EXPL_BK, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_EXPL_BK), spr_explosion_badnik, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_EXPL_BK), 46, 46);

// Water explosion:
ds_map_add(particle_map, EFFECT_EXPL_WT, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_EXPL_WT), spr_explosion_water, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_EXPL_WT), 58, 58);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Splash Initialization

// Small splash:
ds_map_add(particle_map, EFFECT_SPLH_SM, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_SPLH_SM), spr_splash_small, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_SPLH_SM), 23, 23);

// Large splash:
ds_map_add(particle_map, EFFECT_SPLH_LG, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_SPLH_LG), spr_splash_large, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_SPLH_LG), 19, 19);

// Step splash:
ds_map_add(particle_map, EFFECT_SPLH_ST, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_SPLH_ST), spr_splash_step, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_SPLH_ST), 16, 16);

// Run splash:
ds_map_add(particle_map, EFFECT_SPLH_RN, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_SPLH_RN), spr_splash_run, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_SPLH_RN), 11, 11);

// Jump splash:
ds_map_add(particle_map, EFFECT_SPLH_JU, part_type_create());
part_type_sprite(ds_map_get(particle_map, EFFECT_SPLH_JU), spr_splash_jump, true, true, false);
part_type_life(ds_map_get(particle_map, EFFECT_SPLH_JU), 16, 16);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Particles

part_system_update(particle_system);
#define Other_3
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Destroy Particle Map

if (particle_map != -1) {
    ds_map_destroy(particle_map);
    particle_map = -1;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Particles

part_system_drawit(particle_system);
