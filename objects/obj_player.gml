#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization

// Image speed:
image_speed = 0;

// Character data:
character_data = CHAR_SONIC;

// Collision variables:
ground          = true;
collision_layer = 0;
loop_direction  = 0;
angle           = 0;
angle_relative  = 0;
physics_type    = PHYS_DEFAULT;

// Action variable:
action_state = ACTION_DEFAULT;

// Horizontal variables:
x_allow          = true;
x_speed          = 0;
x_top_speed      = 6;
x_max_speed      = 16;
acceleration     = 0.046875;
deceleration     = 0.5;
input_direction  = 0;
input_lock_alarm = 0;

// Vertical variables:
y_allow            = true;
y_speed            = 0;
y_max_speed        = 16;
gravity_force      = 0.21875;
gravity_force_temp = 0.21875;
gravity_angle      = 0;

// Jump variables:
jump_force    = -6.5;
jump_release  = -4;
jump_complete =  false;

// Spin dash charge:
spin_dash_charge = 0;

// Roll variables:
roll_deceleration  = 0.125;
roll_friction      = 0.0234375;
roll_friction_up   = 0.078125;
roll_friction_down = 0.3125;
roll_rebounce      = false;

// Skid dust alarm:
skid_dust_alarm = 3;

// Balance direction:
balance_direction = 0;

// Status variables:
respawn_state       =  0;

invincibility_type  =  0;
invincibility_alarm = -1;

speed_shoe_type     =  0;
speed_shoe_alarm    = -1;

status_panic        =  false;
status_panic_alarm  = -1;

status_swap         =  false;
status_swap_alarm   = -1;

slam_state          = 0;

// After image variables:
afterimage_draw  = false;
afterimage_alarm = 0;

// Shield variables:
shield_data      = 0;
shield_usable    = true;
shield_state     = 0;

shield_insta     = noone;
shield_elemental = noone;

// Tag Action variables:
tag_hold_state    = 0;
tag_hold_timer    = 0;
tag_hold_duration = 68;

tag_link_state    = 0;
tag_arc_timer     = 0;
tag_arc_duration  = room_speed / 2;
tag_arc           = 0;
tag_distance_x    = 0;
tag_distance_y    = 0;
tag_action        = 0;
tag_animations    = false;

// Sonic variables:
peel_out_flag       = false;
peel_out_timer      = 0;

drop_dash_state     = 0;
drop_dash_timer     = 0;
drop_dash_speed     = 8;
drop_dash_max_speed = 12;

// Miles variables:
tornado_timer     = 0;
tornado_duration  = 240;

flight_timer      = 0;
flight_duration   = 480;
flight_animations = true;
flight_carry      = false;

// Knuckles variables:
glide_acceleration  = 0.015625;
glide_top_speed     = 24;
glide_gravity_force = 0.125;
glide_turn_s        = 0;
glide_turn_a        = 0;
glide_carry         = false;

climb_ox            = 0;
climb_speed         = 0;
climb_ledge         = false;

// Classic variables:
clock_up_alarm    = 0;
clock_up_state    = 0;
clock_up_timer    = 0;
clock_up_duration = 900;

// Terrain variables:
terrain_angle_change     = false;
terrain_ceiling_allow    = false;
terrain_launch_allow     = true;
terrain_launch_angle     = 90;
terrain_launch_direction = 1;
terrain_edge_exception   = false;
terrain_edge_skip        = false;

// Platform variables:
platform_instance = noone;
platform_check    = false;

// Water variables:
underwater      = false;
air_remaining   = 30;
air_alarm       = 60;
drown_countdown = 0;
drowned         = false;

// Spring variables:
spring_strength = 0;
spring_alarm    = 0;
spring_angle    = 0;

// Gimmick lock variables:
gimmick_lock       = false;
gimmick_lock_alarm = 0;

// Control variables:
control_cpu   = false;
control_lock  = false;
control_alarm = 0;

// Misc. variables:
wall_stop     =  true;
death_alarm   = -5;
depth_default =  0;
carry_ally    =  noone;
tunnel_lock   =  false;
score_multiplier = 0;

// Create trail:
if(global.misc_trails == true) start_trail(15);
trail_color = c_white;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

player_get_input();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Initialization

animation_grid            = -1;
animation_target          =  "stand";
animation_current         =  "";
animation_previous        =  animation_current;
animation_sprite          =  spr_sonic_stand;
animation_current_frame   =  0;
animation_start_frame     =  0;
animation_end_frame       =  0;
animation_loop_frame      =  0;
animation_loop_count      =  0;
animation_speed           =  0;
animation_rendering_speed =  0;
animation_next            =  "";
animation_next_frame      =  0;
animation_flag_frame      =  0;
animation_changed         =  false;
animation_finished        =  false;

animation_direction       =  1;
animation_x_scale         =  1;
animation_y_scale         =  1;
animation_angle           =  0;
animation_angle_mod       =  0;
animation_blend           =  c_white;
animation_alpha           =  1;
animation_timer           =  0;
animation_depth           =  0;

miles_tails_frame         =  0;
miles_tails_speed         =  0.14;
miles_tails_x             =  0;
miles_tails_y             =  0;
miles_tails_angle         =  0;

draw_x                    =  x;
draw_y                    =  y;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish Initialization

