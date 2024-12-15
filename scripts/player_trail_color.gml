/// player_trail_color()
// Returns a color based on the character id.

switch (character_id)
{
    // Miles:
    case CHAR_MILES:
        return c_yellow;

    // Knuckles:
    case CHAR_KNUCKLES:
        return c_red;

    // Sonic:
    default:
        return c_blue;
}
