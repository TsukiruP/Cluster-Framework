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
        player_set_status(STATUS_SHIELD, SHIELD_BASIC);
        break;

    case ITEM_MAGNETIC:
        player_set_status(STATUS_SHIELD, SHIELD_MAGNETIC);
        break;

    case ITEM_BUBBLE:
        player_set_status(STATUS_SHIELD, SHIELD_BUBBLE);
        break;

    case ITEM_FIRE:
        player_set_status(STATUS_SHIELD, SHIELD_FIRE);
        break;

    case ITEM_LIGHTNING:
        player_set_status(STATUS_SHIELD, SHIELD_LIGHTNING);
        break;

    case ITEM_INVIN:
        player_set_status(STATUS_INVIN, INVIN_BUFF);
        break;

    case ITEM_SPEED:
        player_set_status(STATUS_SPEED, SPEED_UP);
        break;

    case ITEM_MINE:
        player_set_damage(argument0);
        effect_create(argument0.x, argument0.y, sequence_explosion_large, depth);
        break;

    case ITEM_SLOW:
        if (status_invin < INVIN_BUFF) player_set_status(STATUS_SPEED, SPEED_SLOW);
        break;

    case ITEM_PANIC:
        if (status_invin < INVIN_BUFF) player_set_status(STATUS_PANIC, 1200);
        break;

    case ITEM_SWAP:
        break;
}

hud_add_item(argument1);