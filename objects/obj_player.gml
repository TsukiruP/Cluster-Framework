#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization

image_speed = 0;
gravity_direction = 0;

player_index = 0;
character_index = CHAR_SONIC;
form_index = FORM_BASE;

max_speed = 16;
x_speed = 0;
y_speed = 0;
top_speed_temp = 6;
acceleration_temp = 0.046875;
gravity_force_temp = 0.21875;
slope_friction = 0.125;
air_friction = 0.96875;

state_current = player_state_standby;
state_previous = state_current;
state_changed = false;

surface_alarm = 0;
underwater = false;
player_reset_breath();

wait_alarm = 360;
hint_allow = true;

jump_cap = true;
jump_aux = false;
jump_uncurl = UNCURL_JUMP;
jump_bound = BOUND_NONE;

death_alarm = 0;
death_inst = noone;

tag_leader = false;
tag_leader_time = 0;
player_reset_tag();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collision Initialization

reaction_list = ds_list_create();
solid_list = ds_list_create();
layer = 0;
cliff_direction = 0;
ground_offset = 0;
player_reset_air();

ceiling_land_threshold = -4;
slide_threshold = 2.5;
air_friction_threshold = 0.125;

player_set_radii(6, 14, 3, 0);
hitbox_set_hurtbox();
hitbox_set_attackbox();

x_list = ds_list_create();
y_list = ds_list_create();

for ({var i; i = 0}; i < 16; i += 1)
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

swap_alarm = 0;
boost_mode = false;
boost_speed = 0;
player_reset_status();
player_reset_physics();

air_dash_allow = true;
drop_dash_alarm = 20;
homing_inst = noone;
homing_range = 128;
homing_speed = 12;
homing_alarm = 0;
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
/// Effect Initialization

spin_dash_charge = 0;
spin_dash_inst = noone;
shield_inst = noone;
debuff_inst = noone;
drown_inst = noone;
reticle_inst = noone;

afterimage_draw = false;
afterimage_alarm = 6;

player_trail_init();

waterfall_draw = false;
waterfall_inst = noone;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle Initialization

dash_panel_inst = noone;
spring_inst = noone;
spring_force = 0;
spring_angle = 0;
spring_alarm = 0;
rail_sfx = noone;
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Initialization

animation_current = "stand";
animation_previous = animation_current;
animation_changed = false;
animation_variant = VARIANT_DEFAULT;
animation_moment = 0;
animation_skip = false;
animation_trigger = false;
animation_time = 0;
sequence_init();
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///  Inputs

if (game_ispaused()) exit;

