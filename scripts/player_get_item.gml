/// player_get_item(id)
// Performs a certain event based on the given item id.

switch (argument0) {
    // Ring bonus:
    case ITEM_BONUS:
        global.game_rings += 5;
        break;

    // Super ring bonus:
    case ITEM_SUPER_BONUS:
        global.game_rings += 10;
        break;

    // Random ring bonus:
    case ITEM_RANDOM_BONUS:
        global.game_rings += choose(1, 5, 10, 30, 50);
        break;

    // Basic shield:
    case ITEM_BASIC:
        status_shield       = SHIELD_BASIC;
        status_shield_state = 0;

        sound_play("snd_shield_basic");
        break;

    // Magnetic shield:
    case ITEM_MAGNETIC:
        status_shield       = SHIELD_MAGNETIC;
        status_shield_state = 0;

        sound_play("snd_shield_lightning");
        break;

    // Fire shield:
    case ITEM_FIRE:
        status_shield       = SHIELD_FIRE;
        status_shield_state = 0;

        sound_play("snd_shield_fire");
        break;

    // Bubble shield:
    case ITEM_BUBBLE:
        status_shield       = SHIELD_BUBBLE;
        status_shield_state = 0;

        sound_play("snd_shield_bubble");
        break;

    // Lightning shield:
    case ITEM_LIGHTNING:
        status_shield       = SHIELD_LIGHTNING;
        status_shield_state = 0;

        sound_play("snd_shield_lightning");
        break;

    // Invincibility:
    case ITEM_INVIN:
        status_invin       = 2;
        status_invin_alarm = 1380;

        with (ctrl_audio) event_user(0);
        break;

    // Speed up:
    case ITEM_SPEED:
        status_speed       = SPEED_UP;
        status_speed_alarm = 900;

        with (ctrl_audio) event_user(1);
        break;

    // Mine:
    case ITEM_MINE:
        player_set_damage(other);
        effect_create(ctl_explosion_large, other.x, other.y, depth - 1);
        break;

    // Slow:
    case ITEM_SLOW:
        break;

    // Panic:
    case ITEM_PANIC:
        break;

    // Swap:
    case ITEM_SWAP:
        break;
}

// Update item feed:
if (global.misc_feed == true) {
    with (ctrl_hud) {
        ds_list_add(item_feed, argument0);
        ds_list_add(item_feed, -8);
        item_timer = 0;
    }
}
