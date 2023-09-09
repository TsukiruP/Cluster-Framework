#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character Initialization

// Image speed:
image_speed = 0;

// Initialized variable:
initialized = false;

// Character variables:
character_data = CHAR_CLASSIC;
control_type   = 0;

// Collision variables:
ground          = true;
collision_layer = 0;
loop_direction  = 0;
angle           = 0;
angle_relative  = 0;
physics_type    = PHYS_DEFAULT;

// Horizontal variables:
x_allow           = true;
x_speed           = 0;
x_top_speed       = 6;
x_max_speed       = 16;
acceleration      = 0.046875;
deceleration      = 0.5;
slope_factor      = 0.125;
air_acceleration  = 0.09375;
ground_speed      = 0;

acceleration_temp = 0;
deceleration_temp = 0;
friction_temp     = 0;

// Vertical variables:
y_allow            = true;
y_speed            = 0;
y_max_speed        = 16;
gravity_force      = 0.21875;
gravity_force_temp = 0.21875;
gravity_angle      = 0;

// Action variable:
action_state = ACTION_DEFAULT;

// Jump variables:
jump_force    = -6.5;
jump_release  = -4;
jump_complete =  false;
jump_strength  = -6.5;

// Spin dash variables:
spin_dash_strength = 0;
spin_dash_pitch    = 0;

// Roll variables:
roll_deceleration      = 0.125;
roll_friction          = 0.0234375;
roll_deceleration_up   = 0.078125;
roll_deceleration_down = 0.3125;
roll_rebounce          = false;

// Skid variables:
skid_direction  = 0;
skid_dust_alarm = 3;

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

// Sonic variables:
peel_out_flag       = false;
peel_out_timer      = 0;

drop_dash_state     = 0;
drop_dash_timer     = 0;
drop_dash_speed     = 8;
drop_dash_max_speed = 12;

// Miles variables:
tornado_timer    = 0;
tornado_duration = 240;

flight_timer     = 0;
flight_duration  = 480;
flight_carry     = false;

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

// Terrain variables:
terrain_angle_change     = false;
terrain_ceiling_allow    = false;
terrain_launch_allow     = true;
terrain_launch_angle     = 90;
terrain_launch_direction = 1;
terrain_edge_exception   = false;
terrain_edge_skip        = false;

// Platform variables:
platform_id    = noone;
platform_mode  = false;
platform_check = false;

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

// Input lock variables:
input_lock_alarm     = 0;
input_lock_direction = 0;
input_lock_left      = 0;
input_lock_right     = 0;

// Gimmick lock variables:
gimmick_lock       = false;
gimmick_lock_alarm = 0;

// Misc. variables:
wall_stop_allow =  true;
death_alarm     = -5;
depth_default   =  0;
carry_ally      =  noone;
tunnel_lock     =  false;

// Create trail:
if(global.misc_trails == true) start_trail(15);
trail_color = c_white;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

character_input_blank();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Initialization

animation_grid            = -1;
animation_target          =  "stand";
animation_current         =  ""
animation_previous        =  animation_current;
animation_sprite          =  spr_sonic_stand;
animation_current_frame   =  0;
animation_start_frame     =  0;
animation_end_frame       =  0;
animation_loop_frame      =  0;
animation_loop_count      =  0;
animation_speed           =  0;
animation_rendering_speed =  0;
animation_next            =  0;
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

miles_tails_sprite        =  noone;
miles_tails_frame         =  0;
miles_tails_speed         =  0;
miles_tails_x             =  0;
miles_tails_y             =  0;
miles_tails_angle         =  0;
miles_tails_direction     =  1;

draw_x                    =  x;
draw_y                    =  y;

//character_compile_animations();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish Initialization

initialized = true;

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

wall_stop_allow = true;
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
        if(control_type == 2) action_state = ACTION_RESPAWN;
        
        // Set death alarm:
        death_alarm = -1;
    }
    
    // Retry transition:
    if(control_type == 1 && death_alarm == 64 && !instance_exists(ctrl_transition)) room_transition(room, TRANS_RETRY);
}

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

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Platform fix:
if(character_collision_platform_fix(x, y, angle, mask_platform_fix)) platform_mode = true;
else platform_mode = false;

// X movement:
var x_steps, x_samples;

// X speed limit:
x_speed = clamp(x_speed, -x_max_speed, x_max_speed);

x_steps   = 1;
x_steps  += floor(abs(x_speed) / 13);
x_samples = x_speed / x_steps;

