/// player_exists(player)
// Returns true if the given player object currently exists.

var player_number;

if(argument_count >= 1) player_number = argument[0];
else player_number = 0;

return global.player_id[player_number] != noone && instance_exists(global.player_id[player_number]);