// Go to checkpoint:
if(global.checkpoint_x != -1 && global.checkpoint_y != -1) {
    x                 = global.checkpoint_x;
    y                 = global.checkpoint_y;
    global.stage_time = global.checkpoint_time;
}
#define Alarm_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Restore Wall Stop

wall_stop = true;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Death
// One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.

// Don't bother if the death alarm has been updated:
if(death_alarm == -1) exit;

if(action_state == ACTION_DEATH) {
    if(death_alarm == -5) {
        depth              = -11000
        angle              =  0;
        shield_data        =  0;
        invincibility_type =  0;
        speed_shoe_type    =  0;
        death_alarm        =  128;
        
        if(drowned == false) {
            if(physics_type == PHYS_UNDERWATER) y_speed = -3.5;
            else y_speed = -7;
        } else sound_play("snd_drown");

        // Stop sounds:
        if(sound_isplaying("snd_fly")) sound_stop("snd_fly");
        if(sound_isplaying("snd_fly_drop")) sound_stop("snd_fly_drop");
        
        // Stop jingles:
        if(sound_isplaying("bgm_muteki")) sound_stop("bgm_muteki");
        if(sound_isplaying("bgm_speed_up")) sound_stop("bgm_speed_up");
    }
    
    // Add gravity:
    if(drowned == true) y_speed += 0.0625;
    else y_speed += 0.21875;
    
    y += y_speed;
    
    // Decrease death alarm:
    if(death_alarm > 0) death_alarm -= 1;
    else if(death_alarm == 0) {
        // Respawn partner:
        if(control_cpu == true) action_state = ACTION_RESPAWN;
        
        // Set death alarm:
        death_alarm = -1;
    }
    
    // Retry transition:
    if(control_cpu == false && death_alarm == 64 && !instance_exists(ctrl_transition)) room_transition(room, TRANS_RETRY);
}

