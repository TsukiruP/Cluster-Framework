/// dummy_effect_create(sprite, speed, x, y, depth, [xscale])
/// dummy_effect_create(timeline, x, y, depth, [xscale])
// Creates a generic effect for the sprite given.

dummy_effect = instance_create(argument[1], argument[2], eff_dummy);

with (dummy_effect) {
    // Set timeline:
    timeline_set(argument[0]);

    // Set depth:
    depth = argument[3];

    // Set xscale:
    if (argument_count >= 5) image_xscale = argument[5];
}
