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
sequence_array[0, false] = sequence_switch_vertical_off;
sequence_array[0, true] = sequence_switch_vertical_on;
sequence_array[1, false] = sequence_switch_horizontal_off;
sequence_array[1, true] = sequence_switch_horizontal_on;
sequence_init();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

var active, switch_index;

active = game_get_time() < target_time;
switch_index = sequence_array[variant, active];
if (active && game_get_speed() && (target_time - game_get_time()) mod 30 == 0) audio_play_sfx("snd_switch_ping");

if (sequence_index != switch_index)
{
    sequence_set(switch_index);
    audio_play_sfx(pick(game_get_time() < target_time, "snd_switch_off", "snd_switch_on"));
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}

image_index += image_offset;
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
        hitbox_set_hurtbox(7, 9, 6, 9);
        sequence_init(sequence_switch_horizontal_off);
        break;

    default:
        sprite_index = spr_switch_vertical;
        angle = pick(sign(image_yscale) == -1, ANGLE_UP, ANGLE_DOWN);
        hitbox_set_hurtbox(9, 6, 9, 7);
        sequence_init(sequence_switch_vertical_off);
}
