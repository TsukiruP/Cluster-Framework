/// player_bubble_create()
/// @desc Creates a bubble.
/// @returns {void}

with (instance_create(x + 6 * image_xscale, y, obj_bubble)) image_xscale = other.image_xscale;