// Death at screen bottom:
if(action_state != ACTION_RESPAWN) {
    if(y >= room_height && action_state != ACTION_DEATH) {
        action_state = ACTION_DEATH;
        sound_play("snd_hurt");
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collision

// Don't bother if in the middle of respawning/dying:
if(action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Platform check:
if(!place_meeting(x, y, par_platform) && platform_check == true) platform_check = false;

// Platform handle:

// Horizontal movement:
var x_steps, x_samples;

x_speed   = clamp(x_speed, -x_max_speed, x_max_speed);
x_steps   = 1 + floor(abs(x_speed) / 13);
x_samples = x_speed / x_steps;

repeat(x_steps) {
    x += dcos(angle) * x_samples;
    y -= dsin(angle) * x_samples;
    
    // Move outside of terrain:
    while(x_samples < 0 && player_collision_left(x, y, angle, mask_mid)) {
        x += dcos(angle);
        y -= dsin(angle);
    }
    
    while(x_samples > 0 && player_collision_right(x, y, angle, mask_mid)) {
        x -= dcos(angle);
        y += dsin(angle);
    }
    
    // Handle list:
    player_handle_list();
    
    // Terrain/slope movement:
    if(ground == true) {
        while(player_collision_main(x, y)) {
            x -= dsin(angle);
            y -= dcos(angle);
        }
        
        if(player_collision_slope(x, y, angle, mask_mid)) {
            while(!player_collision_main(x, y)) {
                x += dsin(angle);
                y += dcos(angle);
            }
        }
        
        // Get new angle:
        if(terrain_angle_change == true) {
            if((terrain_edge_skip == false && player_collision_left_edge(x, y, angle) && player_collision_right_edge(x, y, angle)) || terrain_edge_skip == true) {
                if(terrain_edge_exception == true) {
                    var angle_test;
                    
                    // Angle test:
                    angle_test = player_get_angle(x, y, angle);
                    
                    if((angle_test >= 60 && angle_test <= 90) || (angle_test >= 240 && angle_test <= 300)) {
                        if(!player_collision_edge_line()) {
                            ground = false;
                            break;
                        } else player_set_angle(angle_test);
                    }
                } else player_set_angle(player_get_angle(x, y, angle));
            }
        } else player_set_angle(gravity_angle);
    }
    
    // Handle list:
    player_handle_list();
}

// Vertical movement:
y_speed = clamp(y_speed, -y_max_speed, y_max_speed);

if(ground == false) {
    var y_steps, y_samples;
    
    y_steps   = 1 + floor(abs(y_speed) / 13);
    y_samples = y_speed / y_steps;
    
    repeat(y_steps) {
        x += dsin(angle) * y_samples;
        y += dcos(angle) * y_samples;
        
        // Move outside of terrain:
        while(y_samples < 0 && player_collision_top(x, y, gravity_angle, mask_mid)) {
            x += dsin(angle);
            y += dcos(angle);
        }
        
        while(y_samples > 0 && player_collision_bottom(x, y, gravity_angle, mask_mid)) {
            x -= dsin(angle);
            y -= dcos(angle);
        }
        
        // Handle list:
        player_handle_list();
        
        // Floor landing:
        if(y_speed >= 0 && player_collision_bottom(x, y, gravity_angle, mask_big)) {
            // Get new angle:
            if(terrain_angle_change == true) {
                if(terrain_edge_skip == false) {
                    if(player_collision_left_edge(x, y, gravity_angle) && player_collision_right_edge(x, y, gravity_angle)) player_set_angle(player_get_angle(x, y, angle));
                    else player_set_angle(gravity_angle);
                } else player_set_angle(player_get_angle(gravity_angle));
            } else player_set_angle(gravity_angle);
            
            // Change horizontal speed on uneven terrain:
            if(abs(x_speed) <= abs(y_speed) && angle_relative >= 22.5 && angle_relative <= 337.5) {
                x_speed = y_speed * -sign(dsin(angle_relative));
                
                if(angle_relative < 45 || angle_relative > 315) x_speed *= 0.5;
            }
            
            // Set ground:
            ground = true;
        }
        
        // Ceiling landing:
        if(y_speed < 0 && player_collision_top(x, y, gravity_angle, mask_large) && !player_collision_object_top(x, y, gravity_angle, mask_large, par_obstacle)) {
            if(terrain_ceiling_allow == true) {
                // Set angle:
                player_set_angle(180);
                
                // Check if it's possible to attatch to the ceiling:
                if(player_collision_left_edge(x, y, angle) && player_collision_right_edge(x, y, angle)) {
                    // Get new angle:
                    player_set_angle(player_get_angle(x, y, angle));

                    // Check ceiling steepness:
                    if(angle_relative < 135 || angle_relaitve > 225) {
                        // Set X speed and ground:
                        x_speed = y_speed * -sign(dsin(angle_relative));
                        ground  = true;
                    }

                    // Otherwise, detatch:
                    else {
                        player_set_angle(gravity_angle);
                        y_speed = 0;
                    }
                }

                // Reset angle and gravity:
                else {
                    player_set_angle(gravity_angle);
                    y_speed = 0;
                }
            }

            // Reset again:
            player_set_angle(gravity_angle);
            y_speed = 0;
        }

        // Another wall stuck check:
        while(player_collision_left(x, y, angle, mask_mid)) {
            x += dcos(angle);
            y -= dsin(angle);
        }

        while(player_collision_right(x, y, angle, mask_mid)) {
            x -= dcos(angle);
            y += dsin(angle);
        }

        // Copied from horizontal movement:
        if(ground == true) {
            while(player_collision_main(x, y)) {
                x -= dsin(angle);
                y -= dcos(angle);
            }

            if(player_collision_slope(x, y, angle, mask_mid)) {
                while(!player_collision_main(x, y)) {
                    x += dsin(angle);
                    y += dcos(angle);
                }
            }
        }

        // Handle list:
        player_handle_list();
    }
}

// Launch && fall movement:
repeat(x_steps * 2) {
    if(ground == true && angle != gravity_angle && ((x_speed <= 0 && !player_collision_left_edge(x, y, angle)) || (x_speed >= 0 && !player_collision_right_edge(x, y, angle)))) {
        // Launch off ramps:
        if(terrain_launch_allow == true) {
            if(terrain_launch_angle > -1 && terrain_launch_direction != 0 && sign(x_speed) == terrain_launch_direction) {
                // Disable wall stop:
                wall_stop = false;

                if(alarm[0] == -1) alarm[0] = 15;

                // Get new angle:
                player_set_angle(sign(x_speed) * terrain_launch_angle);

                // Set speeds:
                y_speed = -dsin(angle_relative) * x_speed;
                x_speed =  dcos(angle_relative) * x_speed;

                // Set ground:
                ground = true;
            } else {
                y_speed = -(dsin(angle) * x_speed);
                x_speed =   dcos(angle) * x_speed;
                ground  =   false;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Horizontal Movement

// Don't bother if in the middle of respawning/dying or x movement has been disabled:
if(action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || x_allow == false) exit;

// Slope acceleration/deceleration:
if(ground == true && action_state != ACTION_SLIDE) {
    // Check if we're not on a ceiling:
    if(angle_relative < 135 || angle_relative > 225) {
        if(action_state == ACTION_ROLL) {
            // Rolling upwards:
            if(sign(x_speed) == sign(dsin(angle_relative))) x_speed -= dsin(angle_relative) * roll_friction_up;

            // Rolling downwards:
            else x_speed -= dsin(angle_relative) * roll_friction_down;
        } else {
            if(angle_relative >= 22.5 && angle_relative <= 337.5) x_speed -= dsin(angle_relative) * 0.125;
        }
    }
}

// Input acceleration/deceleration:
if((action_state == ACTION_DEFAULT && animation_current != "turn" && animation_current != "look" && animation_current != "crouch") || action_state == ACTION_JUMP ||
    (action_state == ACTION_SKID && animation_current != "skid_turn") || action_state == ACTION_BALANCE || action_state == ACTION_PUSH || action_state == ACTION_BREATHE ||
    action_state == ACTION_FLY || (action_state == ACTION_TORNADO && animation_current == "tornado") || action_state == ACTION_GLIDE_DROP) {
    // Input direction:
    input_direction = player_input[INP_RIGHT, CHECK_HELD] - player_input[INP_LEFT, CHECK_HELD];

    // Ground movement:
    if(ground == true && action_state != ACTION_PUSH) {
        if(input_direction != 0) {
            if(input_lock_alarm == 0) {
                // Turn:
                if(global.gameplay_turn == true && (angle_relative < 45 || angle_relative > 315) && ((action_state != ACTION_SKID && abs(x_speed) < 4.5) ||
                    (action_state == ACTION_SKID && sign(x_speed) != -input_direction && tag_animations == true)) && animation_direction != input_direction) {
                     x_speed = 0;

                     // Play animation:
                     if(action_state != ACTION_BALANCE) {
                         if(action_state == ACTION_SKID && tag_animations == true) action_state = ACTION_DEFAULT;

                         animation_target = "turn";
                     }

                     animation_direction *= -1;
                }

                // Decelerate:
                else if(x_speed != 0 && sign(x_speed) != input_direction) {
                    x_speed += deceleration * input_direction;

                    if(sign(x_speed) == input_direction) x_speed = deceleration * input_direction;
                }

                // Accelerate:
                else {
                    // Turn:
                    if(abs(x_speed) < x_top_speed) {
                        x_speed += acceleration * input_direction;

                        if(abs(x_speed) > x_top_speed) x_speed = x_top_speed * input_direction;
                    }
                }
            }
        }

        // Friction
        else x_speed -= min(abs(x_speed), acceleration) * sign(x_speed);
    }

    // Air movement:
    else {
        // Accelerate:
        if(input_direction != 0) {
            if(abs(x_speed) < x_top_speed || sign(x_speed) != input_direction) {
                x_speed += 2 * acceleration * input_direction;

                if(abs(x_speed) > x_top_speed && sign(x_speed) == input_direction) x_speed = x_top_speed * input_direction;
            }
        }

        // Air drag:
        if(abs(x_speed) > 0.125 && y_speed > -4 && y_speed < 0) x_speed *= 0.96875;
    }
}

// Fall if too slow:
if(ground == true && angle_relative >= 45 && angle_relative <= 315 && abs(x_speed) < 2.5 && tunnel_lock == false) {
    if(angle_relative >= 90 && angle_relative <= 270) {
        y_speed = -dsin(angle_relative) * x_speed;
        x_speed =  dcos(angle_relative) * x_speed;
        ground  =  false;
    } else input_lock_alarm = 30;
}

// Get new angle:
if(ground == true && player_collision_left_edge(x, y, angle) && player_collision_right_edge(x, y, angle)) {
    player_set_angle(player_get_angle(x, y, angle));
} else player_set_angle(gravity_angle);

// Wall stop:
if(wall_stop == true) {
    if((x_speed <= 0 && player_collision_left(x, y, angle, mask_big)) || (x_speed >= 0 && player_collision_right(x, y, angle, mask_big))) {
        x_speed = 0;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Vertical Movement

// Don't bother if in the middle of respawning/dying or y movement has been disabled:
if(action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || y_allow == false) exit;

if(ground == true) {
    // Reset gravity:
    if(y_speed != 0) y_speed = 0;
    
    // Reset action state:
    if(action_state == ACTION_HURT || action_state == ACTION_JUMP || action_state == ACTION_CARRY || action_state == ACTION_FLY) {
        // Reset speed when hurt:
        if(action_state == ACTION_HURT) x_speed = 0;
        
        // Reset gravity after flying:
        if(action_state == ACTION_FLY) gravity_force = gravity_force_temp;
        
        action_state = ACTION_DEFAULT;
    }
    
    // Set ground:
    if(!player_collision_bottom(x, y, angle, mask_big)) {
        ground = false;
        player_set_angle(gravity_angle);
    }
} else {
    // Apply gravity force:
    if(action_state != ACTION_CARRY && action_state != ACTION_GLIDE && action_state != ACTION_CLIMB) y_speed = min(y_speed + gravity_force, y_max_speed);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Action States

// Don't bother in the middle of dying:
if(action_state == ACTION_DEATH) exit;

switch(character_data) {
    case CHAR_SONIC:
        break;
    
    case CHAR_MILES:
        miles_action_fly();
        break;
    
    case CHAR_KNUCKLES:
        break;
    
    case CHAR_CLASSIC:
        classic_action_clock_up();
        break;
}

player_action_jump();
player_action_look();
player_action_crouch();
player_action_spin_dash();
player_action_roll();
player_action_skid();
player_action_balance();
player_action_push();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Effects

// Don't bother if in the middle of respawning/dying:
if(action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Invincibility:
if(invincibility_alarm > -1) {
    invincibility_alarm -= 1;
    
    if(invincibility_alarm == 0) {
        invincibility_type  =  0;
        invincibility_alarm = -1;
    }
}

// Hurt invincibility:
if(invincibility_type == 1 && invincibility_alarm == -1) {
    if(ground == true || action_state != ACTION_HURT) invincibility_alarm = 120;
}

// Speed shoes:
if(speed_shoe_alarm > -1) {
    speed_shoe_alarm -= 1;
    
    if(speed_shoe_alarm == 0) {
        speed_shoe_type  =  0;
        speed_shoe_alarm = -1;
    }
}

if(speed_shoe_type == 1) afterimage_draw = true;
else afterimage_draw = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Underwater

// Don't bother if in the middle of respawning/dying:
if(action_state != ACTION_RESPAWN && action_state != ACTION_DEATH && !instance_exists(ctrl_tally)) {
    if(physics_type == PHYS_UNDERWATER) {
        // Refill air if in breathe action or bubble shield:
        if(action_state == ACTION_BREATHE || shield_data == SHIELD_BUBBLE) {
            air_remaining = 30;
            air_alarm     = 60;
            
            // Stop jingle:
            sound_stop("bgm_drown");
        } else {
            // Decrease air alarm:
            if(air_alarm != 0) air_alarm -= 1;
            else {
                switch(air_remaining) {
                    // Drown alert:
                    case 25:
                    case 20:
                    case 15:
                        sound_play("snd_drown_alert");
                        break;
                    
                    // Drown jingle:
                    case 12:
                        sound_play("bgm_drown");
                    
                    // Drown countdown:
                    case 10:
                    case 8:
                    case 6:
                    case 4:
                    case 2:
                        drown_countdown += 1;
                        break;
                    
                    // Drown:
                    case 0:
                        action_state = ACTION_DEATH;
                        drowned      = true;
                    break;
                }
                
                air_remaining -= 1;
                air_alarm      = 60;
            }
            
            // Create bubbles:
            // [PLACEHOLDER]
        }
    } else {
        air_remaining = 30;
        air_alarm     = 60;
        
        // Stop jingle:
        sound_stop("bgm_drown");
    }
} else {
    air_remaining = 30;
    air_alarm     = 60;
    
    // Stop jingle:
    sound_stop("bgm_drown");
}
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Inputs

// Don't bother if in the middle of respawning/dying:
if(action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

player_get_input();

// Input lock:
if(ground == true && input_lock_alarm > 0) input_lock_alarm -= 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Physics

// Update physics type:
if(instance_exists(obj_water_surface)) {
    if(y < obj_water_surface.y) {
        if(physics_type != PHYS_DEFAULT) physics_type = PHYS_DEFAULT;
    }

    if(y > obj_water_surface.y) {
        if(physics_type != PHYS_UNDERWATER) physics_type = PHYS_UNDERWATER;
    }
}

// Physics:
player_get_physics();
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Camera Boundaries

if(instance_exists(ctrl_camera)) {
    if(x <= (ctrl_camera.limit_left + sprite_get_width(mask_main) / 2) && x_speed < 0) {
        if(action_state != ACTION_GLIDE) x_speed = 0;
        else {
            if(x_speed < -glide_acceleration) x_speed = -glide_acceleration;
        }

        x = ctrl_camera.limit_left + sprite_get_width(mask_main) / 2;
        if(ground == true) animation_target = "stand";
    } else if(x >= (ctrl_camera.limit_right - sprite_get_width(mask_main) / 2) && x_speed > 0) {
        if(action_state != ACTION_GLIDE) x_speed = 0;
        else {
            if(x_speed > glide_acceleration) x_speed = glide_acceleration;
        }

        x = ctrl_camera.limit_right - sprite_get_width(mask_main) / 2;
        if(ground == true) animation_target = "stand";
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Animations

// Draw positions:
draw_x = x;
draw_y = y;

// Action animations:
switch(action_state) {
    // Default:
    case ACTION_DEFAULT:
        // Classic default:
        if(character_data == CHAR_CLASSIC) {
            if(ground == true) {
                // Stand:
                if(x_speed == 0 && animation_target != "stand" && animation_target != "wait_leader" && animation_target != "wait_partner") animation_target = "stand";

                if(x_speed <> 0) {
                    // Jog:
                    if(abs(x_speed) < 6.00 && animation_target != "jog") animation_target = "jog";

                    // Run:
                    if(abs(x_speed) >= 6.00 && animation_target != "run") animation_target = "run";
                }
            }
        }

        // Tag default:
        else if(tag_animations == true) {
            if(ground == true) {
                // Stand:
                if(x_speed == 0 && animation_target != "stand" && animation_target != "turn" &&
                    animation_target != "look" && animation_target != "crouch") animation_target = "stand";

                if(x_speed <> 0) {
                    // Walk:
                    if(abs(x_speed) < 3.75 && animation_target != "walk") animation_target = "walk";

                    // Walk fast:
                    if(abs(x_speed) >= 3.75 && abs(x_speed) < 4.50 && animation_target != "walk_fast") animation_target = "walk_fast";

                    // Jog:
                    if(abs(x_speed) >=  4.50 && animation_target != "jog") animation_target = "jog";
                }
            } else {
                // Fall:
                if(animation_target != "turn" && animation_target != "skid" && animation_target != "spring_flight" && animation_target != "spring_fall") animation_target = "spring_fall";
            }
        }

        // Normal default:
        else {
            if(ground == true) {
                // Stand:
                if(x_speed == 0 && animation_target != "stand" && animation_target != "turn" && animation_target != "wait_leader" && animation_target != "wait_partner" &&
                    animation_target != "land" && animation_target != "ready" && animation_target != "look" && animation_target != "crouch") animation_target = "stand";

                if(x_speed <> 0) {
                    // Walk:
                    if(abs(x_speed) < 1.50 && animation_target != "walk") animation_target = "walk";

                    // Walk fast:
                    if(abs(x_speed) >= 1.50 && abs(x_speed) < 3.00 && animation_target != "walk_fast") animation_target = "walk_fast";

                    // Jog:
                    if(abs(x_speed) >= 3.00 && abs(x_speed) < 4.50 && animation_target != "jog") animation_target = "jog";

                    // Jog fast:
                    if(abs(x_speed) >= 4.50 && abs(x_speed) < 6.00 && animation_target != "jog_fast") animation_target = "jog_fast";

                    // Run:
                    if(abs(x_speed) >= 6.00 && animation_target != "run" && animation_target != "dash") animation_target = "run";
                }
            } else {
                // Fall:
                if(animation_target != "turn" && animation_target != "spin_flight" && animation_target != "spin_fall" && animation_current != "skid" && animation_current != "skid_fast" &&
                    animation_current != "skid_turn" && animation_target != "spring_flight" && animation_target != "spring_fall" && animation_target != "fly_cancel") animation_target = "spring_fall";
            }
        }
        break;

    // Jump:
    case ACTION_JUMP:
        // Classic jump:
        if(character_data == CHAR_CLASSIC) {
            if(animation_target != "roll") animation_target = "roll";
        }

        // Tag jump:
        else if(tag_animations == true) {
            if(y_speed <= 0 && animation_target != "spring_flight" && animation_target != "spring_fall") animation_target = "spring_flight";
            if(y_speed > 0 && animation_target != "spring_fall") animation_target = "spring_fall";
        }

        // Normal jump:
        else {
            if(tag_action == TAG_LEAP) {
                if(y_speed <= 0 && animation_target != "leap_flight" && animation_target != "leap_fall" && animation_target != "spring_fall") animation_target = "leap_flight";
                if(y_speed > 0 && animation_target != "leap_fall" && animation_target != "spring_fall") animation_target = "leap_fall";
            } else {
                if((animation_target != "roll" && animation_target != "spin_flight" && animation_target != "spin_fall") || animation_current == "drop_dash") animation_target = "spin_flight";
            }
        }
        break;

    // Look:
    case ACTION_LOOK:
        if(animation_target != "look") animation_target = "look";
        break;

    // Crouch:
    case ACTION_CROUCH:
        if(animation_target != "crouch") animation_target = "crouch";
        break;

    // Spin Dash:
    case ACTION_SPIN_DASH:
        // Classic Spin Dash:
        if(character_data == CHAR_CLASSIC) {
            if(animation_target != "spin_dash") animation_target = "spin_dash";
        } else {
            if(animation_target != "super_spin" && animation_target != "spin_dash") animation_target = "spin_dash";
        }
        break;

    // Roll:
    case ACTION_ROLL:
        if(animation_target != "roll") animation_target = "roll";
        break;

    // Skid:
    case ACTION_SKID:
        // Classic/tag skid:
        if(character_data == CHAR_CLASSIC || tag_animations == true) {
            if(animation_target != "skid") animation_target = "skid";
        }

        // Normal skid:
        else {
            if(animation_target != "skid" && animation_target != "skid_fast" && animation_target != "skid_turn") animation_target = "skid";
        }
        break;

    // Balance:
    case ACTION_BALANCE:
        if(animation_direction == balance_direction) {
            if(animation_target != "balance_front") animation_target = "balance_front";
        } else {
            if(animation_target != "balance_back") animation_target = "balance_back";
        }
        break;

    // Push:
    case ACTION_PUSH:
        if(animation_target != "push") animation_target = "push";
        break;

    // Spring:
    case ACTION_SPRING:
        // Classic spring:
        if(character_data == CHAR_CLASSIC) {
            if((y_speed < 0 || spring_alarm > 0) && animation_target != "spring") animation_target = "spring";
            if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "jog") animation_target = "jog";
        }

        // Tag/normal spring:
        else {
            if((y_speed < 0 || spring_alarm > 0) && animation_target != "spring_flight") animation_target = "spring_flight";
            if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "spring_fall") animation_target = "spring_fall";
        }
        break;

    // Breathe:
    case ACTION_BREATHE:
        if(animation_target != "breathe") animation_target = "breathe";
        break;

    // Hurt:
    case ACTION_HURT:
        if(animation_target != "hurt") animation_target = "hurt";
        break;

    // Death:
    case ACTION_DEATH:
        if(character_data == CHAR_CLASSIC) {

        } else {
            if(animation_target != "death") animation_target = "death";
        }
        break;

    // Fly:
    case ACTION_FLY:
        if(flight_timer == flight_duration) {
            if(animation_target != "fly_drop") animation_target = "fly_drop";
        } else {
            if(animation_target != "fly" && animation_target != "fly_drop" && animation_target != "fly_turn") animation_target = "fly";
        }
        break;
}

// Wait:
if(control_cpu == false && control_lock == false && tag_animations == false && animation_current == "stand" && animation_next == "") {
    if(animation_timer != 400) animation_timer += 1;
    else {
        if(player_exists(1)) animation_next = "wait_leader";
        else animation_next = choose("wait_leader", "wait_partner");

        animation_loop_count = 0;

        // Classic fix:
        if(character_data == CHAR_CLASSIC) animation_target = animation_next;
    }
} else animation_timer = 0;

if(player_exists(1) && animation_current == "wait_leader") {
    var partner_instance;

    // Partner instance:
    partner_instance = global.player_instance[1];

    if(partner_instance.control_alarm == 0 && partner_instance.x_speed == 0 && partner_instance.animation_target != "wait_partner") {
        with(partner_instance) animation_target = "wait_partner";
    }
}

// Missing animations:
if(character_data == CHAR_MILES) {
    if(animation_target == "super_spin") animation_target = "spin_dash";
}

// Animation core:
player_animation_core();

// Align roll:
if(animation_current == "roll" || animation_current == "spin_flight") player_align_roll();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Speed

// Wait speed:
if(character_data == CHAR_SONIC) {
    if(animation_current == "wait_partner") {
        if(floor(animation_current_frame) == animation_end_frame) animation_speed = player_get_animation("wait_partner", 7) * 0.25;
        else animation_speed = player_get_animation("wait_partner", 7);
    }
}

// Running speed:
if(ground == true) {
    if(action_state == ACTION_PEEL_OUT) {
        animation_speed = 0.25 + (abs(peel_out_timer) * 0.01);
    } else {
        if(animation_current == "walk" || animation_current == "walk_fast" || animation_current == "jog" || animation_current == "jog_fast") {
            animation_speed = 0.20 + (abs(x_speed)/ 30);
        }

        if(animation_current == "run" || animation_current == "dash") {
            animation_speed = 0.25 + (abs(x_speed)/ 25);
        }
    }
}

// Flight & fall animation speed:
if(action_state == ACTION_JUMP && animation_current == "roll" ||
    animation_current == "spin_flight" || animation_current == "spin_fall" || animation_current == "spring_flight" || animation_current == "spring_fall" ||
    animation_current == "leap_flight" || animation_current == "leap_fall" || animation_current == "fly_cancel") {
    animation_rendering_speed = 0.25 * max(1 + abs(x_speed) / 25 + abs(y_speed) / 25, 1);
    animation_speed           = animation_rendering_speed;
}

// Roll speed:
if(action_state == ACTION_ROLL) {
    if(ground == true) {
        animation_speed            = 0.25 + (abs(x_speed) / 12);
        aniimation_rendering_speed = animation_speed;

        miles_tails_speed          = 0.14 + (abs(x_speed) / 25 + abs(y_speed) / 25);
    } else {
        aniimation_rendering_speed = animation_speed;
    }
}

// Drop Dash:
if(drop_dash_state == 2) {
    animation_speed            = 0.25 + ((drop_dash_speed + (abs(x_speed) / 4)) / 12);
    aniimation_rendering_speed = animation_speed;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Direction

// Change direction on the ground based on speed and input:
if(action_state != ACTION_DEATH && action_state != ACTION_HURT && animation_current != "turn" && action_state != ACTION_JUMP && action_state != ACTION_LOOK && action_state != ACTION_CROUCH &&
    action_state != ACTION_SPIN_DASH && action_state != ACTION_ROLL && action_state != ACTION_SKID && action_state != ACTION_BALANCE && action_state != ACTION_PUSH && action_state != ACTION_GOAL &&
    animation_current != "fly_turn" && action_state != ACTION_PEEL_OUT && action_state != ACTION_SLIDE && action_state != ACTION_CLIMB) {
    if(x_speed <= 0 && player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;

    if(x_speed >= 0 && player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;
}

// Roll direction
if(action_state == ACTION_ROLL) {
    if(x_speed < 0 && player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;

    if(x_speed > 0 && player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;
}

// Airborne and jump direction:
if((ground == false && action_state == ACTION_DEFAULT) || action_state == ACTION_JUMP || action_state == ACTION_FLY) {
    if(player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;
    if(player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;

    if(action_state == ACTION_JUMP && player_input[INP_LEFT, CHECK_HELD] == true && player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = animation_direction;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Angle

// Don't bother if in the middle of respawning/dying:
if(action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

var angle_mod;

// Animation Angle:
switch(animation_current) {
    // Reset angle:
    case "stand":
    case "turn":
    case "ready":
    case "land":
    case "look":
    case "crouch":
    case "super_spin":
    case "spin_dash":
    case "roll":
    case "skid":
    case "skid_fast":
    case "skid_turn":
    case "balance_front":
    case "balance_back":
    case "push":
    case "breathe":
    case "goal":
    case "hurt":
    case "death":
    case "fly_carry":
    case "glide_carry":
    case "fly":
    case "fly_drop":
    case "swim":
    case "swim_drop":
    case "glide":
    case "glide_drop":
    case "slide":
    case "climb_stand":
    case "climb_move":
    case "climb_ledge":
        animation_angle = 0;
        break;
    
    // Spring angle:
    case "spring_flight":
    case "spring_fall":
        if(character_data != CHAR_CLASSIC && action_state == ACTION_SPRING && spring_alarm > 0) animation_angle = spring_angle - 90;
        else animation_angle = approach_angle(animation_angle, 0, 4);
        break;
    
    // Terrain angle:
    default:
        if(character_data != CHAR_CLASSIC && tag_animations == false) {
            if(ground == true) animation_angle = angle;
            else animation_angle = approach_angle(animation_angle, 0, 4);
        } else {
            if(ground == true) {
                if(terrain_angle_change == false) animation_angle_mod = 0;
                else {
                    var angle_mod;
                    
                    angle_mod = animation_angle_mod;
                    
                    if(angle <= 180) {
                        if(angle < 36) angle_mod = 0;
                        else angle_mod = angle;
                    } else {
                        if(angle > 324) angle_mod = 0;
                        else angle_mod = angle;
                    }
                    
                    if(abs(angle_difference(animation_angle_mod, angle_mod)) < 45) {
                        animation_angle_mod = approach_angle(animation_angle_mod, angle_mod, max(abs(x_speed), 4));
                    } else animation_angle_mod = angle_mod;
                }
            } else animation_angle_mod = approach_angle(animation_angle_mod, 0, 4);
            
            // Rotate:
            animation_angle = round(animation_angle_mod / 45) * 45;
        }
}

// Miles Tails:
if(character_data == CHAR_MILES) {
    if(ground == true) miles_tails_angle = wrap_angle(angle + (180 * (animation_direction == -1)));
    else {
        miles_tails_angle = point_direction(0, 0, x_speed, y_speed);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Depth

// Change animation depth based on control type:
if(player_exists(0)) {
    if(global.player_instance[0] == self.id) animation_depth = -1;
    else animation_depth = 0;
} else animation_depth = 0;

// Apply animation depth when not respawning or being carried:
if(depth != animation_depth && action_state != ACTION_RESPAWN && action_state != ACTION_CARRY) depth = animation_depth;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Afterimage

if(afterimage_draw == true) {
    if(afterimage_alarm > 0) afterimage_alarm -= 1;
    else {
        if(instance_number(eff_afterimage) < 3) {
            afterimage_alarm = 6;

            with(instance_create(floor(draw_x), floor(draw_y), eff_afterimage)) {
                sprite_index = other.animation_sprite;
                image_xscale = other.animation_direction * other.animation_x_scale;
                image_yscale = other.animation_y_scale;
                image_angle  = other.animation_angle;
                image_speed  = 0;
                image_index  = floor(other.animation_current_frame);
                image_alpha  = 0.9;
                depth        = other.depth + 1;

                // Miles' tail
                miles_tails_sprite    = other.miles_tails_sprite;
                miles_tails_frame     = other.miles_tails_frame;
                miles_tails_x         = other.miles_tails_x;
                miles_tails_y         = other.miles_tails_y;
                miles_tails_angle     = other.miles_tails_angle;
                miles_tails_direction = other.miles_tails_direction;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Trail

if(global.misc_trails == false) exit;

if(global.misc_trails == true) {
    switch(character_data) {
        case CHAR_MILES:
            trail_color = c_yellow;
            break;

        case CHAR_KNUCKLES:
            trail_color = c_red;
            break;

        default:
            trail_color = c_blue;
            break;
    }
}
update_trail(floor(x) + (dcos(angle + 90) * (-2 - (1 * angle == 90)) * (1 * action_state == ACTION_ROLL)) + dcos(angle) * x_speed,
    floor(y) - (dsin(angle + 90) * (-3 - (1 * angle != 0)) * (1 * action_state == ACTION_ROLL)) + y_speed - dsin(angle) * x_speed,
    action_state == ACTION_ROLL);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Player

// Knuckles test:
if(tag_animations == true) draw_sprite(spr_knuckles_roll, floor(animation_current_frame), floor(draw_x) + 10 * animation_direction, floor(draw_y) - 2);

// Trail:
if(global.misc_trails == true) {
    draw_set_blend_mode(bm_add);
    draw_set_color(trail_color);
    draw_trail(spr_trail, 20, true);
    draw_set_blend_mode(bm_normal);
}

// Change alpha when hurt:
if(invincibility_type == 1 && invincibility_alarm > 0) animation_alpha = (global.stage_time div 60) mod 3;
else animation_alpha = 1;

// Miles' tails:
if(character_data == CHAR_MILES) {
    miles_tails_x = draw_x - 5 * dcos(miles_tails_angle) - abs(dcos(miles_tails_angle) * (ground == true && animation_direction == -1)) - (abs(dsin(miles_tails_angle)) * animation_direction);
    miles_tails_y = draw_y + 4 * dsin(miles_tails_angle) - abs(dcos(miles_tails_angle) * (ground == true && animation_direction == -1));
    
    if(animation_current == "roll" || (animation_current == "spin_flight" && animation_current_frame >= animation_loop_frame)) draw_sprite_ext(spr_miles_tails, floor(miles_tails_frame), floor(miles_tails_x), floor(miles_tails_y), animation_direction * animation_x_scale, animation_y_scale, wrap_angle(miles_tails_angle - 90), animation_blend, animation_alpha);
}

// Character:
draw_sprite_ext(animation_sprite, floor(animation_current_frame), floor(draw_x), floor(draw_y), animation_direction * animation_x_scale, animation_y_scale, animation_angle, animation_blend, animation_alpha);

// Spin dash dust:
if(action_state == ACTION_SPIN_DASH) {
    if(floor(spin_dash_charge) == 0) draw_sprite_ext(spr_spin_dash_dust, current_time div 40, floor(draw_x - 4 * animation_direction), floor(draw_y), animation_direction, 1, 0, c_white, animation_alpha);
    else draw_sprite_ext(spr_super_spin_dust, current_time div 30, floor(draw_x - 4 * animation_direction), floor(draw_y), animation_direction, 1, 0, c_white, animation_alpha);
}

// Peel out dust:
if(action_state == ACTION_PEEL_OUT) {
    if(peel_out_timer >= 16 && floor(peel_out_timer < 32)) draw_sprite_ext(spr_spin_dash_dust, current_time div 40, floor(draw_x - 4 * animation_direction), floor(draw_y), animation_direction, 1, 0, c_white, animation_alpha);
    else if(peel_out_timer >= 32) draw_sprite_ext(spr_super_spin_dust, current_time div 30, floor(draw_x - 4 * animation_direction), floor(draw_y), animation_direction, 1, 0, c_white, animation_alpha);
}

// Shields:
if(invincibility_type != 2) {
    switch(shield_data) {
        case SHIELD_BASIC:
            draw_sprite_ext(spr_shield_basic, current_time div 60, floor(draw_x), floor(draw_y), 1, 1, 0, c_white, 0.5);
            break;
        
        case SHIELD_MAGNETIC:
            draw_sprite_ext(spr_shield_magnetic, current_time div 65, floor(draw_x), floor(draw_y), 1, 1, 0, c_white, 0.4);
            break;
    }
} else draw_sprite_ext(spr_shield_muteki, current_time div 60, floor(draw_x), floor(draw_y), 1, 1, 0, c_white, 0.7);
