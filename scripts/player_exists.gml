/// player_exists(id)
// Returns true if the given player object currently exists.

var player_number;

if (argument_count >= 1) player_number = argument[0];
else return instance_exists(obj_player);

return global.player_instance[player_number] != noone && instance_exists(global.player_instance[player_number]);
