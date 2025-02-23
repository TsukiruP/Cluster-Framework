#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Help Initialization

event_inherited();
reaction_index = player_reaction_hint;
player_inst = noone;
hint_index = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Reset

if (game_ispaused()) exit;

if (player_inst != noone) player_inst = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Hint

with (player_inst)
{
    if (text_get_inst() != other) hint_allow = true;
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Text

text_set_inst(id);

switch (hint_index)
{
    default:
        text_set_body("This message is a test!");
}
