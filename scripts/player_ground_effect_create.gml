/// player_ground_effect_create(sequence)
/// @desc Returns the id of a new effect instance.
/// @param {script} sequence
/// @returns {void}

var _sequence; _sequence = argument[0];

var sine; sine = dsin(mask_direction);
var csine; csine = dcos(mask_direction);

effect_create(x + (sine * y_radius), y + (csine * y_radius), _sequence);
