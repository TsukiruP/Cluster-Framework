#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

event_inherited();
reaction_index = player_reaction_spring;
angle = ANGLE_UP;
force = 8;
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

if (game_ispaused(mnu_pause) || object_index == obj_dash_ring) exit;

if (active) sequence_execute();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field angle: enum(ANGLE_UP, ANGLE_RIGHT, ANGLE_RIGHT_UP)
//field force: number

/*preview
var preview_angle; preview_angle = ANGLE_UP;
var preview_force; preview_force = 8;

if (FieldDefined("angle")) preview_angle = Field("angle", 0);
if (FieldDefined("force")) preview_force = Field("force", 0);

var preview_alarm; preview_alarm = preview_force + 15;

sprite_index = Sprite(pick(preview_angle / 45, "spr_spring_hor", "spr_spring_diag", "spr_spring_vert"), 0);
draw_line(x, y, x + lengthdir_x(preview_force * preview_alarm * image_xscale, preview_angle), y + lengthdir_y(preview_force * preview_alarm * image_yscale, preview_angle));
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spring Initialization

switch (angle)
{
    case ANGLE_RIGHT:
        sprite_index = spr_spring_hor;
        hitbox_set_hurtbox(16, 5, 4, 5);
        sequence_init(seq_spring_hor);
        break;

    case ANGLE_RIGHT_UP:
        sprite_index = spr_spring_diag;
        hitbox_set_hurtbox(6, 2, 4, 8);
        sequence_init(seq_spring_diag);
        break;

    default:
        sprite_index = spr_spring_vert;
        hitbox_set_hurtbox(5, 4, 5, 15);
        sequence_init(seq_spring_vert);
}

if (sign(image_xscale) == -1) angle = angle_wrap(180 - angle);
if (sign(image_yscale) == -1) angle = angle_wrap(360 - angle);
