#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Help Initialization

event_inherited();

reaction_index = player_reaction_hint;

player_handle = noone;
hint_id = 0;
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Message

switch (hint_id)
{
    default:
        text_set_body("This message is a test!");
}
