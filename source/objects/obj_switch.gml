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
angle = ANGLE_UP;
duration = 0;
target_time = 0;
life_time = 0;
image_offset = 0;
switch_index[0] = seq_switch_vert_inactive;
switch_index[1] = seq_switch_vert_active;
sequence_init();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

var active; active = game_get_time() < target_time;
var switch_sequence; switch_sequence = switch_index[active];

if (active)
{
    life_time += 1;
    if (life_time mod 30 == 0) audio_play_sfx("snd_switch_ping");
}

if (sequence_index != switch_sequence)
{
    life_time = 0;
    sequence_set(switch_sequence);
    audio_play_sfx(pick(game_get_time() < target_time, "snd_switch_off", "snd_switch_on"));
}

sequence_execute();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field angle: enum(ANGLE_UP, ANGLE_RIGHT)
//field duration: number

/*preview
var preview_angle; preview_angle = ANGLE_UP;

if (FieldDefined("angle")) preview_angle = Field("angle", 0);
sprite_index = Sprite(pick(preview_angle == ANGLE_RIGHT, "spr_switch_vert", "spr_switch_hor"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Switch Initialization

switch (angle)
{
    case ANGLE_RIGHT:
        sprite_index = spr_switch_hor;
        switch_index[0] = seq_switch_hor_inactive;
        switch_index[1] = seq_switch_hor_active;
        hitbox_set_hurtbox(7, 9, 6, 9);
        sequence_init(seq_switch_hor_inactive);
        break;

    default:
        sprite_index = spr_switch_vert;
        switch_index[0] = seq_switch_vert_inactive;
        switch_index[1] = seq_switch_vert_active;
        hitbox_set_hurtbox(9, 6, 9, 7);
        sequence_init(seq_switch_vert_inactive);
}

if (sign(image_xscale) == -1) angle = angle_wrap(180 - angle);
if (sign(image_yscale) == -1) angle = angle_wrap(360 - angle);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Switch

draw_self_as(sprite_index, image_index + image_offset);
