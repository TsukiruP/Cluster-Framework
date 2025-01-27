#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Ring

if (dropped)
{
    with (instance_create(x, y, obj_ring))
    {
        super = other.super;
        dropped = true;
        lifespan = 256;
        x_speed = clamp(other.hspeed, -4, 4);
        y_speed = clamp(other.vspeed, -4, 4);
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Movement

event_inherited();

if (game_ispaused())
{
    speed = 0;
    exit;
}

if (instance_exists(stage_get_player(0)))
{
    var player_handle, game_speed, xx, yy;

    // Move towards the player:
    player_handle = stage_get_player(0);
    xx = sign(player_handle.x - x);
    yy = sign(player_handle.y - y);

    game_speed = game_get_speed();
    hspeed += (xx * (0.1875 + (0.75 * (sign(hspeed) != xx))) * game_speed);
    vspeed += (yy * (0.1875 + (0.75 * (sign(vspeed) != yy))) * game_speed);
    speed = min(abs(speed), 64 * game_speed) * sign(speed);

    // Drop a normal ring when no longer magnetized:
    if (player_handle.status_shield != SHIELD_MAGNETIC && player_handle.status_shield != SHIELD_LIGHTNING)
    {
        dropped = true;
        instance_destroy();
    }
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Ring

draw_self_floored();
