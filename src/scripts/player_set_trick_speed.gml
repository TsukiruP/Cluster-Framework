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

trick_x_speed[CHAR_MILES, TRICK_UP] = 0;
trick_y_speed[CHAR_MILES, TRICK_UP] = -6;
trick_x_speed[CHAR_MILES, TRICK_DOWN] = 0;
trick_y_speed[CHAR_MILES, TRICK_DOWN] = 0.50;
trick_x_speed[CHAR_MILES, TRICK_FRONT] = 4;
trick_y_speed[CHAR_MILES, TRICK_FRONT] = -2.50;
trick_x_speed[CHAR_MILES, TRICK_BACK] = -3.50;
trick_y_speed[CHAR_MILES, TRICK_BACK] = -3;

trick_x_speed[CHAR_KNUCKLES, TRICK_UP] = 0;
trick_y_speed[CHAR_KNUCKLES, TRICK_UP] = -6;
trick_x_speed[CHAR_KNUCKLES, TRICK_DOWN] = 0;
trick_y_speed[CHAR_KNUCKLES, TRICK_DOWN] = 1;
trick_x_speed[CHAR_KNUCKLES, TRICK_FRONT] = 6;
trick_y_speed[CHAR_KNUCKLES, TRICK_FRONT] = 0;
trick_x_speed[CHAR_KNUCKLES, TRICK_BACK] = -5;
trick_y_speed[CHAR_KNUCKLES, TRICK_BACK] = 0;

trick_x_speed[CHAR_AMY, TRICK_UP] = 0;
trick_y_speed[CHAR_AMY, TRICK_UP] = -6;
trick_x_speed[CHAR_AMY, TRICK_DOWN] = 0;
trick_y_speed[CHAR_AMY, TRICK_DOWN] = 1;
trick_x_speed[CHAR_AMY, TRICK_FRONT] = 6;
trick_y_speed[CHAR_AMY, TRICK_FRONT] = 0;
trick_x_speed[CHAR_AMY, TRICK_BACK] = -3.50;
trick_y_speed[CHAR_AMY, TRICK_BACK] = -2;

x_speed = trick_x_speed[character_index, trick_index] * sign(image_xscale);
y_speed = trick_y_speed[character_index, trick_index];
