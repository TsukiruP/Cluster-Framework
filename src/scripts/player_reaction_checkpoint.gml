/// player_reaction_checkpoint(obj, hitbox)
/// @desc
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_RADII)
{
    if (!input_cpu)
    {
        if (game_checkpoint_get_x() != _obj.x && game_checkpoint_get_y() != _obj.y && !_obj.active)
        {
            if (game_config_get("gameplay_bonuses") && stage_get_rings() >= 20)
            {
                var item_index; item_index = -1;
                var item_rings; item_rings = stage_get_rings() div 20;
                
                if (item_rings > 0) item_index = pick(item_rings - 1, ITEM_BONUS, ITEM_SUPER_BONUS, ITEM_RANDOM_BONUS, ITEM_SPEED);
                else if (status_shield == SHIELD_NONE) item_index = choose(ITEM_BASIC, ITEM_MAGNETIC);
                
                player_get_item(_obj, item_index);
            }

            audio_play_sfx("snd_checkpoint", true);

            with (_obj)
            {
                active = true;
                game_checkpoint_set();
            }
        }
    }
}
