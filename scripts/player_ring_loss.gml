/// player_ring_loss()
/* Drop a ring of rings. */

var ring_total, ring_angle, ring_speed, ring_id;

ring_total = min(stage_get_rings(), 32);
ring_angle = 101.25;
ring_speed = 4;

while (ring_total)
{
    ring_id = instance_create(x, y, obj_ring);
    ring_id.life_alarm = 256;
    ring_id.x_speed = ring_speed * dcos(round(ring_angle));
    ring_id.y_speed = ring_speed * -dsin(round(ring_angle));
    ring_id.dropped = true;

    if (ring_total mod 2 != 0)
    {
        ring_angle += 22.5;
        ring_id.x_speed *= -1;
    }

    ring_total -= 1;

    if (ring_total == 16)
    {
        ring_speed = 2;
        ring_angle = 101.25;
    }
}

stage_set_rings(0);
audio_play_sfx("snd_ring_loss");
