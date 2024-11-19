#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Screen Initialization

// Screen size:
screen_set_size(480, 270);
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Resolution

screen_set_resolution();

// Fullscreen
if (window_get_fullscreen() != game_setting_get("screen_full"))
{
    window_set_fullscreen(game_setting_get("screen_full"));
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Window

screen_set_window();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Caption

if (room_caption != GAME_NAME)
{
    room_caption = GAME_NAME;
}
