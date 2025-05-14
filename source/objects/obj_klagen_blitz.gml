#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Klagen Blitz Initialization

event_inherited();
klagen_count = 0;
sequence_init(seq_klagen_blitz_idle);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

var klagen_attack; klagen_attack = (sequence_index == seq_klagen_blitz_attack);

sequence_speed = game_get_speed();

if (klagen_count >= pick(klagen_attack, 6, 9))
{
    klagen_count = 0;
    sequence_set(pick(!klagen_attack, seq_klagen_blitz_idle, seq_klagen_blitz_attack));
}

sequence_execute();
