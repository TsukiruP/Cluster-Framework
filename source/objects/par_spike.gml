#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Spike Initialization

event_inherited();
depth = -10;
reaction_index = player_reaction_spike;
is_mask = false;
angle = ANGLE_UP;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field angle: enum(ANGLE_UP, ANGLE_RIGHT)

/*preview
var preview_angle; preview_angle = ANGLE_UP;

if (FieldDefined("angle")) preview_angle = Field("angle", 0);
sprite_index = Sprite(pick(preview_angle == ANGLE_RIGHT, "spr_spike_vert", "spr_spike_hor"), 0);
*/
