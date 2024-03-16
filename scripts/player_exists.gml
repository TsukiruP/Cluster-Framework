/// player_exists(id)
// Returns true if the given player object currently exists.

var player_number;

// Player number:
player_number = argument0;

if (global.player_instance[player_number] == noone ^^ !instance_exists(global.player_instance[player_number])) return noone;
else return global.player_instance[player_number];
