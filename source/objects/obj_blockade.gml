#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

event_inherited();
reaction_index = player_reaction_blockade;
is_mask = false;
angle = ANGLE_RIGHT;
max_vitality = 3;
vitality = max_vitality;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field angle: enum(ANGLE_RIGHT, ANGLE_UP)
//field max_vitality: number(1, 3)

/*preview
var preview_angle; preview_angle = ANGLE_RIGHT;

if (FieldDefined("angle")) preview_angle = Field("angle", 0);
sprite_index = Sprite(pick(preview_angle == ANGLE_UP, "spr_blockade_vert", "spr_blockade_hor"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

switch (angle)
{
    case ANGLE_UP:
        sprite_index = spr_blockade_hor;
        hitbox_set_hurtbox(24, 12, 23, 11);
        break;

    default:
        sprite_index = spr_blockade_vert;
        hitbox_set_hurtbox(13, 24, 12, 23);
}

vitality = max_vitality;
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Blockade

image_index = image_number - (vitality / max_vitality) * image_number;
draw_self();
