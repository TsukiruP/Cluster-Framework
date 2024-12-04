/// transition_create(room, [transition])

var transition;

// Initialize:
transition = instance_create(0, 0, mgr_transition);

with (transition)
{
    transition_id = game_room_get_transition(argument0);
    transition_room = argument0;
    transition_run = game_room_get_run(argument0);

    // Override:
    if (argument_count >= 2)
    {
        transition_id = argument[1];
    }
}

// Return:
return transition;

/*
if (mgr_audio.music_instance != -1)
{
    if (transition.room_bgm != "")
    {
        //if (!sound_isplaying(transition.room_bgm)) {
            mgr_audio.fade_out = true;
        //}
    }
    else
    {
        mgr_audio.fade_out = true;
    }
}
*/
