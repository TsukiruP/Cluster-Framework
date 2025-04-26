/// player_reaction_goal_ring(obj, hitbox)
/// @desc GOAAAAAAAAAAAAAAAAAAAAAAAAAAAAL!!!
/// @param {object} obj
/// @param {int} hitbox
/// @returns {void}

var _obj; _obj = argument0;
var _hitbox; _hitbox = argument1;

if ((_hitbox & HIT_INTERACT) && !_obj.active && !input_cpu)
{
    with (_obj)
    {
        active = true;
        spin_count = clamp(floor(other.x_speed * 2), 3, 20);
        audio_play_sfx("snd_sign_post");
    }
}
