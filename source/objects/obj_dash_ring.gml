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
    image_index = mod_time(game_get_time(), 4, 6) + 1;
    cover.image_index = image_index + 6;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

event_inherited();

//field rainbow_ring: false

/*preview
if (Field("rainbow_ring", 0)) sprite_index = Sprite(pick(preview_angle / 45, "spr_rainbow_ring_hor", "spr_rainbow_ring_diag", "spr_rainbow_ring_vert"), 0);
else sprite_index = Sprite(pick(preview_angle / 45, "spr_dash_ring_hor", "spr_dash_ring_diag", "spr_dash_ring_vert"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

switch (angle)
{
    case ANGLE_RIGHT:
        sprite_index = pick(rainbow_ring, spr_dash_ring_hor, spr_rainbow_ring_hor);
        hitbox_set_hurtbox(6, 24, 7, 26);
        break;

    case ANGLE_RIGHT_UP:
        sprite_index = pick(rainbow_ring, spr_dash_ring_diag, spr_rainbow_ring_diag);
        hitbox_set_hurtbox(7, 7, 7, 7);
        break;

    default:
        sprite_index = pick(rainbow_ring, spr_dash_ring_vert, spr_rainbow_ring_vert);
        hitbox_set_hurtbox(26, 5, 26, 6);
}

cover = instance_create(x, y, par_effect);
cover.depth = -10;
cover.sprite_index = sprite_index;
cover.image_xscale = image_xscale;
cover.image_yscale = image_yscale;
if (!rainbow_ring) cover.image_index = 2;