repeat(x_steps) {
    x += dcos(angle) * x_samples;
    y -= dsin(angle) * x_samples;
    
    // Move outside of terrain:
    while(x_samples < 0 && character_collision_left(x, y, angle, mask_mid)) {
        x += dcos(angle);
        y -= dsin(angle);
    }
    
    while(x_samples > 0 && character_collision_right(x, y, angle, mask_mid)) {
        x -= dcos(angle);
        y += dsin(angle);
    }
    
    // Handle list:
    character_handle_list();
    
    // Terrain & slope movement:
    if(ground == true) {
        while(character_collision_main(x, y)) {
            x -= dsin(angle);
            y -= dcos(angle);
        }
        
        if(character_collision_slope(x, y, angle, mask_mid)) {
            while(!character_collision_main(x, y)) {
                 x += dsin(angle);
                 y += dcos(angle);
            }
        }
        
        // Set angle:
        if(y_allow == true) {
            if(terrain_angle_change == true) {
                if((terrain_edge_skip == false && character_collision_left_edge(x, y, angle) && character_collision_right_edge(x, y, angle)) || terrain_edge_skip == true) {
                    if(terrain_edge_exception == true) {
                        var angle_test;
                        
                        angle_test = character_get_angle(x, y, angle);
                        
                        if((angle_test >= 60 && angle_test <= 90) || (angle_test >= 240 && angle_test <= 300)) {
                            if(!character_collision_edge_line()) {
                                ground = false;
                                break;
                            } else angle = angle_test;
                        }
                    } else angle = character_get_angle(x, y, angle);
                }
            } else angle = gravity_angle;
        }
    }
    
    // Handle list:
    character_handle_list();
    
    // Abort:
    if(x_speed == 0) break;
}

// Y movement;
var y_steps, y_samples;

// Y speed limit:
y_speed = clamp(y_speed, -y_max_speed, y_max_speed);

if(ground == false) {
    y_steps   = 1;
    y_steps  += floor(abs(y_speed) / 13);
    y_samples = y_speed / y_steps;
    
    repeat(y_steps) {
        x += dsin(angle) * y_samples;
        y += dcos(angle) * y_samples;
        
        // Move outside of terrain:
        while(y_samples < 0 && character_collision_top(x, y, gravity_angle, mask_mid)) {
            x += dsin(angle);
            y += dcos(angle);
        }
        
        while(y_samples > 0 && character_collision_bottom(x, y, gravity_angle, mask_mid)) {
            x -= dsin(angle);
            y -= dcos(angle);
        }
        
        // Handle list:
        character_handle_list();
        
        // Floor landing:
        if(y_speed >= 0 && character_collision_bottom(x, y, gravity_angle, mask_big)) {
            if(terrain_angle_change == true) {
                if(terrain_edge_skip == false) {
                    if(character_collision_left_edge(x, y, gravity_angle) && character_collision_right_edge(x, y, gravity_angle)) {
                        character_set_angle(character_get_angle(x, y, angle));
                    } else character_set_angle(gravity_angle);
                } else character_set_angle(character_get_angle(x, y, angle));
            } else character_set_angle(gravity_angle);
            
            // Obstacle landing:
            if(character_collision_object_bottom(x, y, angle, mask_main, par_obstacle)) character_set_angle(gravity_angle);
            
            // Change x speed when landing on awkward terrain:
            if(abs(x_speed) <= abs(y_speed) && angle_relative > 35 && angle_relative < 324) {
                x_speed = -y_speed * sign(dsin(angle_relative));
                
                if(angle_relative < 45 || angle_relative > 315) x_speed *= 0.5;
            }
            
            // Set ground:
            y_speed = 0;
            ground  = true;
            
            // Return to default state:
            if(action_state != ACTION_GLIDE && action_state != ACTION_GLIDE_DROP && action_state != ACTION_SLIDE && drop_dash_state < 2) {
                if(action_state != ACTION_HURT){
                   action_state     = ACTION_DEFAULT;
                   animation_target = "land";
                }
            }
            
            // Reset gravity force after flying:
            if(action_state == ACTION_FLY || action_state == ACTION_FLY_DROP) gravity_force = gravity_force_temp;
        }
        
        // Ceiling landing:
        if(y_speed < 0 && terrain_ceiling_allow == true && character_collision_top(x, y, gravity_angle, mask_large) && !character_collision_object_top(x, y, angle, mask_large, par_obstacle)) { 
            // Set angle:
            character_set_angle(gravity_angle + 180);
            
            // Check if landing is possible:
            if(character_collision_left_edge(x, y, angle) && character_collision_right_edge(x, y, angle)) {
                // Set angle:
                character_set_angle(character_get_angle(x, y, angle));
                
                // Check fi the angle isn't flat:
                if(angle_relative > 160 && angle_relative < 200) {
                    character_set_angle(gravity_angle);
                    y_speed = 0;
                }

                // Set speeds:
                x_speed -= dsin(angle) * y_speed;
                y_speed  = 0;

                // Set ground:
                if(ground == false && angle != 0 && drop_dash_state < 2 && action_state != ACTION_FLY && action_state != ACTION_FLY_DROP) {
                    ground = true;

                    if(action_state != ACTION_DEFAULT);
                }
            } else {
                character_set_angle(gravity_angle);
                y_speed = 0;

                if(ground == false) break;
            }
        }

        // Another collision check:
        while(character_collision_left(x, y, angle, mask_mid)) {
            x += dcos(angle);
            y -= dsin(angle);
        }

        while(character_collision_right(x, y, angle, mask_mid)) {
            x -= dcos(angle);
            y += dsin(angle);
        }

        // Another move outside of terrain:
        if(ground == true) {
            while(character_collision_main(x, y)) {
                x -= dsin(angle);
                y -= dcos(angle);
            }

            if(character_collision_slope(x, y, angle, mask_mid)) {
                while(!character_collision_main(x, y)) {
                        x += dsin(angle);
                        y += dcos(angle);
                }
            }
        }

        // Handle list:
        character_handle_list();

        // Abort:
        if(y_speed == 0) break;
    }
}

