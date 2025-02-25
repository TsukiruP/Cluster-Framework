/// player_reaction_checkpoint(obj, hitbox)
/// @desc
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_INTERACT)
{
    if (!input_cpu)
    {
        if (game_get_checkpoint_x() != _obj.x && game_get_checkpoint_y() != _obj.y && !_obj.active)
        {
            if (game_get_config("gameplay_bonuses") && stage_get_rings() >= 20)
            {
                var item_index; item_index = -1;

                switch (stage_get_rings() div 20)
                {
                    case 1:
                        item_index = ITEM_BONUS;
                        break;

                    case 2:
                        item_index = ITEM_SUPER_BONUS;
                        break;

                    case 3:
                        item_index = ITEM_RANDOM_BONUS;
                        break;

                    case 4:
                        item_index = ITEM_SPEED;
                        break;

                    default:
                        if (status_shield == SHIELD_NONE) item_index = choose(ITEM_BASIC, ITEM_MAGNETIC);
                }

                player_get_item(_obj, item_index);
            }

            audio_play_sfx("snd_checkpoint", true);

            with (_obj)
            {
                active = true;
                game_set_checkpoint();
            }
        }
    }
}
