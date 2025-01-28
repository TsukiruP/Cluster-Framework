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
hurtbox_set(6, 16, 4, 0, 25);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

image_index = time_sync(game_get_time(), 3, sprite_get_number(sprite_index));
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
