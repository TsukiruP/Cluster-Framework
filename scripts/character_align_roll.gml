/// character_align_roll()
// Aligns the rolling sprite properly along the ground.

draw_x -= ((-2 - (1 * (angle == 90))) * dsin(angle));
draw_y -= ((-3 - (1 * (angle != 0))) * dcos(angle));
