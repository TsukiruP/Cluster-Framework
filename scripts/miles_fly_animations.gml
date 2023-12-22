/// miles_fly_animations()
// Replaces Miles' flight animations with their swimming varients:

// Replace animations:
if(flight_animations == true) {
    player_add_animation(CHAR_MILES,    "fly",            spr_miles_swim,           0,  8,  1, -1, 0.30);
    player_add_animation(CHAR_MILES,    "fly_drop",       spr_miles_swim,           9, 17, 10, -1, 0.25);
    player_add_animation(CHAR_MILES,    "fly_turn",       spr_miles_swim_turn,      0,  1,  0,  0, 0.50, "fly", player_get_animation("fly", 5));
    
    // Update animation:
    player_get_animation();
    flight_animations = false;
}

// Reset animations:
else {
    miles_add_animations();

    // Update animation:
    player_get_animation();
    flight_animations = true;
}
