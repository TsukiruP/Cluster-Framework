/// ctl_sonic_turn()

// Set speed:
ctl_update(1);

// Start animation:
if (ctl_position(0)) {
    sprite_index = spr_sonic_turn;
    image_index  = 0;

    // Set collision:

    // Set hurtbox:

    // Set hitbox:

    // Set direction:
    animation_direction *= -1;
}

// Change frame:
else if (ctl_position(1)) {
    image_index = 1;

    animation_finished = true;
}
