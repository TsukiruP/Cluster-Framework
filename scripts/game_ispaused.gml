/// game_ispaused([manager])
/* Returns true or false based on the variables of the text manager or pause manager.
Defaults to checking both managers should neither be the argument given, or no argument was given. */

var pause_text, pause_stage;

pause_text = false;
pause_stage = false;

with (mgr_text)
{
    pause_text = (!ds_list_empty(body_list) || subject_string != "" || log_alpha != 0);
}

with (mnu_pause)
{
    pause_stage = pause_active;
}

if (argument_count >= 1)
{
    if (argument[0] == mgr_text)
    {
        return pause_text;
    }

    else if (argument[0] == mnu_pause)
    {
        return pause_stage;
    }
}

return (pause_text || pause_stage);
