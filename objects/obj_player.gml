#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization

image_speed = 0;

sequence_init();

player_id = 0;

physics_id = PHYS_DEFAULT;

top_speed = 6;
max_speed = 16;

x_allow = true;
x_speed = 0;
acceleration = 0.046875;
deceleration = 0.5;
slope_friction = 0.125;
air_friction = 0.96875;

y_allow = true;
y_speed = 0;
gravity_force = 0.21875;
gravity_force_temp = 0.21875;
gravity_direction = 0;

state_current = player_state_standby;
state_previous = state_current;
state_changed = false;

wait_alarm = 360;
hint_allow = true;

jump_cap = true;
jump_aux = false;
jump_force = 6.5;
jump_release = -4;
jump_uncurl = UNCURL_DEFAULT;
jump_bound = BOUND_NONE;

roll_deceleration = 0.125;
roll_friction = 0.0234375;
roll_friction_up = 0.078125;
roll_friction_down = 0.3125;
roll_rebounce = false;

death_alarm = 0;
death_handle = noone;

score_multiplier = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collision Initialization

var i;

solid_list = ds_list_create();
layer = 0;
cliff_direction = 0;
player_reset_air();

ceiling_land_threshold = -4;
slide_threshold = 2.5;
air_friction_threshold = 0.125;

radii_set(6, 14, 3, 0);
wall_radius = x_radius + wall_offset;
hurtbox_set();
hitbox_set();

x_list = ds_list_create();
y_list = ds_list_create();

