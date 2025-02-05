#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
reaction_index = player_reaction_spring;
variant = 0;
force = 8;
angle = 0;
active = false;
sfx_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0) sfx_alarm -= 1;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause) || object_is_ancestor(object_index, obj_dash_ring)) exit;

if (active)
{
    sequence_update();
    script_execute(sequence_index);
}

if (image_index != 0 && !active)
{
    image_index = 0;
    sequence_set(sequence_index);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field variant: enum(0, 1, 2)
//field force: number

/*preview
sprite_index = Sprite(pick(Field("variant", 0), "spr_spring_vertical", "spr_spring_horizontal", "spr_spring_diagonal"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_spring_horizontal;
        angle = ANGLE_RIGHT;
        hitbox_set_hurtbox(16, 5, 4, 5);
        sequence_init(sequence_spring_horizontal);
        break;

    case 2:
        sprite_index = spr_spring_diagonal;
        angle = ANGLE_RIGHT_UP;
        hitbox_set_hurtbox(6, 2, 4, 8);
        sequence_init(sequence_spring_diagonal);
        break;

    default:
        sprite_index = spr_spring_vertical;
        angle = ANGLE_UP;
        hitbox_set_hurtbox(5, 4, 5, 15);
        sequence_init(sequence_spring_vertical);
}

if (sign(image_xscale) == -1) angle = 180 - angle;
if (sign(image_yscale) == -1) angle = 360 - angle;
