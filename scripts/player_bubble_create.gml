/// player_bubble_create()
/// @desc Returns the id of a new bubble instance. Offset by the player's xscale when not drowning.
/// @returns {object}

var bubble_offset; bubble_offset = pick(drown, 6 * image_xscale, 0);
var bubble_inst; bubble_inst = instance_create(x + bubble_offset, y, obj_bubble);

with (bubble_inst) image_xscale = esign(bubble_offset, 1);

return bubble_inst;