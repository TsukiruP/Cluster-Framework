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
angle = ANGLE_UP;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field angle: enum(ANGLE_UP, ANGLE_RIGHT)

/*preview
var preview_angle; preview_angle = ANGLE_UP;

if (FieldDefined("angle")) preview_angle = Field("angle", 0);
sprite_index = Sprite(pick(preview_angle == ANGLE_RIGHT, "spr_spike_vert", "spr_spike_hor"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

switch (angle)
{
    case ANGLE_RIGHT:
        sprite_index = spr_spike_hor;
        hitbox_set_hurtbox(16, 16, 8, 15);
        break;

    default:
        sprite_index = spr_spike_vert;
        hitbox_set_hurtbox(16, 8, 15, 15);
}

if (sign(image_xscale) == -1) angle = angle_wrap(180 - angle);
if (sign(image_yscale) == -1) angle = angle_wrap(360 - angle);
