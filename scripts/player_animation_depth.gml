/// player_animation_depth()
// Sets the player's depth depending on their number or if they're currently being carried.

// Change animation depth based on control type:
if (input_cpu == false) animation_depth = -1;
else animation_depth = 0;

// Apply animation depth when not respawning or being carried:
if (depth != animation_depth && action_state != ACTION_RESPAWN && action_state != ACTION_CARRY) depth = animation_depth;
