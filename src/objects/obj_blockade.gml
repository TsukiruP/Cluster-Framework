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
variant = 0;
max_vitality = 3;
vitality = max_vitality;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field variant: enum(0, 1)
//field max_vitality: number(1, 3)

/*preview
sprite_index = Sprite(pick(Field("variant", 0), "spr_blockade_vertical", "spr_blockade_horizontal"), 0);
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Blockade Initialization

switch (variant)
{
    case 1:
        sprite_index = spr_blockade_horizontal;
        hitbox_set_hurtbox(24, 12, 23, 11);
        break;

    default:
        sprite_index = spr_blockade_vertical;
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
