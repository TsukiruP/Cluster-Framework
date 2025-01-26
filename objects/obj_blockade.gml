#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

event_inherited();
reaction_index = player_reaction_blockade;
mask = false;
orientation = ORIEN_VERTICAL;
max_vitality = 3;
vitality = max_vitality;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field orientation: enum(0, 1)
//field max_vitality: number(1, 3)

/*preview
var orientation, max_vitality;

orientation = Field("orientation", 0);
max_vitality = Field("max_vitality", 0);

switch (orientation)
{
    case 1:
        sprite_index = Sprite("spr_blockade_horizontal", 0);
        break;

    default:
        sprite_index = Sprite("spr_blockade_vertical", 0);
}
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

// Blockade orientation:
switch (orientation)
{
    case ORIEN_HORIZONTAL:
        sprite_index = spr_blockade_horizontal;
        hurtbox_set(24, 12, 23, 11);
        break;

    default:
        sprite_index = spr_blockade_vertical;
        hurtbox_set(13, 24, 12, 23);
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
event_inherited();
