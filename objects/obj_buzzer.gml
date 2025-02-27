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
shoot = false;
buzzer_time = 0;
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

event_inherited();

sequence_speed = game_get_speed();

if (sequence_index == sequence_buzzer_aim)
{
    player_inst = instance_nearest(x, y, obj_player);

    if (instance_exists(player_inst))
    {
        var x_sign; x_sign = sign(x - player_inst.x);

        if (sign(image_xscale) != -x_sign) sequence_set(sequence_buzzer_aim_turn);

        if (shoot)
        {
            if (buzzer_time < 128)
            {
                buzzer_time += sequence_speed;
                buzzer_time = roundto(buzzer_time, pick(sequence_speed > 0, 1, sequence_speed));
            }

            if (buzzer_time >= 128) shoot = false;
        }
    }
}
else if (sequence_index == sequence_buzzer_move)
{
    x += sequence_speed * image_xscale;
    if (x < xstart - border_left || x > xstart + border_right)
    {
        shoot = false;
        sequence_set(sequence_buzzer_move_turn);
    }
}
else if (sequence_index == sequence_buzzer_shoot)
{
    if (instance_exists(player_inst))
    {
        if (buzzer_time < 14)
        {
            buzzer_time += sequence_speed;
            buzzer_time = roundto(buzzer_time, pick(sequence_speed > 0, 1, sequence_speed));

            if (buzzer_time == 14)
            {
                var bullet_x; bullet_x = x + 3 * image_xscale;
                var bullet_y; bullet_y = y + 12 * image_yscale;
                var bullet_angle; bullet_angle = point_direction(bullet_x, bullet_y, player_inst.x, player_inst.y);

                bullet_create(bullet_x, bullet_y, sequence_buzzer_bullet, dcos(bullet_angle) * bullet_speed, -dsin(bullet_angle) * bullet_speed);
            }
        }
    }
}

if (!shoot && (sequence_index == sequence_buzzer_aim || sequence_index == sequence_buzzer_move))
{
    player_inst = instance_nearest(x, y, obj_player);

    if (instance_exists(player_inst))
    {
        if (y <= player_inst.y && y + 96 >= player_inst.y)
        {
            var x_distance; x_distance = x - player_inst.x;
            var y_distance; y_distance = player_inst.y - y;

            if (sign(image_xscale) == -sign(x_distance) && abs(x_distance) < abs(y_distance) && abs(x_distance * 1.7) >= y_distance && abs(x_distance * 0.58823529) <= y_distance)
            {
                shoot = true;
                buzzer_time = 0;
                sequence_set(sequence_buzzer_shoot);
            }
        }
    }
}

if (script_exists(sequence_index))
{
    sequence_update();
    script_execute(sequence_index);
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

if (move) sequence_init(sequence_buzzer_move);
else sequence_init(sequence_buzzer_aim);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Buzzer

draw_self_floored();
if (move) draw_enemy_border();