if (input_allow)
{
    if (!input_cpu) player_set_device();
    else
    {
        if (input_cpu_gamepad_alarm > 0)
        {
            input_cpu_gamepad_alarm -= 1;
            if (input_cpu_gamepad_alarm == 0) player_reset_status();
            else player_set_device();
        }

        if (input_cpu_gamepad_alarm == 0)
        {
            var leader_inst; leader_inst = stage_get_player(0);

            player_reset_input();

            if (leader_inst != 0 && instance_exists(leader_inst))
            {
                input_cpu_state_time += 1;

                switch (input_cpu_state)
                {
                    // Crouch:
                    case 1:
                        player_reset_input();

                        if (abs(x_speed) < 0.25 && on_ground && input_lock_alarm == 0)
                        {
                            x_speed = 0;
                            input_cpu_state = 2;
                            input_cpu_state_time = 1;

                            if (state_current != player_state_spin_dash)
                            {
                                image_xscale = esign(leader_inst.x - x, sign(leader_inst.image_xscale));
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

                        with (leader_inst)
                        {
                            input_queue_enqueue(QUEUE_X_DIR, input_x_direction);
                            input_queue_enqueue(QUEUE_Y_DIR, input_y_direction);
                            input_queue_enqueue(QUEUE_JUMP_HELD, player_get_input(INP_JUMP, CHECK_HELD));
                            input_queue_enqueue(QUEUE_JUMP_PRESSED, player_get_input(INP_JUMP, CHECK_PRESSED));
                        }

                        // Move left:
                        if (x > leader_inst.x + 16 + 32 * (abs(leader_inst.x_speed) < 4))
                        {
                            player_set_input(INP_LEFT, CHECK_HELD, true);
                            player_set_input(INP_RIGHT, CHECK_HELD, false);
                            if (sign(image_xscale) == 1 && x_speed != 0 && animation_current != "push") x += 1;
                        }

                        // Move right:
                        if (x < leader_inst.x - 16 - 32 * (abs(leader_inst.x_speed) < 4))
                        {
                            player_set_input(INP_LEFT, CHECK_HELD, false);
                            player_set_input(INP_RIGHT, CHECK_HELD, true);
                            if (sign(image_xscale) == -1 && x_speed != 0 && animation_current != "push") x -= 1;
                        }

                        // Jump:
                        var jump_auto; jump_auto = 0;

                        if (animation_current == "push")
                        {
                            input_cpu_state_time += 1;

                            if (sign(image_xscale) == sign(leader_inst.image_xscale) && leader_inst.animation_current == "push") input_cpu_state_time = 0;
                            jump_auto = pick(input_cpu_state_time < 30, 0, 1);
                        }
                        else
                        {
                            if (y - leader_inst.y < 32)
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

                        if (leader_inst.state_current != player_state_death)
                        {
                            switch (jump_auto)
                            {
                                case 0:
                                    if (on_ground)
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
            }

            for ({var i; i = 0}; i <= INP_AUX; i += 1)
            {
                if (input_get_check(i, CHECK_HELD, DEV_GAMEPAD0 + player_index)) input_cpu_gamepad_alarm = 600;
            }
        }

        // Respawn:
        if (!in_view(self))
        {
            if (input_cpu_respawn_time < 300) input_cpu_respawn_time += 1;

            if (state_current != player_state_interlink && input_cpu_respawn_time >= 300)
            {
                input_cpu_respawn_time = 0;
                player_cpu_respawn();
            }
        }
        else if (input_cpu_respawn_time != 0) input_cpu_respawn_time = 0;
    }
}

input_x_direction = player_get_input(INP_RIGHT, CHECK_HELD) - player_get_input(INP_LEFT, CHECK_HELD);
input_y_direction = player_get_input(INP_DOWN, CHECK_HELD) - player_get_input(INP_UP, CHECK_HELD);

if (on_ground && input_lock_alarm > 0) input_lock_alarm -= 1;
if (status_panic_alarm > 0 && input_lock_alarm == 0) input_x_direction *= -1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (game_ispaused(mnu_pause)) exit;

player_animation_core();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// State

if (game_ispaused()) exit;

if (script_exists(state_current))
{
    script_execute(state_current, STATE_STEP);
    if (state_changed) state_changed = false;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Traits

if (game_ispaused()) exit;

player_trait_swap();
player_trait_tag();
player_trait_boost();

switch (character_index)
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

    if (status_panic_alarm > 0) status_panic_alarm = 0;
    if (status_swap_alarm > 0) status_swap_alarm = 0;
}

if (status_speed == SPEED_SLOW)
{
    if (spring_force == 0)
    {
        if (abs(x_speed) > top_speed) x_speed = top_speed * sign(x_speed);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effects

player_set_depth(player_index);
player_spin_dash_create();
player_shield_create();
player_invin_spark_create();
player_debuff_create();
player_reticle_create();
player_run_splash_create();
player_waterfall_splash_create();

// Afterimage:
if (status_speed == SPEED_UP || boost_mode) afterimage_draw = true;
else if (afterimage_draw)
{
    afterimage_draw = false;
    afterimage_alarm = 6;
}

// Trail:
if (state_current == player_state_roll || state_current == sonic_state_homing) trail_draw = true;
else if (trail_draw) trail_draw = false;

// Stop drowning music:
if (drown_index == -1 && !input_cpu) audio_stop_drown();
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Index

if (stage_get_player(player_index) != id)
{
    player_index = stage_find_player();
    input_cpu = (player_index > 0);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarms

if (game_ispaused(mnu_pause)) exit;

if (swap_alarm > 0) swap_alarm -= 1;
if (status_insta_alarm > 0) status_insta_alarm -= 1;

if (status_invin_alarm > 0)
{
    status_invin_alarm -= 1;

    if (status_invin_alarm == 0)
    {
        status_invin = INVIN_NONE;
        if (!input_cpu) audio_stop_jng("jng_invin");
    }
}

if (status_speed_alarm > 0)
{
    status_speed_alarm -= 1;

    if (status_speed_alarm == 0)
    {
        status_speed = SPEED_NONE;
        if (!input_cpu) audio_stop_jng("jng_speed");
    }
}

if (status_panic_alarm > 0) status_panic_alarm -= 1;

if (spring_alarm > 0)
{
    spring_alarm -= 1;
    if (spring_alarm <= 0) player_reset_spring();
}

if (clock_up_alarm > 0) clock_up_alarm -= 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Breath

if (game_ispaused()) exit;

if (state_current != player_state_death && status_shield != SHIELD_BUBBLE && underwater && !instance_exists(ctrl_tally))
{
    // Decrease breath:
    if (breath_alarm > 0)
    {
        breath_alarm -= 1;

        if (breath_alarm == 0)
        {
            switch (breath_remaining)
            {
                case 25:
                case 20:
                case 15:
                    if (!input_cpu) audio_play_sfx("snd_drown_alert");
                    break;

                case 12:
                    if (!input_cpu) audio_play_drown();

                case 10:
                case 8:
                case 6:
                case 4:
                case 2:
                    player_drown_create();
                    drown_index += 1;
                    break;

                case 0:
                    x_speed = 0;
                    drown = true;
                    player_set_damage(self);
                    break;
            }

            breath_alarm = 60;
            breath_remaining -= 1;
            bubble_count = choose(1, 2);
            if (bubble_count != 1) bubble_alarm = irandom_range(1, 16);
            player_bubble_create();
        }
    }

    // Spawn another bubble:
    if (bubble_count != 1)
    {
        if (bubble_alarm > 0)
        {
            bubble_alarm -= 1;
            if (bubble_alarm == 0) player_bubble_create();
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

if (game_ispaused(mnu_pause)) exit;

ds_list_delete(x_list, 0);
ds_list_delete(y_list, 0);
ds_list_add(x_list, floor(x));
ds_list_add(y_list, floor(y));

if (trail_alpha != -1)
{
    ds_list_delete(trail_alpha, 0);
    ds_list_add(trail_alpha, (trail_draw));
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Image Angle

if (game_ispaused()) exit;

switch (animation_current)
{
    case "stand":
    case "cliff_front":
    case "cliff_back":
    case "wait_leader":
    case "wait_partner":
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
    case "roll":
    case "spin_flight":
    case "spin_fall":
    case "hurt":
    case "death":
    case "push":
    case "ramp_flight":
    case "ramp_fall":
    case "breathe":
    case "goal":
    case "hammer":
    case "insta":
    case "stomp":
    case "stomp_land":
    case "peel_out":
        image_angle = gravity_direction;
        break;

    case "brake":
    case "brake_fast":
    case "skid":
        image_angle = mask_direction;
        break;

    case "spring_flight":
    case "spring_fall":
        if (character_index != CHAR_CLASSIC && spring_angle != ANGLE_DOWN && spring_alarm > 0) image_angle = angle_wrap(spring_angle + gravity_direction - 90);
        else image_angle = approach_angle(image_angle, gravity_direction, 4);
        break;

    default:
        if (on_ground) image_angle = angle;
        else image_angle = approach_angle(image_angle, gravity_direction, 4);

        if (character_index == CHAR_CLASSIC || tag_leader)
        {
            if (on_ground)
            {
                if (image_angle mod 45 != 0) image_angle = roundto(image_angle, 45);
            }
        }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Afterimage

if (game_ispaused(mnu_pause)) exit;

if (afterimage_draw)
{
    if (afterimage_alarm > 0)
    {
        afterimage_alarm -= 1;

        if (afterimage_alarm <= 0)
        {
            if (instance_number(eff_afterimage) < 3)
            {
                player_afterimage_create();
                afterimage_alarm = 6;
            }
        }
    }
}
#define Other_5
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Cleanup

ds_list_destroy(reaction_list);
ds_list_destroy(solid_list);
ds_list_destroy(x_list);
ds_list_destroy(y_list);
if (trail_alpha != -1) ds_list_destroy(trail_alpha);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Player

player_trail_draw();

with (shield_inst)
{
    var shield_depth; shield_depth = (other.status_shield == SHIELD_FIRE && (image_index mod 2) != 0 && sequence_index != seq_shield_fire_dash) || (other.status_shield == SHIELD_LIGHTNING && sequence_moment > 48);

    if (shield_depth) event_draw();
}

image_alpha = pick((status_invin == INVIN_HURT && status_invin_alarm > 0), 1, time_sync(status_invin_alarm, 2, 2));
if (sprite_exists(sprite_index)) draw_self_floored();
with (spin_dash_inst) event_draw();
with (debuff_inst) event_draw();

with (shield_inst)
{
    if (!shield_depth) event_draw();
}

draw_reset();
