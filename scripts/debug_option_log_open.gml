/// debug_option_log_open(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Open Log";

    // Confirm:
    case 2:
        ctrl_text.log_hide = false;
        return true;

    // Undefined:
    default:
        return undefined;
}
