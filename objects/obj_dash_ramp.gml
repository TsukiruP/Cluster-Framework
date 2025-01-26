#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ramp Initialization

event_inherited();
reaction_index = player_reaction_dash_ramp;
shape = SHAPE_SLANT;
mask = false;
ramp = false;
hurtbox_set(32, 16, 32, 16);
hitbox_set(6, 16, 4, 0, 25);
sequence_init(sequence_dash_ramp);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

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

//field flip: false

/*preview
var flip;

flip = Field("flip", 0);

image_xscale = 1;
if (flip) image_xscale = -1;
*/
