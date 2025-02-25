#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rail Initialization

event_inherited();
reaction_index = player_reaction_rail;
reaction_solid = true;
is_mask = false;
semisolid = true;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field layer: enum(0, 1)

/*preview
image_blend = pick(FieldDefined("layer"), c_white, pick(Field("layer", 0), c_blue, c_red));
*/
