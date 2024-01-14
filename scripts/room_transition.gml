/// room_transition(room, [transition])

transition                 = instance_create(0, 0, ctrl_transition);
transition.transition_room = argument[0];

with (transition) room_get_data(argument[0]);
if (argument_count >= 2) transition.transition_type = argument[1];

if (ctrl_audio.music_instance != -1) {
    if (transition.room_music != "") {
        if (!sound_isplaying(transition.room_music)) ctrl_audio.fade_out = true;
    } else {
        ctrl_audio.fade_out = true;
    }
}

// Return the transition controller:
return transition;
