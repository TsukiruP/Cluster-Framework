#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Buzzer Initialization

event_inherited();
move = false;
border_left = 0;
border_right = 0;
buzzer_alarm = 0;
bullet_speed = 1.6862745;
player_inst = noone;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

sequence_speed = game_get_speed();

if (sequence_index == seq_buzzer_aim)
{
    player_inst = instance_nearest(x, y, obj_player);

    if (instance_exists(player_inst))
    {
        var x_sign; x_sign = sign(x - player_inst.x);

        if (sign(image_xscale) != -x_sign)
        {
            buzzer_alarm = 0;
            sequence_set(seq_buzzer_aim_turn);
        }
    }
}
else if (sequence_index == seq_buzzer_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right)
    {
        buzzer_alarm = 0;
        sequence_set(seq_buzzer_move_turn);
    }
}

if (sequence_index == seq_buzzer_aim || sequence_index == seq_buzzer_move)
{
    if (buzzer_alarm > 0) buzzer_alarm = roundto_step(buzzer_alarm, -sequence_speed);

    if (buzzer_alarm == 0)
    {
        player_inst = instance_nearest(x, y, obj_player);

        if (instance_exists(player_inst))
        {
            if (y <= player_inst.y && y + 96 >= player_inst.y && player_inst.state_current != player_state_death)
            {
                var x_distance; x_distance = x - player_inst.x;
                var y_distance; y_distance = player_inst.y - y;

                if (sign(image_xscale) == -sign(x_distance) && abs(x_distance) < abs(y_distance) && abs(x_distance * 1.7) >= y_distance && abs(x_distance * 0.58823529) <= y_distance)
                {
                    buzzer_alarm = 128;
                    sequence_set(seq_buzzer_shoot);
                }
            }
        }
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
}

if (sequence_index == seq_buzzer_shoot && sequence_position(12) && instance_exists(player_inst))
{
    var bullet_x; bullet_x = x + 3 * image_xscale;
    var bullet_y; bullet_y = y + 12 * image_yscale;
    var bullet_angle; bullet_angle = point_direction(bullet_x, bullet_y, player_inst.x, player_inst.y);

    bullet_create(bullet_x, bullet_y, seq_buzzer_bullet, dcos(bullet_angle) * bullet_speed, -dsin(bullet_angle) * bullet_speed);
    audio_play_sfx("snd_buzzer_shoot");
}
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
sprite_index = Sprite("spr_buzzer", pick(Field("move", 0), 0, 3));
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
/// Buzzer Initialization

if (move) sequence_init(seq_buzzer_move);
else sequence_init(seq_buzzer_aim);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Buzzer

draw_self_floored();
if (move) draw_enemy_border();
