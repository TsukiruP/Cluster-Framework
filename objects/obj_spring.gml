#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();

reaction_index = player_reaction_spring;

orientation = ORIEN_VERTICAL;
flip_x = false;
flip_y = false;
force = 8;
angle = 0;
activated = false;
sfx_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (sfx_alarm > 0)
{
    sfx_alarm -= 1;
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause) || object_is_ancestor(object_index, obj_dash_ring))
{
    exit;
}

if (activated)
{
    sequence_update();
    script_execute(sequence_index);
}

if (image_index != 0 && !activated)
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

//field orientation: enum(0, 1, 2)
//field flip_x: false
//field flip_y: false
//field force: number

/*preview
    var orientation, flip_x, flip_y;

    image_xscale = 1;
    image_yscale = 1;
    orientation = Field("orientation", 0);
    flip_x = Field("flip_x", 0);
    flip_y = Field("flip_y", 0);

    switch (orientation)
    {
        case 1:
            sprite_index = Sprite("spr_spring_horizontal", 0);
            break;

        case 2:
            sprite_index = Sprite("spr_spring_diagonal", 0);
            break;

        default:
            sprite_index = Sprite("spr_spring_vertical",  0);
    }

    if (flip_x) image_xscale = -1;
    if (flip_y) image_yscale = -1;
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

switch (orientation)
{
    case ORIEN_HORIZONTAL:
        sprite_index = spr_spring_horizontal;
        hurtbox_set(16, 5, 4, 5);
        sequence_init(sequence_spring_horizontal);
        angle = ANGLE_RIGHT;
        break;

    case ORIEN_DIAGONAL:
        sprite_index = spr_spring_diagonal;
        hurtbox_set(6, 2, 4, 8);
        sequence_init(sequence_spring_diagonal);
        angle = ANGLE_RIGHT_UP;
        break;

    default:
        sprite_index = spr_spring_vertical;
        hurtbox_set(5, 4, 5, 15);
        sequence_init(sequence_spring_vertical);
        angle = ANGLE_UP;
}

if (flip_x)
{
    image_xscale = -1;
    angle = 180 - angle;
}

if (flip_y)
{
    image_yscale = -1;
    angle = 360 - angle;
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Spring

draw_self();
event_inherited();
