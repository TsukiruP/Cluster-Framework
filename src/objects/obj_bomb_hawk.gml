#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bomb Hawk Initialization

event_inherited();
move = false;
hawk_range = 64;
explosive_alarm = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm

if (game_ispaused()) exit;

if ((sequence_index == seq_bomb_hawk_idle || sequence_index == seq_bomb_hawk_move) && explosive_alarm > 0) explosive_alarm = roundto_step(explosive_alarm, -sequence_speed);
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

// Move:
if (sequence_index == seq_bomb_hawk_move)
{
    x += sequence_speed * image_xscale;
    if (enemy_get_border_hor()) sequence_set(seq_bomb_hawk_move_turn);
}

// Initiate drop:
if ((sequence_index == seq_bomb_hawk_idle || sequence_index == seq_bomb_hawk_move) && explosive_alarm == 0)
{
    var player_inst; player_inst = enemy_get_player_below(hawk_range, true);

    if (instance_exists(player_inst))
    {
        explosive_alarm = 128;
        sequence_set(seq_bomb_hawk_drop);
    }
}

// Create bomb:
if (sequence_index == seq_bomb_hawk_drop && sequence_position(10)) explosive_create(x, y, seq_bomb_hawk_explosive, 0.05 * image_yscale);

sequence_execute();
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

//field move: false
    //field border_left: number
    //field border_right: number

/*preview nodrawself
draw_sprite(Sprite("spr_bomb_hawk", pick(Field("move", 0), 0, 2)), 0, x, y);

if (Field("move", 0))
{
    draw_set_color(c_red);
    draw_rectangle(floor(x) - Field("border_left", 0), floor(y) - 8, floor(x) + Field("border_right", 0), floor(y) + 8, true);
}
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bomb Hawk Initialization

if (move) sequence_init(seq_bomb_hawk_move);
else sequence_init(seq_bomb_hawk_idle);
