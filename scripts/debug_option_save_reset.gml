/// debug_option_save_reset(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Reset Save";

    // Confirm:
    case 2:
        game_reset_save();
        return true;

    // Undefined:
    default:
        return undefined;
}
