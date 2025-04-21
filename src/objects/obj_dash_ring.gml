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

event_inherited();

//field rainbow_ring: false

/*preview nodrawself
var preview_index;

if (Field("rainbow_ring", 0)) preview_index = Sprite(pick(Field("variant", 0), "spr_rainbow_ring_vertical", "spr_rainbow_ring_horizontal", "spr_rainbow_ring_diagonal"), 0);
else preview_index = Sprite(pick(Field("variant", 0), "spr_dash_ring_vertical", "spr_dash_ring_horizontal", "spr_dash_ring_diagonal"), 0);

draw_sprite(preview_index, 0, x, y);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

switch (variant)
{
    case 1:
        if (rainbow_ring) sprite_index = spr_rainbow_ring_horizontal;
        else sprite_index = spr_dash_ring_horizontal;

        angle = ANGLE_RIGHT;
        hitbox_set_hurtbox(6, 24, 7, 26);
        break;

    case 2:
        if (rainbow_ring) sprite_index = spr_rainbow_ring_diagonal;
        else sprite_index = spr_dash_ring_diagonal;

        angle = ANGLE_RIGHT_UP;
        hitbox_set_hurtbox(7, 7, 7, 7);
        break;

    default:
        if (rainbow_ring) sprite_index = spr_rainbow_ring_vertical;
        else sprite_index = spr_dash_ring_vertical;

        angle = ANGLE_UP;
        hitbox_set_hurtbox(26, 5, 26, 6);

}

if (sign(image_xscale) == -1) angle = angle_wrap(180 - angle);
if (sign(image_yscale) == -1) angle = angle_wrap(360 - angle);

cover = instance_create(x, y, par_effect);
cover.depth = -10;
cover.sprite_index = sprite_index;
cover.image_xscale = image_xscale;
cover.image_yscale = image_yscale;
if (!rainbow_ring) cover.image_index = 2;