for (i = 0; i < 16; i += 1)
{
    ds_list_add(x_list, x);
    ds_list_add(y_list, y);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character Initialization

character_id = CHAR_SONIC;

swap_alarm = 0;

air_dash_allow = true;
drop_dash_alarm = 20;
homing_handle = noone;
homing_range = 128;
homing_speed = 12;
bound_speed = 10;
bound_count = 0;
peel_out = false;
peel_out_alarm = 30;

clock_up_state = 0;
clock_up_alarm = 0;
clock_up_max_energy = 600;
clock_up_energy = clock_up_max_energy;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Initialization

status_shield = SHIELD_NONE;
status_shield_allow = true;

status_invin = 0;
status_invin_alarm = 0;
status_insta_alarm = 0;

status_speed = 0;
status_speed_alarm = 0;

status_panic_alarm = 0;
status_swap_alarm = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effect Initialization

spin_dash_charge = 0;
spin_dash_handle = noone;
shield_handle = noone;
debuff_handle = noone;
reticle_handle = noone;

afterimage_draw = false;
afterimage_alarm = 6;

player_trail_init();

waterfall_draw = false;
waterfall_handle = noone;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle Initialization

// Spring variables:
spring_current = noone;
spring_force = 0;
spring_angle = 0;
spring_alarm = 0;

// Gimmick lock variables:
gimmick_lock = false;
gimmick_lock_alarm = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Initialization

surface_time = 0;

underwater = false;
air_remaining = 30;
air_alarm = 60;

drown_index = 0;
drown = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Initialization

animation_current = "stand";
animation_previous = animation_current;
animation_changed = false;

animation_variant = 0;
animation_moment = 0;

animation_finished = false;
animation_trigger = false;
animation_skip = false;
animation_time = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

input_x_direction = 0;
input_y_direction = 0;

input_allow = false;
input_lock_alarm = 0;

input_cpu = false;
input_cpu_state = 0;
input_cpu_state_time = 0;
input_cpu_respawn_time = 0;
input_cpu_gamepad_alarm = 0;

player_reset_input();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///  Inputs

if (game_ispaused())
{
    exit;
}

if (input_allow == true)
{
    if (input_cpu == false)
    {
        player_set_device();
    }
    else
    {
        if (input_cpu_gamepad_alarm > 0)
        {
            input_cpu_gamepad_alarm -= 1;
            player_set_device();

            if (input_cpu_gamepad_alarm == 0)
            {
                player_reset_status();
            }
        }

        if (input_cpu_gamepad_alarm == 0)
        {
            var leader_handle;

            leader_handle = stage_get_player(0);
            player_reset_input();

            if (leader_handle != 0 && instance_exists(leader_handle))
            {
                input_cpu_state_time += 1;

                switch (input_cpu_state)
                {
                    // Crouch:
                    case 1:
                        player_reset_input();

                        if (abs(x_speed) < 0.25 && on_ground == true && input_lock_alarm == 0)
                        {
                            x_speed = 0;
                            input_cpu_state = 2;
                            input_cpu_state_time = 1;

                            if (state_current != player_state_spin_dash)
                            {
                                image_xscale = esign(leader_handle.x - x, leader_handle.image_xscale);
                                player_set_input(INP_DOWN, CHECK_HELD, true);
                            }
                        }
                        break;

                    // Spin Dash:
                    case 2:
                        if (input_cpu_state_time >= 128)
                        {
                            input_cpu_state = 0;
                            input_cpu_state_time = 0;
                            player_set_input(INP_DOWN, CHECK_HELD, false);
                            player_set_input(INP_JUMP, CHECK_PRESSED, false);
                        }
                        else
                        {
                            player_set_input(INP_DOWN, CHECK_HELD, true);
                            player_set_input(INP_JUMP, CHECK_PRESSED, input_cpu_state_time mod 32 == 0);
                            input_cpu_state_time += 1;
                        }
                        break;

                    default:
                        // Spin Dash:
                        if (abs(x_speed) < 0.5 && input_lock_alarm != 0)
                        {
                            input_cpu_state = 1;
                            input_cpu_state_time = 0;
                            break;
                        }

                        // Queues:
                        switch (input_queue_dequeue(QUEUE_X_DIR))
                        {
                            case -1:
                                player_set_input(INP_LEFT, CHECK_HELD, true);
                                break;

                            case 1:
                                player_set_input(INP_RIGHT, CHECK_HELD, true);
                                break;
                        }

                        switch (input_queue_dequeue(QUEUE_Y_DIR))
                        {
                            case -1:
                                player_set_input(INP_UP, CHECK_HELD, true);
                                break;

                            case 1:
                                player_set_input(INP_DOWN, CHECK_HELD, true);
                                break;
                        }

                        player_set_input(INP_JUMP, CHECK_HELD, input_queue_dequeue(QUEUE_JUMP_HELD));
                        player_set_input(INP_JUMP, CHECK_PRESSED, input_queue_dequeue(QUEUE_JUMP_PRESSED));

                        with (leader_handle)
                        {
                            input_queue_enqueue(QUEUE_X_DIR, input_x_direction);
                            input_queue_enqueue(QUEUE_Y_DIR, input_y_direction);
                            input_queue_enqueue(QUEUE_JUMP_HELD, player_get_input(INP_JUMP, CHECK_HELD));
                            input_queue_enqueue(QUEUE_JUMP_PRESSED, player_get_input(INP_JUMP, CHECK_PRESSED));
                        }

                        // Move left:
                        if (x > leader_handle.x + 16 + 32 * (abs(leader_handle.x_speed) < 4))
                        {
                            player_set_input(INP_LEFT, CHECK_HELD, true);
                            player_set_input(INP_RIGHT, CHECK_HELD, false);

                            if (image_xscale == 1 && x_speed != 0 && animation_current != "push")
                            {
                                x += 1;
                            }
                        }

                        // Move right:
                        if (x < leader_handle.x - 16 - 32 * (abs(leader_handle.x_speed) < 4))
                        {
                            player_set_input(INP_LEFT, CHECK_HELD, false);
                            player_set_input(INP_RIGHT, CHECK_HELD, true);

                            if (image_xscale == -1 && x_speed != 0 && animation_current != "push")
                            {
                                x -= 1;
                            }
                        }

                        // Jump:
                        var jump_auto;

                        jump_auto = 0;

                        if (animation_current == "push")
                        {
                            input_cpu_state_time += 1;

                            if (image_xscale == leader_handle.image_xscale && leader_handle.animation_current == "push")
                            {
                                input_cpu_state_time = 0;
                            }

                            jump_auto = pick(input_cpu_state_time < 30, 0, 1);
                        }
                        else
                        {
                            if (y - leader_handle.y < 32)
                            {
                                jump_auto = 2;
                                input_cpu_state_time = 0;
                            }
                            else
                            {
                                input_cpu_state_time += 1;
                                jump_auto = pick(input_cpu_state_time < 64, 0, 1);
                            }
                        }

                        switch (jump_auto)
                        {
                            case 0:
                                if (on_ground == true)
                                {
                                    if (!player_get_input(INP_JUMP, CHECK_HELD))
                                    {
                                        player_set_input(INP_JUMP, CHECK_PRESSED, true);
                                    }

                                    player_set_input(INP_JUMP, CHECK_HELD, true);
                                }

                                jump_cap = false;
                                input_cpu_state_time = 0;
                                break;

                            case 1:
                                player_set_input(INP_JUMP, CHECK_HELD, true);
                                break;
                        }
                }
            }

            if (input_get_check(INP_ANY, CHECK_HELD, DEV_GAMEPAD0 + player_id))
            {
                input_cpu_gamepad_alarm = 600;
            }
        }

        // Respawn:
        if (!in_view())
        {
            input_cpu_respawn_time += 1;

            if (input_cpu_respawn_time >= 300)
            {
                input_cpu_respawn_time = 0;
                player_cpu_respawn();
            }
        }
        else
        {
            if (input_cpu_respawn_time != 0)
            {
                input_cpu_respawn_time = 0;
            }
        }
    }
}

input_x_direction = player_get_input(INP_RIGHT, CHECK_HELD) - player_get_input(INP_LEFT, CHECK_HELD);
input_y_direction = player_get_input(INP_DOWN, CHECK_HELD) - player_get_input(INP_UP, CHECK_HELD);

if (on_ground == true && input_lock_alarm > 0)
{
    input_lock_alarm -= 1;
}

if (status_panic_alarm > 0 && input_lock_alarm == 0)
{
    input_x_direction *= -1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause))
{
    exit;
}