// Launch movement:
repeat(x_steps * 2) {
    if(ground == true && angle != 0 && ((x_speed <= 0 && !character_collision_left_edge(x, y, angle)) || (x_speed >= 0 && !character_collision_right_edge(x, y, angle)))) {
        if(terrain_launch_allow == true) {
            if(angle != 90 && angle != 180 && angle != 270 && terrain_launch_angle != -1 && terrain_launch_direction != 0 && sign(x_speed) == terrain_launch_direction) {
                // Disable wall stop:
                wall_stop_allow = false;

                if(alarm[0] == -1) alarm[0] = 15;

                // Set angles:
                angle_relative = sign(x_speed) * terrain_launch_angle;
                angle          = sign(x_speed) * terrain_launch_angle;

                // Set speeds:
                y_speed = -dsin(angle_relative) * x_speed;
                x_speed =  dcos(angle_relative) * x_speed;

                // Set ground:
                ground = false;

                // Set angles again:
                angle_relative = sign(x_speed) * terrain_launch_angle;
                angle          = sign(x_speed) * terrain_launch_angle;
            } else {
                ground  =  false;
                y_speed = -(dsin(angle) * x_speed);
                x_speed =   dcos(angle) * x_speed;
            }
        }
    }
}

// Ground speed:
if (abs(x_speed) <= abs(y_speed)) ground_speed = y_speed * -dsin(angle);
else ground_speed = x_speed;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Horizontal Movement

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Input lock alarm:
if(input_lock_alarm > 0) input_lock_alarm -= 1;
else {
    input_lock_alarm     = 0;
    input_lock_direction = 0;
}

if(angle == 0 && input_lock_alarm > 0) {
    input_lock_alarm     = 0;
    input_lock_direction = 0;
}

// Acceleration & deceleration values:
if(ground == true) {
    acceleration_temp = acceleration;
    deceleration_temp = deceleration;
    friction_temp     = acceleration_temp;
} else {
    acceleration_temp = acceleration * 2;
    deceleration_temp = 0;
    friction_temp     = 0;
}

