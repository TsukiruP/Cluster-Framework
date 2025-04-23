/// player_set_trick_speed()
/// @desc Sets the trick speed.
/// @returns {void}

var trick_x_speed;
var trick_y_speed;

trick_x_speed[CHAR_SONIC, TRICK_UP] = 0;
trick_y_speed[CHAR_SONIC, TRICK_UP] = -6;
trick_x_speed[CHAR_SONIC, TRICK_DOWN] = 0;
trick_y_speed[CHAR_SONIC, TRICK_DOWN] = 1;
trick_x_speed[CHAR_SONIC, TRICK_FRONT] = 6;
trick_y_speed[CHAR_SONIC, TRICK_FRONT] = 0;
trick_x_speed[CHAR_SONIC, TRICK_BACK] = -5;
trick_y_speed[CHAR_SONIC, TRICK_BACK] = -3.50;

x_speed = trick_x_speed[character_index, trick_index] * sign(image_xscale);
y_speed = trick_y_speed[character_index, trick_index];
