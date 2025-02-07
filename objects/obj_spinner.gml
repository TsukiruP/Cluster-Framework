#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization

event_inherited();
variant = 0;
x_offset = 0;
y_offset = 0;
hitbox_set_hurtbox(20, 19, 20, 4);
hitbox_set_attackbox(8, 18, 7, 4);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

event_inherited();

sequence_speed = game_get_speed();

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field variant: enum(0, 1)

/*preview
sprite_index = Sprite(pick(Field("variant", 0), "spr_spinner", "spr_spanner"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spinner Initialization

switch (variant)
{
    case 1:
        sequence_init(sequence_spanner);
        break;

    default:
        sequence_init(sequence_spinner);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spinner

draw_sprite_ext(sprite_index, image_index, floor(x) + x_offset * sign(image_xscale), floor(y) + y_offset * sign(image_yscale), image_xscale, image_yscale, gravity_direction, c_white, 1);
