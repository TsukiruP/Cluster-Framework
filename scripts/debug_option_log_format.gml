/// debug_option_log_format(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Format Log";

    // Confirm:
    case 2:
        mgr_text.log_string = "";
        return true;

    // Undefined:
    default:
        return undefined;
}
