/// player_reaction_enemy(obj, collision)
// Everybody wanna be my enemy....

var reaction_handle, collision;

reaction_handle = argument0;
collision       = argument1;

// Player advantage:
if ((collision & COLL_HURT) || ((collision & COLL_HURT_RADIUS) && status_invin == INVIN_BUFF)) {
    // Subtract:
    if (y > reaction_handle.y || sign(y_speed) == -1) {
        y_speed -= 1;
    }

    // Rebound:
    else if (y < reaction_handle.y && sign(y_speed) == 1) {
        y_speed *= -1;
    }

    // Score:
    global.game_score += 100;

    // Destroy:
    with (reaction_handle) {
        effect_create(ctl_explosion_enemy, x, y, -depth);
        instance_destroy();
    }

    // Play sound:
    sound_play_single("snd_destroy");
}

// Enemy advantage:
else if (((collision & COLL_HIT) || (collision & COLL_HIT_RADIUS)) && status_shield - SHIELD_MAGNETIC != reaction_handle.hitbox_element) {
    player_set_damage(reaction_handle);
}
