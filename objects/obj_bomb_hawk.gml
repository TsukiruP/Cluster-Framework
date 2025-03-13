#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Bomb Hawk Initialization

event_inherited();
move = false;
border_left = 0;
border_right = 0;
hawk_range = 64;
explosive_alarm = 0;
y_offset = 0;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

if (sequence_index == seq_bomb_hawk_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right) sequence_set(seq_bomb_hawk_move_turn);
}

if (sequence_index == seq_bomb_hawk_idle || sequence_index == seq_bomb_hawk_move)
{
    if (explosive_alarm > 0) explosive_alarm = roundto_step(explosive_alarm, -sequence_speed);

    if (explosive_alarm == 0)
    {
        var player_inst; player_inst = enemy_get_player_below(hawk_range, true);

        if (instance_exists(player_inst))
        {
            explosive_alarm = 128;
            sequence_set(seq_bomb_hawk_drop);
        }
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}

if (sequence_index == seq_bomb_hawk_drop && sequence_position(10)) explosive_create(x, y, seq_bomb_hawk_explosive, 0.05);
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

/*preview
sprite_index = Sprite("spr_bomb_hawk", pick(Field("move", 0), 0, 2));
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
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Bomb Hawk

draw_sprite_ext(sprite_index, -1, floor(x), floor(y) + y_offset * sign(image_yscale), image_xscale, image_yscale, gravity_direction, c_white, 1);
if (move) draw_enemy_border();
