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
angle = ANGLE_UP;
max_vitality = 3;
vitality = max_vitality;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field max_vitality: number(1, 3)
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Vitality Initialization

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
