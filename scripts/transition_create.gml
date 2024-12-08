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

    // Fade music:
    if (game_room_get_music() != game_room_get_music(transition_room))
    {
        audio_fade_out();
    }
    else
    {
        audio_jng_fade(true);
        audio_drown_fade(true);
    }
}

// Return:
return transition;
