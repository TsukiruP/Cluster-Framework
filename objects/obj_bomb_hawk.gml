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
bomb_alarm = 0;
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
    if (bomb_alarm > 0)
    {
        bomb_alarm -= sequence_speed;
        bomb_alarm = roundto(bomb_alarm, pick(sequence_speed > 0, 1, sequence_speed));
    }

    if (bomb_alarm == 0)
    {
        var player_inst; player_inst = instance_nearest(x, y, obj_player);

        if (y < player_inst.y && abs(x - player_inst.x) < 64 && player_inst.state_current != player_state_death)
        {
            bomb_alarm = 128;
            enemy_alert_create();
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

draw_sprite_ext(sprite_index, image_index, floor(x), floor(y) + y_offset * sign(image_yscale), image_xscale, image_yscale, gravity_direction, c_white, 1);
if (move) draw_enemy_border();
