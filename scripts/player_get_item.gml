/// player_get_item(obj, item)
// Performs an event based on the given item id.

switch (argument1)
{
    // Ring bonus:
    case ITEM_BONUS:
        stage_add_rings(5)
        break;

    // Super ring bonus:
    case ITEM_SUPER_BONUS:
        stage_add_rings(10)
        break;

    // Random ring bonus:
    case ITEM_RANDOM_BONUS:
        stage_add_rings(choose(1, 5, 10, 30, 50));
        break;

    // Basic shield:
    case ITEM_BASIC:
        status_shield = SHIELD_BASIC;
        status_shield_allow = true;

        // Play sound:
        audio_sfx_play("snd_shield_basic");
        break;

    // Magnetic shield:
    case ITEM_MAGNETIC:
        status_shield = SHIELD_MAGNETIC;
        status_shield_allow = true;

        // Play sound:
        audio_sfx_play("snd_shield_basic");
        break;

    // Bubble shield:
    case ITEM_BUBBLE:
        status_shield = SHIELD_BUBBLE;
        status_shield_allow = true;

        // Play sound:
        audio_sfx_play("snd_shield_bubble");
        break;

    // Fire shield:
    case ITEM_FIRE:
        status_shield = SHIELD_FIRE;
        status_shield_allow = true;

        // Play sound:
        audio_sfx_play("snd_shield_fire");
        break;

    // Lightning shield:
    case ITEM_LIGHTNING:
        status_shield = SHIELD_LIGHTNING;
        status_shield_allow = true;

        // Play sound:
        audio_sfx_play("snd_shield_lightning");
        break;

    // Invincibility:
    case ITEM_INVIN:
        status_invin = 2;
        status_invin_alarm = 1380;

        // Play jingle:
        audio_jng_play("jng_invin");
        break;

    // Speed up:
    case ITEM_SPEED:
        status_speed = SPEED_UP;
        status_speed_alarm = 900;

        // Play jingle:
        audio_jng_play("jng_speed");
        break;

    // Mine:
    case ITEM_MINE:
        player_set_damage(argument0);

        // Create explosion:
        effect_create(ctl_explosion_large, argument0.x, argument0.y, depth);
        break;

    // Slow:
    case ITEM_SLOW:
        if (status_invin < INVIN_BUFF)
        {
            status_speed = SPEED_SLOW;
            status_speed_alarm = 1200;

            // Stop jingle:
            if (input_cpu == false)
            {
                audio_jng_stop("jng_speed");
            }
        }
        break;

    // Panic:
    case ITEM_PANIC:
        if (status_invin < INVIN_BUFF)
        {
            status_panic = true;
            status_panic_alarm = 1200;
        }
        break;

    // Swap:
    case ITEM_SWAP:
        break;
}

// Update item list:
if (game_setting_get("misc_feed") == true)
{
    with (mgr_hud)
    {
        ds_list_add(item_list, argument1);
        ds_list_add(item_list, -8);
        item_alarm = 90;
    }
}
