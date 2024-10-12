/// player_collision_steps()
/*
// Steps:
steps = 1 + abs(floor(x_speed / 13)) + abs(floor(y_speed / 13));

repeat (steps) {
    // Movement:
    player_movement();

    // Semi solid collision:
    player_collision_semisolids();

    // Terrain collision:
    player_collision_terrain();

    // Obstacle collision:
    player_collision_obstacle();

    // Mode:
    player_collision_mode();

    // Wall stop:
    player_collision_wall();
}
