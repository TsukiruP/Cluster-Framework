/// game_ispaused([controller])
/* Returns true or false based on the variables of the text controller or pause controller.
Defaults to checking both controllers should neither be the argument given, or no argument was given. */

var pause_text, pause_transition, pause_stage;

pause_text = false;
pause_transition = false;
pause_stage = false;

with (ctrl_text)
{
    pause_text = (!ds_list_empty(body_list) || subject_string != "" || log_alpha != 0);
}

with (ctrl_transition)
{
    pause_transition = ((transition_id == TRANS_CARD && (transition_state > 1 && transition_state < 4)) || (transition_id == TRANS_RETRY && transition_state == 4));
}

with (mnu_pause)
{
    pause_stage = pause_active;
}

if (argument_count >= 1)
{
    if (argument[0] == ctrl_text)
    {
        return pause_text;
    }

    else if (argument[0] == mnu_pause)
    {
        return pause_stage;
    }
}

return (pause_text || pause_transition || pause_stage);
