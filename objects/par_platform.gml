#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Platform Initialization

event_inherited();
semisolid = true;
move = false;
target[0] = xstart;
target[1] = ystart;
life_period = 1;
life_time = 0;
life_speed = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

if (game_ispaused(mnu_pause)) exit;

var x_amplitude; x_amplitude = (xstart - target[0]) / 2;
var y_amplitude; y_amplitude = (ystart - target[1]) / 2;

x = cosine_wave(life_time, life_period, x_amplitude, xstart - x_amplitude);
y = cosine_wave(life_time, life_period, y_amplitude, ystart - y_amplitude);
life_time += 1;
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field move: false
    //field target: xy
    //field life_period: number
