/// player_get_item(obj, item)
/* Performs an event based on the given item. */

switch (argument1)
{
    case ITEM_BONUS:
        player_add_rings(5)
        break;

    case ITEM_SUPER_BONUS:
        player_add_rings(10)
        break;

    case ITEM_RANDOM_BONUS:
        player_add_rings(choose(1, 5, 10, 30, 50));
        break;

    case ITEM_BASIC:
        status_shield = SHIELD_BASIC;
        status_shield_allow = true;
        audio_play_sfx("snd_shield_basic");
        break;

    case ITEM_MAGNETIC:
        status_shield = SHIELD_MAGNETIC;
        status_shield_allow = true;
        audio_play_sfx("snd_shield_basic");
        break;

    case ITEM_BUBBLE:
        status_shield = SHIELD_BUBBLE;
        status_shield_allow = true;
        audio_play_sfx("snd_shield_bubble");
        break;

    case ITEM_FIRE:
        status_shield = SHIELD_FIRE;
        status_shield_allow = true;
        audio_play_sfx("snd_shield_fire");
        break;

    case ITEM_LIGHTNING:
        status_shield = SHIELD_LIGHTNING;
        status_shield_allow = true;
        audio_play_sfx("snd_shield_lightning");
        break;

    case ITEM_INVIN:
        status_invin = 2;
        status_invin_alarm = 1380;
        audio_play_jng("jng_invin");
        break;

    case ITEM_SPEED:
        status_speed = SPEED_UP;
        status_speed_alarm = 900;
        audio_play_jng("jng_speed");
        break;

    case ITEM_MINE:
        player_set_damage(argument0);
        effect_create(argument0.x, argument0.y, sequence_explosion_large, depth);
        break;

    case ITEM_SLOW:
        if (status_invin < INVIN_BUFF)
        {
            status_speed = SPEED_SLOW;
            status_speed_alarm = 1200;
            if (!input_cpu) audio_stop_jng("jng_speed");
        }
        break;

    case ITEM_PANIC:
        if (status_invin < INVIN_BUFF) status_panic_alarm = 1200;
        break;

    case ITEM_SWAP:
        break;
}

hud_add_item(argument1);
