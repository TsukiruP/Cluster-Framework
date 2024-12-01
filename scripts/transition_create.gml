/// transition_create(room, [transition])

transition = instance_create(0, 0, mgr_transition);
transition.transition_id = TRANS_FADE;
transition.transition_room = argument0;

with (transition)
{
    room_get_data(argument0);
}

// Override transition type:
if (argument_count >= 2)
{
    transition.transition_id = argument[1];
}

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
// Return the transition manager:
return transition;
