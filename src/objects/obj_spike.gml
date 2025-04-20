#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

event_inherited();
depth = -10;
reaction_index = player_reaction_spike;
is_mask = false;
variant = 0;
angle = ANGLE_UP;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field variant: enum(0, 1)

/*preview
sprite_index = Sprite(pick(Field("variant", 0), "spr_spike_vertical", "spr_spike_horizontal"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_spike_horizontal;
        angle = pick(sign(image_xscale) == -1, ANGLE_RIGHT, ANGLE_LEFT);
        hitbox_set_hurtbox(16, 16, 8, 15);
        break;

    default:
        sprite_index = spr_spike_vertical;
        angle = pick(sign(image_yscale) == -1, ANGLE_UP, ANGLE_DOWN);
        hitbox_set_hurtbox(16, 8, 15, 15);
}
