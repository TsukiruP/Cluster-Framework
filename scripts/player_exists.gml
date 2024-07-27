/// player_exists(id)
// Returns whether the player exists, in general or the specific player id.

var player_id;

// Player id:
player_id = argument[0];

// Return instance:
if (!instance_exists(global.player_instance[player_id])) {
    return noone;
} else {
    return global.player_instance[player_id];
}
