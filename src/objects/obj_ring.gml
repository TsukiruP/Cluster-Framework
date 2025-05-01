#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Ring Initialization

event_inherited();
magnetized = false;
life_alarm = 0;
x_speed = 0;
y_speed = 0;
gravity_force = 0.09375;
layer = -1;
#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Magnetized Ring

if (magnetized)
{
    with (instance_create(x, y, obj_ring_magnetized)) super = other.super;
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused()) exit;

if (dropped)
{
    life_alarm = max(life_alarm - 1 * game_get_speed(), 0);
    if (life_alarm <= 0) instance_destroy();
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

event_inherited();
if (game_ispaused() || !dropped) exit;
if (!in_view(self, 64)) instance_destroy();

var game_speed; game_speed = game_get_speed();
var sine; sine = dsin(gravity_direction);
var csine; csine = dcos(gravity_direction);
var ox; ox = csine * x_speed;
var oy; oy = sine * x_speed;

x += ox * game_speed;
y -= oy * game_speed;

if (place_meeting(x + ox, y - oy, par_solid) && !place_meeting(xprevious, yprevious, par_solid))
{
    while (place_meeting(x, y, par_solid))
    {
        x -= sign(ox);
        y += sign(oy);
    }

    x_speed *= -1;
}

ox = sine * y_speed;
oy = csine * y_speed;
x += ox * game_speed;
y += oy * game_speed;
y_speed += gravity_force * game_speed;

if (place_meeting(x + ox, y + oy, par_solid) && !place_meeting(xprevious, yprevious, par_solid))
{
    while (place_meeting(x, y, par_solid))
    {
        x -= sign(ox);
        y -= sign(oy);
    }

    y_speed *= -1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Magnetize

if (game_ispaused()) exit;

if (instance_exists(stage_get_player(0)))
{
    var player_inst; player_inst = stage_get_player(0);

    if (player_inst.status_shield == SHIELD_MAGNETIC || player_inst.status_shield == SHIELD_LIGHTNING)
    {
        if (distance_to_object(player_inst) < 64)
        {
            magnetized = true;
            instance_destroy();
        }
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Ring

image_alpha = pick((dropped && life_alarm < 30), 1, mod_time(life_alarm, 2, 2));
draw_self_floored();
