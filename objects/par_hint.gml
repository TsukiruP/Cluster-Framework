#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Help Initialization

event_inherited();
reaction_index = player_reaction_hint;
player_id = noone;
hint_id = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

if (game_ispaused()) exit;

if (player_id != noone) player_id = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hint

with (player_id)
{
    if (text_get_id() != other) hint_allow = true;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text

text_set_id(id);

switch (hint_id)
{
    default:
        text_set_body("This message is a test!");
}
