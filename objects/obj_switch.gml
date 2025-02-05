#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Initialization

event_inherited();
reaction_index = player_reaction_switch;
is_mask = false;
variant = 0;
angle = ANGLE_UP;
active = false;
duration = 0;
target_time = 0;
image_offset = 0;
on_index = sequence_switch_vertical_on;
off_index = sequence_switch_vertical_off;
sequence_init();
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Time

if (game_get_time() >= target_time && active && duration != -1 && sequence_index != off_index) sequence_set(off_index);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

if (active)
{
    if (script_exists(sequence_index))
    {
        sequence_update();
        script_execute(sequence_index);
    }
}

if (image_index != image_offset && !active)
{
    image_index = image_offset;
    sequence_set(on_index);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field variant: enum(0, 1)
//field duration: number

/*preview
sprite_index = Sprite(pick(Field("variant", 0), "spr_switch_vertical", "spr_switch_horizontal"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_switch_horizontal;
        angle = pick(sign(image_xscale) == -1, ANGLE_RIGHT, ANGLE_LEFT);
        on_index = sequence_switch_horizontal_on;
        off_index = sequence_switch_horizontal_off;
        hitbox_set_hurtbox(7, 9, 6, 9);
        sequence_init(sequence_switch_horizontal_on);
        break;

    default:
        sprite_index = spr_switch_vertical;
        angle = pick(sign(image_yscale) == -1, ANGLE_UP, ANGLE_DOWN);
        on_index = sequence_switch_vertical_on;
        off_index = sequence_switch_vertical_off;
        hitbox_set_hurtbox(9, 6, 9, 7);
        sequence_init(sequence_switch_vertical_on);
}