player_animation_core();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// State

if (game_ispaused())
{
    exit;
}

if (script_exists(state_current))
{
    script_execute(state_current, STATE_STEP);

    if (state_changed == true)
    {
        state_changed = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Traits

if (game_ispaused())
{
    exit;
}

player_trait_debug();
player_trait_swap();

switch (character_id)
{
    // Sonic:
    case CHAR_SONIC:
        sonic_trait_reticle();
        break;

    // Classic:
    case CHAR_CLASSIC:
        classic_trait_clock_up();
        break;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debuffs

if (status_invin >= INVIN_BUFF)
{
    if (status_speed == SPEED_SLOW)
    {
        status_speed = SPEED_NONE;
        status_speed_alarm = 0;
    }

    if (status_panic_alarm > 0)
    {
        status_panic_alarm = 0;
    }

    if (status_swap_alarm > 0)
    {
        status_swap_alarm = 0;
    }
}

if (status_speed == SPEED_SLOW)
{
    if (spring_force == 0)
    {
        if (abs(x_speed) > top_speed)
        {
            x_speed = top_speed * sign(x_speed);
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effects

if (state_current != player_state_death)
{
    depth = player_id;
}

if (state_current == player_state_spin_dash && !instance_exists(spin_dash_handle))
{
    with (instance_create(x, y, eff_spin_dash))
    {
        player_handle = other.id;
        player_handle.spin_dash_handle = id;
    }
}

if ((status_shield != SHIELD_NONE || status_invin == INVIN_BUFF) && !instance_exists(shield_handle))
{
    with (instance_create(x, y, eff_shield))
    {
        player_handle = other.id;
        player_handle.shield_handle = id;
    }
}

if (game_get_config("advance_flicker") && status_invin == INVIN_BUFF)
{
    if (sync_rate(status_invin_alarm, 2, 4) == 0)
    {
        effect_create(sequence_shield_invin_spark, x + random_range(-x_radius, x_radius), y + random_range(-y_radius, y_radius));
    }
}

if ((status_speed == SPEED_SLOW || status_panic_alarm > 0) && !instance_exists(debuff_handle))
{
    with (instance_create(x, y, eff_debuff))
    {
        player_handle = other.id;
        player_handle.debuff_handle = id;
    }
}

if (game_get_config("misc_reticle") > 0 && instance_exists(homing_handle) && !instance_exists(reticle_handle))
{
    with (instance_create(x, y, eff_reticle))
    {
        player_handle = other.id;
        player_handle.reticle_handle = id;
    }
}

if (status_speed == SPEED_UP)
{
    afterimage_draw = true;
}
else
{
    afterimage_draw = false;
    afterimage_alarm = 6;
}

if (state_current == player_state_roll || state_current == sonic_state_homing)
{
    trail_draw = true;
}
else
{
    trail_draw = false;
}

if (waterfall_draw == true && !instance_exists(waterfall_handle))
{
    with (instance_create(x, y, eff_waterfall))
    {
        player_handle = other.id;
        player_handle.waterfall_handle = id;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Air

if (game_ispaused())
{
    exit;
}

if (state_current == player_state_death || (physics_id == PHYS_WATER && status_shield == SHIELD_BUBBLE) || instance_exists(ctrl_tally))
{
    air_remaining = 30;
    air_alarm = 60;

    if (state_current != player_state_death && input_cpu == false)
    {
        audio_stop_drown();
    }
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// ID

player_id = stage_find_player();
input_cpu = (player_id > 0);
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarms

if (game_ispaused(mnu_pause))
{
    exit;
}

if (swap_alarm > 0)
{
    swap_alarm -= 1;
}

if (status_insta_alarm > 0)
{
    status_insta_alarm -= 1;
}

if (status_invin_alarm > 0)
{
    status_invin_alarm -= 1;

    if (status_invin_alarm == 0)
    {
        status_invin = INVIN_NONE;

        if (input_cpu == false)
        {
            audio_stop_jng("jng_invin");
        }
    }
}

if (status_speed_alarm > 0)
{
    status_speed_alarm -= 1;

    if (status_speed_alarm == 0)
    {
        status_speed = SPEED_NONE;

        if (input_cpu == false)
        {
            audio_stop_jng("jng_speed");
        }
    }
}

if (status_panic_alarm > 0)
{
    status_panic_alarm -= 1;
}

if (spring_alarm > 0)
{
    spring_alarm -= 1;

    if (spring_alarm <= 0)
    {
        player_reset_spring();
    }
}

if (clock_up_alarm > 0)
{
    clock_up_alarm -= 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Physics

if (instance_exists(obj_water_surface))
{
    if (y < obj_water_surface.y)
    {
        if (physics_id != PHYS_DEFAULT)
        {
            physics_id = PHYS_DEFAULT;
        }
    }

    if (y > obj_water_surface.y)
    {
        if (physics_id != PHYS_WATER)
        {
            physics_id = PHYS_WATER;

            if (status_shield == SHIELD_FIRE || status_shield == SHIELD_LIGHTNING)
            {
                status_shield = SHIELD_NONE;
            }
        }
    }
}

player_get_physics();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Air

if (game_ispaused())
{
    exit;
}

if (state_current != player_state_death && !instance_exists(ctrl_tally))
{
    if (physics_id == PHYS_WATER)
    {
        if (status_shield != SHIELD_BUBBLE)
        {
            if (air_alarm > 0)
            {
                air_alarm -= 1;

                if (air_alarm == 0)
                {
                    switch (air_remaining)
                    {
                        case 25:
                        case 20:
                        case 15:
                            if (input_cpu == false)
                            {
                                audio_play_sfx("snd_drown_alert");
                            }
                            break;

                        case 12:
                            if (input_cpu == false)
                            {
                                audio_play_drown();
                            }

                        case 10:
                        case 8:
                        case 6:
                        case 4:
                        case 2:
                            drown_index += 1;
                            break;

                        // Drown:
                        case 0:
                            x_speed = 0;
                            drown = true;
                            player_set_damage(self);
                            break;
                    }

                    air_remaining -= 1;
                    air_alarm = 60;
                }
            }
        }
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Lists

if (game_ispaused(mnu_pause))
{
    exit;
}

ds_list_delete(x_list, 0);
ds_list_delete(y_list, 0);
ds_list_add(x_list, floor(x));
ds_list_add(y_list, floor(y));

if (trail_alpha != -1)
{
    ds_list_delete(trail_alpha, 0);
    ds_list_add(trail_alpha, (trail_draw == true));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Image Angle

if (game_ispaused())
{
    exit;
}

var angle_mod;

switch (animation_current)
{
    case "stand":
    case "cliff_front":
    case "cliff_back":
    case "wait":
    case "standby":
    case "land":
    case "omochao":
    case "turn":
    case "turn_brake":
    case "look":
    case "look_end":
    case "crouch":
    case "crouch_end":
    case "spin_dash":
    case "spin_charge":
    case "spin":
    case "brake":
    case "brake_fast":
    case "hurt":
    case "death":
    case "push":
    case "breathe":
    case "goal":
    case "hammer":
    case "insta":
    case "stomp":
    case "stomp_land":
    case "peel_out":
        image_angle = gravity_direction;
        break;

    case "spring_flight":
    case "spring_fall":
        if (character_id != CHAR_CLASSIC && spring_angle != ANGLE_DOWN && spring_alarm > 0)
        {
            image_angle = spring_angle - 90;
        }
        else
        {
            image_angle = approach_angle(image_angle, gravity_direction, 4);
        }
        break;

    case "skid":
        image_angle = mask_rotation;
        break;

    default:
        if (on_ground == true)
        {
            image_angle = angle;
        }
        else
        {
            image_angle = approach_angle(image_angle, gravity_direction, 4);
        }

        if (character_id == CHAR_CLASSIC)
        {
            if (on_ground == true)
            {
                if (image_angle mod 45 != 0)
                {
                    image_angle = roundto(image_angle, 45);
                }
            }
        }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Afterimage

if (afterimage_draw == true)
{
    if (afterimage_alarm > 0)
    {
        afterimage_alarm -= 1;

        if (afterimage_alarm <= 0)
        {
            if (instance_number(eff_afterimage) < 3)
            {
                with (instance_create(floor(x), floor(y), eff_afterimage))
                {
                    sprite_index = other.sprite_index;
                    image_index = other.image_index;
                    image_xscale = other.image_xscale;
                    image_angle = other.image_angle;
                    image_alpha = 0.9;
                    depth = other.depth + 1;
                }

                afterimage_alarm = 6;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Splash

if (!instance_exists(obj_water_surface))
{
    exit;
}

if (y > obj_water_surface.y && yprevious < obj_water_surface.y)
{
    x_speed *= 0.50;
    y_speed *= 0.25;

    if (y_speed >= 2.50)
    {
        effect_create(sequence_splash_1, x, obj_water_surface.y, -10);
    }
    else
    {
        effect_create(sequence_splash_0, x, obj_water_surface.y, -10);
    }

    audio_play_sfx("snd_splash", true);
}

else if (y < obj_water_surface.y && yprevious > obj_water_surface.y)
{
    y_speed = max(y_speed * 2, -16);

    if (y_speed <= -6)
    {
        effect_create(sequence_splash_1, x, obj_water_surface.y, -10);
    }
    else
    {
        effect_create(sequence_splash_0, x, obj_water_surface.y, -10);
    }

    audio_play_sfx("snd_splash", true);
}

if (on_surface == true && abs(x_speed) > 0)
{
    surface_time += 1;

    if (surface_time mod 9 == 0)
    {
        if (abs(x_speed) >= 4.50)
        {
            effect_create(sequence_splash_3, x, obj_water_surface.y, depth, image_xscale);
        }
        else
        {
            effect_create(sequence_splash_2, x, obj_water_surface.y, depth, image_xscale);
        }
    }
}
else
{
    surface_time = 0;
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_list_destroy(solid_list);
ds_list_destroy(x_list);
ds_list_destroy(y_list);

if (trail_alpha != -1)
{
    ds_list_destroy(trail_alpha);
}
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Player

var shield_depth;

// Trail:
player_trail_draw();

// Shield:
with (shield_handle)
{
    shield_depth = (other.status_shield == SHIELD_FIRE && (image_index mod 2) != 0 && sequence_index != sequence_shield_fire_dash) || (other.status_shield == SHIELD_LIGHTNING && sequence_moment > 48);

    if (shield_depth == true)
    {
        event_draw();
    }
}

// Player:
image_alpha = 1;

if (status_invin == INVIN_HURT && status_invin_alarm > 0)
{
    image_alpha = sync_rate(status_invin_alarm, 2, 2);
}

if (sprite_exists(sprite_index))
{
    draw_self_floored();
}

// Spin Dash:
with (spin_dash_handle)
{
    event_draw();
}

// Debuff:
with (debuff_handle)
{
    event_draw();
}

// Shield:
with (shield_handle)
{
    if (shield_depth == false)
    {
        event_draw();
    }
}

draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Collision

if (!game_get_debug())
{
    exit;
}

var x_int, y_int, sine, csine;

x_int = floor(x);
y_int = floor(y);

// Bounding box:
if (mask_rotation mod 180 != 0)
{
    draw_rectangle_color(x_int - y_radius, y_int - x_radius, x_int + y_radius, y_int + x_radius, c_orange, c_orange, c_orange, c_orange, true);
}
else
{
    draw_rectangle_color(x_int - x_radius, y_int - y_radius, x_int + x_radius, y_int + y_radius, c_orange, c_orange, c_orange, c_orange, true);
}

// Wall radius:
sine = dsin(mask_rotation);
csine = dcos(mask_rotation);

draw_line_color(x_int - csine * wall_radius, y_int + sine * wall_radius, x_int + csine * wall_radius, y_int - sine * wall_radius, c_white, c_white);

// Hurtbox:
draw_collision(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, image_xscale, mask_rotation, c_maroon);

// Hitbox:
draw_collision(hitbox_left, hitbox_top, hitbox_right, hitbox_bottom, hitbox_offset_x, hitbox_offset_y, image_xscale, mask_rotation, c_green);

draw_reset();
