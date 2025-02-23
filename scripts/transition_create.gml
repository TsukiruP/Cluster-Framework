/// transition_create(room, [transition], [preview])
/// @desc Returns the id of a new transition instance.
/// @param {room} room
/// @param {int} [transition]
/// @param {bool} [preview]
/// @returns {object}

var _room; _room = argument[0];
var _transition; if (argument_count > 1) _transition = argument[1]; else _transition = game_get_room_transition(_room);
var _preview; if (argument_count > 2) _preview = argument[2]; else _preview = false;

var transition_id; transition_id = instance_create(0, 0, ctrl_transition);

with (transition_id)
{
    preview = _preview;
    transition_index = _transition;
    transition_room = _room;
    transition_run = game_get_room_run(_room);

    if (!preview)
    {
        if (game_get_room_music() != game_get_room_music(transition_room)) audio_fade_out();
        else audio_fade_jng(true);
    }
}

return transition_id;