/// player_ring_loss()
/// @desc Drop a ring of rings.
/// @returns {void}

var ring_count; ring_count = min(stage_get_rings(), 32);
var ring_angle; ring_angle = 101.25;
var ring_speed; ring_speed = 4;

while (ring_count)
{
    ring_inst = instance_create(x, y, obj_ring);
    ring_inst.life_alarm = 256;
    ring_inst.x_speed = ring_speed * dcos(round(ring_angle));
    ring_inst.y_speed = ring_speed * -dsin(round(ring_angle));
    ring_inst.dropped = true;

    if (ring_count mod 2 != 0)
    {
        ring_angle += 22.5;
        ring_inst.x_speed *= -1;
    }

    ring_count -= 1;

    if (ring_count == 16)
    {
        ring_speed = 2;
        ring_angle = 101.25;
    }
}

stage_set_rings(0);
audio_play_sfx("snd_ring_loss");
