#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Rail Initialization

event_inherited();
reaction_index = player_reaction_rail;
reaction_mask = true;
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
var layer, semisolid;

layer = Field("layer", 0);

image_blend = c_white;

if (FieldDefined("layer"))
{
    switch (layer)
    {
        case 0:
            image_blend = c_blue;
            break;

        case 1:
            image_blend = c_red;
            break;
    }
}
*/
