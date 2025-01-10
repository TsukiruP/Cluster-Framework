#define Destroy_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Ring

if (dropped == true)
{
    with (instance_create(x, y, obj_ring))
    {
        super = other.super;
        dropped = true;
        lifespan = 256;
        x_speed = other.hspeed;
        y_speed = other.vspeed;
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
    var player_handle, xx, yy;

    // Move towards the player:
    player_handle = stage_get_player(0);
    xx = sign(player_handle.x - x);
    yy = sign(player_handle.y - y);

    hspeed += (xx * (0.1875 + (0.75 * (sign(hspeed) != xx))));
    vspeed += (yy * (0.1875 + (0.75 * (sign(vspeed) != yy))));
    speed = clamp(speed, -64, 64) * game_get_speed();

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

// Ring:
draw_self();

event_inherited();
