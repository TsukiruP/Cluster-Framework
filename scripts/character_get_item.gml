/// character_get_item(item)
// Performs a certain event based on the given item id.

switch(argument0) {
    // Ring bonus:
    case ITEM_BONUS:
        global.stage_rings += 5;
        break;

    // Super ring bonus:
    case ITEM_SUPER_BONUS:
        global.stage_rings += 10;
        break;

    // Random ring bonus:
    case ITEM_RANDOM_BONUS:
        global.stage_rings += choose(1, 5, 10, 30, 50);
        break;

    // Basic shield:
    case ITEM_BASIC:
        shield_data  = SHIELD_BASIC;
        shield_state = 0;
        sound_play("snd_shield_basic");
        break;

    // Magnetic shield:
    case ITEM_MAGNETIC:
        shield_data  = SHIELD_MAGNETIC;
        shield_state = 0;
        sound_play("snd_shield_lightning");
        break;

    // Fire shield:
    case ITEM_FIRE:
        shield_data  = SHIELD_FIRE;
        shield_state = 0;
        sound_play("snd_shield_fire");
        break;

    // Bubble shield:
    case ITEM_BUBBLE:
        shield_data  = SHIELD_BUBBLE;
        shield_state = 0;
        sound_play("snd_shield_bubble");
        break;

    // Lightning shield:
    case ITEM_LIGHTNING:
        shield_data  = SHIELD_LIGHTNING;
        shield_state = 0;
        sound_play("snd_shield_lightning");
        break;

    // Invincibility:
    case ITEM_MUTEKI:
        invincibility_type  = 2;
        invincibility_alarm = 1380;

        with(ctrl_audio) event_user(0);
        break;

    // Speed up:
    case ITEM_SPEED:
        speed_shoe_type  = 1;
        speed_shoe_alarm = 900;

        with(ctrl_audio) event_user(1);
        break;

    // Mine:
    case ITEM_MINE:
        character_state_hurt(other);
        dummy_effect_create(spr_explosion_large, 0.35, x, y, -5);
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

if(global.misc_feed == true) {
    with(ctrl_hud) {
        ds_list_add(item_feed, argument0);
        ds_list_add(item_feed, -8);
        item_timer = 0;
    }
}
