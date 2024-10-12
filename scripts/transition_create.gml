/// transition_create(room, [transition])

transition = instance_create(0, 0, ctrl_transition);
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

if (ctrl_audio.music_instance != -1)
{
    if (transition.room_music != "")
    {
        if (!sound_isplaying(transition.room_music)) ctrl_audio.fade_out = true;
    }
    else
    {
        ctrl_audio.fade_out = true;
    }
}

// Return the transition controller:
return transition;
