#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Buzzer Initialization

event_inherited();
move = false;
shoot = false;
buzzer_time = 0;
border_left = 0;
border_right = 0;
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
    var player_id;

    player_id = stage_get_player(0);

    if (instance_exists(player_id))
    {
        var x_sign;

        x_sign = sign(x - player_id.x);
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
    if (buzzer_time < 14)
    {
        buzzer_time += sequence_speed;
        buzzer_time = roundto(buzzer_time, pick(sequence_speed > 0, 1, sequence_speed));

        if (buzzer_time == 14)
        {
            var bullet_x, bullet_y, bullet_angle;

            bullet_x = x + 3 * image_xscale;
            bullet_y = y + 12 * image_yscale;
            bullet_angle = point_direction(bullet_x, bullet_y, stage_get_player(0).x, stage_get_player(0).y);

            bullet_create(bullet_x, bullet_y, sequence_buzzer_bullet, 1.6862745 * dcos(bullet_angle), 1.6862745 * -dsin(bullet_angle));
        }
    }
}

if (!shoot && (sequence_index == sequence_buzzer_aim || sequence_index == sequence_buzzer_move))
{
    var player_id;

    player_id = stage_get_player(0);

    if (instance_exists(player_id))
    {
        if (y <= player_id.y && y + 96 >= player_id.y)
        {
            var x_distance, y_distance;

            x_distance = x - player_id.x;
            y_distance = player_id.y - y;

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
    draw_rectangle(floor(x) - Field("border_left", 0), floor(y) - 2, floor(x) + Field("border_right", 0), floor(y) + 8, true);
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
if (game_get_debug() && move)
{
    draw_set_color(c_red);
    draw_rectangle(floor(xstart) - border_left, floor(ystart) - 2, floor(xstart) + border_right, floor(ystart) + 8, true);
    draw_reset();
}
