/// player_reaction_ring(inst, hitbox)
/// @desc Nom nom nom.
/// @params {object} inst
/// @params {int} hitbox
/// @returns {void}

var _inst; _inst = argument0;
var _hitbox; _hitbox = argument1;

if (_hitbox & HIT_INTERACT)
{
    if (status_invin != INVIN_HURT || (status_invin == INVIN_HURT && status_invin_alarm > 0 && status_invin_alarm < 90))
    {
        if (_inst.super)
        {
            player_add_rings(10);
            audio_play_sfx("snd_ring_super", true);
        }
        else
        {
            player_add_rings(1);
            audio_play_sfx("snd_ring", true, 1, audio_ring_pan());
        }

        with (_inst)
        {
            effect_create(x, y, sequence_ring_sparkle, -depth);
            instance_destroy();
        }
    }
}
