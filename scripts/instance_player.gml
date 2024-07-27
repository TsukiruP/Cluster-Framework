/// instance_player(id)
// Returns whether the player exists, in general or the specific player id.

var player_id;

// Player id:
player_id = argument[0];

// Return instance:
return global.player_instance[player_id];
