/// player_trait_debug()
// 01, 09, 09, 02, 01, 01, 02, 04

if (input_get_check(INP_ALT, CHECK_HELD) && input_get_check(INP_SELECT, CHECK_PRESSED))
{
    global.game_debug = !global.game_debug;
}
