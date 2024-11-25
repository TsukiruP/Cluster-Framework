/// player_ring_loss()
// Drop a ring of rings.

var ring_total, ring_angle, ring_speed, ring_handle;

// Play sfx:
sfx_play("snd_ring_loss");

// Ring variables:
ring_total = min(stage_get_rings(), 32);
ring_angle = 101.25;
ring_speed = 4;

// Scatter rings:
while (ring_total)
{
    ring_handle = instance_create(x, y, obj_ring);
    ring_handle.lifespan = 256;
    ring_handle.x_speed = ring_speed * dcos(round(ring_angle));
    ring_handle.y_speed = ring_speed * -dsin(round(ring_angle));
    ring_handle.dropped = true;

    if (ring_total mod 2 != 0)
    {
        ring_angle += 22.5;
        ring_handle.x_speed *= -1;
    }

    // Decrease ring total:
    ring_total -= 1;

    // Reset ring variables when at 16:
    if (ring_total == 16)
    {
        ring_speed = 2;
        ring_angle = 101.25;
    }
}

// Empty stage rings:
stage_set_rings(0);
