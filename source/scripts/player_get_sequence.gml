/// player_get_sequence(animation)
/// @desc Returns a sequence given the character index.
/// @param {string} animation
/// @returns {script}

var _animation; _animation = argument0;

switch (character_index) {
    case CHAR_MILES:
        return miles_get_sequence(_animation);
    
    case CHAR_CLASSIC:
        return classic_get_sequence(_animation);
    
    default:
        return sonic_get_sequence(_animation);
}
