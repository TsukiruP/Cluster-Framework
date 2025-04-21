#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

event_inherited();
image_index = 1;
targetable = false;
cover = noone;
rainbow_ring = false;
rainbow_index = spr_rainbow_ring_vert;
rainbow_score = true;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (rainbow_ring)
{
    image_index = time_sync(game_get_time(), 4, 6) + 1;
    cover.image_index = image_index + 6;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field rainbow_ring: false
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cover Initialization

event_inherited();
if (rainbow_ring) sprite_index = rainbow_index;
cover = instance_create(x, y, par_effect);
cover.depth = -10;
cover.sprite_index = sprite_index;
cover.image_xscale = image_xscale;
cover.image_yscale = image_yscale;
if (!rainbow_ring) cover.image_index = 2;