// Movement:
if(x_allow == true) {
    // Decelerate on slopes:
    if(action_state == ACTION_ROLL) {
        // Rolling up:
        if((angle_relative < 180 && x_speed > 0) || (angle_relative > 180 && x_speed < 0)) {
            x_speed -= dsin(angle_relative) * roll_deceleration_up;
        } else {
            x_speed -= dsin(angle_relative) * roll_deceleration_down;
        }
    } else {
        // Normal deceleration:
        if((angle_relative > 35 && angle_relative < 330) || round(x_speed) != 0 || input_lock_alarm != 0) {
            x_speed -= dsin(angle_relative) * 0.125;
        }
    }
    
    // Input & deceleration:
    if(action_state == ACTION_DEFAULT || action_state == ACTION_JUMP || action_state == ACTION_SKID || action_state == ACTION_FLY || action_state == ACTION_FLY_DROP || (action_state == ACTION_TORNADO && animation_target == "tornado") || action_state == ACTION_GLIDE_DROP || action_state == ACTION_BALANCE || action_state == ACTION_BREATHE) {
        // Ground acceleration:
        if(ground == true) {
            if(input_lock_alarm == 0) {
                if(input_left == true) {
                    if(x_speed > 0) x_speed -= deceleration_temp;
                    else {
                        if(x_speed > -x_top_speed) x_speed -= acceleration_temp;
                    }
                } else if(input_right == true) {
                    if(x_speed < 0) x_speed += deceleration_temp;
                    else {
                        if(x_speed < x_top_speed) x_speed += acceleration_temp;
                    }
                } else {
                    x_speed -= min(abs(x_speed), friction_temp) * sign(x_speed);
                }
            }
        }
        
        // Air acceleration:
        else {
            if(input_left == true) {
                if(action_state == ACTION_FLY || action_state == ACTION_FLY_DROP || action_state == ACTION_GLIDE_DROP) {
                    if(x_speed > 0) x_speed -= acceleration_temp;
                    else if(x_speed > -x_top_speed) x_speed -= air_acceleration;
                } else x_speed -= air_acceleration;
            }
            
            if(input_right == true) {
                if(action_state == ACTION_FLY || action_state == ACTION_FLY_DROP || action_state == ACTION_GLIDE_DROP) {
                    if(x_speed < 0) x_speed += acceleration_temp;
                    else if(x_speed < x_top_speed) x_speed += air_acceleration;
                } else x_speed += air_acceleration;
            }
        }
    }
    
    // Falling off:
    if(ground == true && angle_relative >= 46 && angle_relative <= 315 && abs(x_speed) < 2.5 && tunnel_lock == false) {
        if(angle_relative >= 90 && angle_relative <= 270) {
            y_speed = -dsin(angle_relative) * x_speed;
            x_speed =  dcos(angle_relative) * x_speed;
            ground  =  false;
        } else {
            input_lock_alarm = 30;
            if(input_lock_direction == 0) input_lock_direction = animation_direction;
        }
    }
    
    // Set angle:
    if(ground == true && character_collision_left_edge(x, y, angle) && character_collision_right_edge(x, y, angle)) {
        character_set_angle(character_get_angle(x, y, angle));
    } else character_set_angle(gravity_angle);
    
    // Wall stop:
    if(wall_stop_allow == true) {
        if((x_speed < 0 && character_collision_left(x, y, angle, mask_big)) || (x_speed > 0 && character_collision_right(x, y, angle, mask_big))) {
            x_speed = 0;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Vertical Movement

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Run only if allowed:
if(y_allow == true) {
    if(ground == true) {
        // Reset y speed:
        y_speed = 0;
        
        // Reset state:
        if(action_state == ACTION_HURT || (action_state == ACTION_JUMP && drop_dash_state < 2) || action_state == ACTION_FLY || action_state == ACTION_FLY_DROP || action_state == ACTION_CARRY || action_state == ACTION_SPRING || action_state == ACTION_BREATHE) {
            if(action_state == ACTION_HURT) x_speed = 0;
            
            action_state = ACTION_DEFAULT;
        }
        
        // Set ground:
        if(!character_collision_bottom(x, y, angle, mask_big)) {
            ground = false;
            character_set_angle(gravity_angle);
        }
    } else {
        // Add gravity force:
        if(action_state != ACTION_CARRY) y_speed += gravity_force;
        
        // Set ground:
        if(y_speed >= 0 && character_collision_bottom(x, y, angle, mask_big)) ground = true;
        
        // Ceiling collision:
        if(y_speed < 0 && character_collision_top(x, y, angle, mask_big)) {
            y_speed = 0;
            
            if(action_state == ACTION_DEFAULT && x_speed == 0 && y_speed == 0) action_state = ACTION_ROLL;
        }
        
        // Reset hurt speed:
        if(y_speed >= 0 && action_state == ACTION_HURT && character_collision_bottom(x, y, angle, mask_main)) {
            x_speed      = 0;
            action_state = ACTION_DEFAULT;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Air Drag

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

if(ground == false && action_state != ACTION_HURT && action_state != ACTION_GLIDE) {
    if(y_speed < 0 && y_speed > -4) x_speed -= floor(x_speed / 0.125) / 256;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Action States

// Don't bother if not initialized or in the middle of dying:
if(initialized == false || action_state == ACTION_DEATH) exit;

character_action_jump();
character_action_look();
character_action_crouch();
character_action_spin_dash();
character_action_roll();
character_action_skid();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Disabling

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Reset gimmick lock:
if(gimmick_lock == true && action_state = ACTION_JUMP) {
    input_lock_direction = 0;
    gimmick_lock_alarm   = 0;
}

// Disable direction lock when angle is 0:
if(angle == 0 && input_lock_direction != 0) input_lock_direction = 0;

// Disable gimmick lock:
if(gimmick_lock == true && gimmick_lock_alarm < 1) {
    input_lock_left  = false;
    input_lock_right = false;
    gimmick_lock     = false;
}

// Gimmick lock sets your input:
if(gimmick_lock == true) {
    if(x_speed > 0) {
        input_right     = true;
        input_lock_left = true;
    } else if(x_speed < 0) {
        input_left       = true;
        input_lock_right = true;
    }
}

// Decrease gimmick lock alarm:
if(gimmick_lock_alarm > 0) gimmick_lock_alarm -= 1;
else gimmick_lock_alarm = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Effects

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Invincibility alarm:
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

// Speed shoes alarm:
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

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

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
                    action_state  = ACTION_DEATH;
                    air_remaining = 30;
                    air_alarm     = 60;
                    drowned       = true;
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
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Inputs

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

if(control_type == 1) character_input_player();
else character_input_blank();

// Input lock:
if(input_lock_alarm != 0){
    if(input_lock_direction == -1) input_left = false;
    if(input_lock_direction == 1) input_right = false;
}

if(input_lock_left == true) input_left = false;
if(input_lock_right == true) input_right = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Physics

// Previous positions:
previous_x = x;
previous_y = y;

// Update physics type:
if(instance_exists(obj_water_surface)) {
    if(y < obj_water_surface.y) {
        if(physics_type != PHYS_DEFAULT) physics_type = PHYS_DEFAULT;
    }

    if(y > obj_water_surface.y) {
        if(physics_type != PHYS_UNDERWATER) physics_type = PHYS_UNDERWATER;
    }
}

switch(physics_type) {
    case PHYS_UNDERWATER:
        // Horizontal variables:
        x_top_speed      = 3;
        x_max_speed      = 8;
        acceleration     = 0.0234375;
        deceleration     = 0.25;
        slope_factor     = 0.25;
        air_acceleration = 0.046875;

        // Vertical variables:
        if(action_state != ACTION_FLY && action_state != ACTION_FLY_DROP && action_state != ACTION_GLIDE && action_state != ACTION_CLIMB) {
            if(action_state == ACTION_HURT) gravity_force = 0.09375;
            else gravity_force = 0.0625;
        } else if(action_state == ACTION_GLIDE || action_state == ACTION_CLIMB) gravity_force = 0;

        // Jump variables:
        if(character_data == CHAR_KNUCKLES) jump_force = -3;
        else jump_force = -3.5;

        jump_release = -2;

        // Roll variables:
        roll_friction = 0.01171875;

        // Knuckles variables:
        glide_acceleration  = 0.0078125;
        glide_gravity_force = 0.0625;
        break;

    default:
        // Horizontal variables:
        if(speed_shoe_type == 1) x_top_speed = 12;
        else x_top_speed = 6;

        x_max_speed      = 16;

        if(speed_shoe_type == 1) acceleration = 0.09375;
        else acceleration = 0.046875;

        deceleration     = 0.5;
        slope_factor     = 0.125;

        if(speed_shoe_type == 1) air_acceleration = 0.1875;
        else air_acceleration = 0.09375;

        // Vertical variables:
        if(action_state != ACTION_FLY && action_state != ACTION_FLY_DROP && action_state != ACTION_GLIDE && action_state != ACTION_CLIMB) {
            if(action_state == ACTION_HURT) gravity_force = 0.1875;
            else gravity_force = gravity_force_temp;
        } else if(action_state == ACTION_GLIDE || action_state == ACTION_CLIMB) gravity_force = 0;

        // Jump variables:
        if(character_data == CHAR_KNUCKLES) jump_force = -6;
        else jump_force = -6.5;

        jump_release = -4;

        // Roll variables:
        if(speed_shoe_type == 1) roll_friction = 0.046875;
        else roll_friction = 0.0234375;

        // Knuckles variables:
        glide_acceleration  = 0.015625;
        glide_gravity_force = 0.125;
        break;
}
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
        if(ground == true) animation_current = "stand";
    } else if(x >= (ctrl_camera.limit_right - sprite_get_width(mask_main) / 2) && x_speed > 0) {
        if(action_state != ACTION_GLIDE) x_speed = 0;
        else {
            if(x_speed > glide_acceleration) x_speed = glide_acceleration;
        }

        x = ctrl_camera.limit_right - sprite_get_width(mask_main) / 2;
        if(ground == true) animation_current = "stand";
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

// Miles' tails:
miles_tails_get_animation();

// Action animations:
switch(action_state) {
    // Default:
    case ACTION_DEFAULT:
        if(ground == true) {
            if(tag_hold_state == 3) {
                // Stand:
                if(x_speed == 0 && animation_target != "tag_look_end" && animation_target != "tag_crouch_end" && animation_target != "tag_stand") animation_target = "tag_stand";
                
                if(x_speed <> 0) {
                    // Walk:
                    if(abs(x_speed) < 3.75 && animation_target != "tag_walk") animation_target = "tag_walk";
                    
                    // Walk fast:
                    if(abs(x_speed) >= 3.75 && abs(x_speed) <  6.00 && animation_target != "tag_walk_fast") animation_target = "tag_walk_fast";
                    
                    // Jog:
                    if(abs(x_speed) >=  6.00 && abs(x_speed) < 4.50 && animation_target != "tag_jog") animation_target = "tag_jog";
                }
            } else {
                // Stand:
                if(x_speed == 0 && animation_target != "wait_short" && animation_target != "wait_long" && animation_target != "look_end" && animation_target != "crouch_end" && animation_target != "land" && animation_target != "stand") animation_target = "stand";
                
                if(x_speed <> 0) {
                    if(character_data != CHAR_CLASSIC) {
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
                    } else {
                        // Jog:
                        if(abs(x_speed) < 6.00 && animation_target != "jog") animation_target = "jog";
                        
                        // Run:
                        if(abs(x_speed) >= 6.00 && animation_target != "run") animation_target = "run";
                    }
                }
            }
        } else {
            if(character_data != CHAR_CLASSIC) {
                if(tag_hold_state == 3) {
                    if(animation_target != "tag_flight" && animation_target != "tag_fall") animation_target = "tag_fall";
                } else {
                    if(animation_target != "spin_flight" && animation_target != "spin_fall" && animation_target != "spring_flight" && animation_target != "spring_fall") {
                        animation_target       = "spring_fall";
                    }
                }
            }
        }
        break;
    
    // Jump:
    case ACTION_JUMP:
        if(character_data != CHAR_CLASSIC) {
            if(drop_dash_state != 2) {
                if(tag_hold_state == 3) {
                    if(y_speed <= 0 && animation_target != "tag_flight" && animation_target != "tag_fall") animation_target = "tag_flight";
                    if(y_speed > 0 && animation_target != "tag_fall") animation_target = "tag_fall";
                } else if(tag_action == TAG_LEAP) {
                    if(y_speed <= 0 && animation_target != "leap_flight" && animation_target != "leap_fall" && animation_target != "spring_fall") animation_target = "leap_flight";
                    if(y_speed > 0 && animation_target != "leap_fall" && animation_target != "spring_fall") animation_target = "leap_fall";
                } else {
                    if((animation_target != "roll" && animation_target != "spin_flight" && animation_target != "spin_fall") || animation_current == "drop_dash") animation_target = "spin_flight";
                }
            }
        } else {
            if(drop_dash_state != 2 && animation_target != "roll") animation_target = "roll";
        }
        break
    
    // Look:
    case ACTION_LOOK:
        if(tag_hold_state == 3) {
            if(animation_target != "tag_look") animation_target = "tag_look";
        } else {
            if(animation_target != "look") animation_target = "look";
        }
        break;
    
    // Crouch:
    case ACTION_CROUCH:
        if(tag_hold_state == 3) {
            if(animation_target != "tag_crouch") animation_target = "tag_crouch";
        } else {
            if(animation_target != "crouch") animation_target = "crouch";
        }
        break;
    
    // Spin Dash:
    case ACTION_SPIN_DASH:
        if(animation_target != "super_spin" && animation_target != "spin_dash") animation_target = "spin_dash";
        break;
    
    // Roll:
    case ACTION_ROLL:
        if(animation_target != "roll") animation_target = "roll";
        break;
    
    // Skid:
    case ACTION_SKID:
        if(tag_hold_state == 3) {
            if(animation_target != "tag_skid") animation_target = "tag_skid";
        } else {
            if(animation_target != "skid") animation_target = "skid";
        }
        break;
    
    // Hurt:
    case ACTION_HURT:
        if(animation_target != "hurt") animation_target = "hurt";
        break;
    
    // Death:
    case ACTION_DEATH:
        if(character_data != CHAR_CLASSIC) {
            if(animation_target != "death") animation_target = "death";
        } else {
            if(drowned == true) {
                if(animation_target != "drown") animation_target = "drown";
            } else if(animation_target != "death") animation_target = "death";
        }
        break;
    
    // Spring:
    case ACTION_SPRING:
        if(character_data != CHAR_CLASSIC) {
            if(tag_hold_state == 3) {
                if((y_speed < 0 || spring_alarm > 0) && animation_target != "tag_flight") animation_target = "tag_flight";
                if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "tag_fall") animation_target = "tag_fall";
            } else {
                if((y_speed < 0 || spring_alarm > 0) && animation_target != "spring_flight") animation_target = "spring_flight";
                if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "spring_fall") animation_target = "spring_fall";
            }
        } else {
            if((y_speed < 0 || spring_alarm > 0) && animation_target != "spring") animation_target = "spring";
            if(((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "jog") animation_target = "jog";
        }
        break;
    
    // Breathe:
    case ACTION_BREATHE:
        if(animation_target != "breathe") animation_target = "breathe";
        break;
}

// Missing animations:
if(character_data == CHAR_CLASSIC || character_data == CHAR_MILES) {
    if(animation_target == "super_spin") animation_target = "spin_dash";
}

if(character_data == CHAR_CLASSIC) {
    if(animation_target == "land" || animation_target == "look_end" || animation_target == "crouch_end") animation_target = "stand";
}

// Animation core:
character_animation_core();

// Align roll:
if(animation_current == "roll" || animation_current == "spin_flight") character_align_roll();

// Animation timer:
if(control_type == 1 && tag_hold_state != 3) {
    if(animation_current == "stand") {
        animation_timer += 1;
        
        // Wait short:
        if(animation_timer == 300) {
            animation_target = "wait_short";
            
            if(partner_exists()) {
                with(global.partner_id) {
                    if(ground == true && action_state == ACTION_DEFAULT) animation_target = "wait_short";
                }
            }
        }
        
        // Wait long:
        if(animation_timer == 500) {
            animation_target = "wait_long";
            
            if(partner_exists()) {
                with(global.partner_id) {
                    if(ground == true && action_state == ACTION_DEFAULT) animation_target = "wait_long";
                }
            }
        }
    } else if(animation_target != "wait_short" && animation_target != "wait_long") animation_timer = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Speed

// Running speed:
if(ground == true) {
    if(action_state == ACTION_PEEL_OUT) {
        animation_speed = 0.25 + (abs(peel_out_timer) * 0.01);
    } else {
        if(animation_current == "walk" || animation_current == "walk_fast" || animation_current == "jog" || animation_current == "jog_fast" || animation_current == "tag_walk" || animation_current == "tag_walk_fast") {
            animation_speed = 0.20 + (abs(ground_speed)/ 30);
        }

        if(animation_current == "run" || animation_current == "dash" || animation_current == "tag_jog") {
            animation_speed = 0.25 + (abs(x_speed)/ 25);
        }
    }
}

// Flight & fall animation speed:
if(animation_current == "spin_flight" || animation_current == "spin_fall" || animation_current == "tag_flight" || animation_current == "tag_fall" ||
    animation_current == "leap_flight" || animation_current == "leap_fall" || animation_current == "spring_flight" || animation_current == "spring_fall" ||
    action_state == ACTION_JUMP && animation_current == "roll") {
    animation_rendering_speed = 0.25 * max(1, 1 + abs(x_speed) / 25 + abs(y_speed) /25);
    animation_speed           = animation_rendering_speed;
}

// Roll speed:
if(action_state == ACTION_ROLL) {
    if(ground == true) {
        animation_speed            = 0.25 + (abs(x_speed) / 12);
        aniimation_rendering_speed = animation_speed;
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
if(action_state != ACTION_DEATH && action_state != ACTION_HURT && action_state != ACTION_JUMP && action_state != ACTION_LOOK && action_state != ACTION_CROUCH &&
    action_state != ACTION_SPIN_DASH && action_state != ACTION_ROLL && action_state != ACTION_SKID && action_state != ACTION_PEEL_OUT && action_state != ACTION_CLIMB && action_state != ACTION_CARRY) {
    if(x_speed <= 0 && input_left == true) animation_direction = -1;

    if(x_speed >= 0 && input_right == true) animation_direction = 1;
}

// Airborne and jump direction:
if((ground == false && action_state == ACTION_DEFAULT) || action_state == ACTION_JUMP) {
    if(input_left == true) animation_direction = -1;
    if(input_right == true) animation_direction = 1;

    if(action_state == ACTION_JUMP && input_left == true && input_right == true) animation_direction = animation_direction;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Angle

// Don't bother if not initialized or in the middle of respawning/dying:
if(initialized == false || action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

var angle_mod;

// Miles Tails:
if(character_data == CHAR_MILES) {
    if(ground == true) miles_tails_angle = angle;
    else {
        miles_tails_angle = point_direction(xprevious, yprevious, x, y,);
    }
}

// Animation Angle:
if(animation_current == "death" || animation_current == "hurt" || animation_current == "stand" || animation_current == "tag_stand" || animation_current == "wait_short" || animation_current == "wait_long" || 
    animation_current == "look" || animation_current == "look_end" || animation_current == "crouch" || animation_current == "crouch_end" || animation_current == "tag_look" || animation_current == "tag_look_end" ||
    animation_current == "tag_crouch" || animation_current == "tag_crouch_end" || animation_current == "super_spin" || animation_current == "spin_dash" || animation_current == "roll" ||
    animation_current == "land" || animation_current == "fly" || animation_current == "fly_drop" || animation_current == "swim" || animation_current == "swim_drop" ||
    animation_current == "glide" || animation_current == "glide_drop" || animation_current == "slide" || animation_current == "climb_stand" || animation_current == "climb_move" || animation_current == "climb_ledge" ||
    animation_current == "fly_carry" || animation_current == "glide_carry" || animation_current == "push" || animation_current == "breathe") {
    animation_angle = 0;
} else if(character_data != CHAR_CLASSIC && action_state == ACTION_SPRING && spring_alarm > 0 && (animation_current == "spring_flight" || animation_current == "spring_fall")) {
    animation_angle = spring_angle - 90;
}
else {
    if(character_data != CHAR_CLASSIC && tag_hold_state != 3) {
        if(ground == true) animation_angle = angle;
        else animation_angle = angle_rotate_towards(0, animation_angle, 4);
    } else {
        if(ground == true) {
            if(terrain_angle_change == false) animation_angle_mod = 0;
            else {
                angle_mod = animation_angle_mod;
                
                if(angle >= 0 && angle <= 180) {
                    if(angle < 36) angle_mod = 0;
                    else angle_mod = angle;
                }
                
                if(angle >= 180 && angle <= 360) {
                    if(angle > 360 - 36) angle_mod = 0;
                    else angle_mod = angle;
                }
                
                if(abs(angle_difference(animation_angle_mod, angle_mod)) < 45) {
                    animation_angle_mod = angle_rotate_towards(angle_mod, animation_angle_mod, max(4, abs(x_speed)));
                } else animation_angle_mod = angle_mod;
            }
        } else angle_rotate_towards(0, animation_angle_mod, 4);
        
        // Rotate:
        animation_angle = round(animation_angle_mod / 45) * 45;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Depth

// Change animation depth based on control type:
switch(control_type) {
    // Player depth:
    case 1:
        animation_depth = -1;
        break;

    default:
        animation_depth = 0;
        break;
}

// Apply animation depth when not respawning or being carried:
if(depth != animation_depth && action_state != ACTION_RESPAWN && action_state != ACTION_CARRY) depth = animation_depth;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Splash
// Creates the splash and sfx when entering and exiting.

if(instance_exists(obj_water_surface)) {
    if((abs(y_speed) >= 0) && ((y > obj_water_surface.y && previous_y < obj_water_surface.y) ^^ (y < obj_water_surface.y && previous_y  > obj_water_surface.y))) {
        // Entering the water:
        if(y > obj_water_surface.y && previous_y < obj_water_surface.y) {
            if(y_speed > 9) dummy_effect_create(spr_splash_large, 0.15, x, obj_water_surface.y, depth - 2);
            else dummy_effect_create(spr_splash_small, 0.15, x, obj_water_surface.y, depth - 2);
        }

        // Exiting the water:
        if(y < obj_water_surface.y && previous_y  > obj_water_surface.y) {
            if(y_speed < -5) dummy_effect_create(spr_splash_large, 0.15, x, obj_water_surface.y, depth - 2);
            else dummy_effect_create(spr_splash_small, 0.15, x, obj_water_surface.y, depth - 2);
        }

        // Play sound:
        sound_play("snd_splash");
    }
}
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
/// Draw Character

// Trail:
if(global.misc_trails == true) {
    draw_set_blend_mode(bm_add);
    draw_set_color(trail_color);
    draw_trail(spr_trail, 20, true);
    draw_set_blend_mode(bm_normal);
}

if(invincibility_type != 1 || (invincibility_type == 1 && (invincibility_alarm > 0 || invincibility_alarm == -1))) {
    if(invincibility_type == 1 && invincibility_alarm > 0 && !((global.stage_time div 60) mod 3)) exit;

    // Miles' tails:
    if(miles_tails_sprite != noone) draw_sprite_ext(miles_tails_sprite, floor(miles_tails_frame), floor(draw_x + miles_tails_x), floor(draw_y + miles_tails_y), miles_tails_direction * animation_x_scale, animation_y_scale, miles_tails_angle, animation_blend, animation_alpha);
    
    // Character:
    draw_sprite_ext(animation_sprite, floor(animation_current_frame), floor(draw_x), floor(draw_y), animation_direction * animation_x_scale, animation_y_scale, animation_angle, animation_blend, animation_alpha);
}

// Spin dash dust:
if(action_state == ACTION_SPIN_DASH) {
    if(floor(spin_dash_strength) == 0) draw_sprite_ext(spr_spin_dash_dust, current_time div 40, floor(draw_x - 4 * animation_direction), floor(draw_y), animation_direction, 1, 0, c_white, animation_alpha);
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
