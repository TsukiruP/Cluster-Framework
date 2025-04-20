/// player_reset_skill([refresh])
/// @desc Resets the player's skill variables.
/// @param {bool} [refresh]
/// @returns {void}

var _refresh; if (argument_count > 0) _refresh = argument[0]; else _refresh = false;;

status_shield_allow = true;
air_dash_allow = true;

if (!_refresh) bound_count = 0;
