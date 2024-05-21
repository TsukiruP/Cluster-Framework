#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization
test = false
// Image speed:
image_speed = 0;

// Timeline initialization:
ctl_initialize();

// Character data:
character_data = CHAR_SONIC;

// Collision variables:
collision_allow        = true;
ground_collision_allow = true;
ground                 = true;
landed                 = false;
mode                   = 0;
layer                  = 0;
ground_angle           = 0;
angle_mode             = 0;
physics_type           = PHYS_DEFAULT;

on_edge                = false;
on_obstacle            = false;

detach_allow           = true;

ceiling_allow          = true;
ceiling_landing        = 0;
ceiling_lock_alarm     = 0;
touching_ceiling       = false;

// Platform variables:
platform_instance = noone;
platform_check    = false;

// Main size variables:
main_left       = 6;
main_right      = 6;
main_top        = 14;
main_bottom     = 14;

rela_main_left  = 0;
rela_main_right = 0;

wall_left       = main_left + 3;
wall_right      = main_right + 3;
wall_top        = 0;
wall_bottom     = 0;

// Hurtbox variables:
hurtbox_left       = 0;
hurtbox_right      = 0;
hurtbox_top        = 0;
hurtbox_bottom     = 0;

hurtbox_offset_x   = 0;
hurtbox_offset_y   = 0;

rela_hurtbox_left  = 0;
rela_hurtbox_right = 0;

// Hitbox variables:
hitbox_left       = 0;
hitbox_right      = 0;
hitbox_top        = 0;
hitbox_bottom     = 0;

hitbox_offset_x   = 0;
hitbox_offset_y   = 0;

rela_hitbox_left  = 0;
rela_hitbox_right = 0;

// Input variables:
input_direction  = 0;
input_lock       = false;
input_lock_alarm = 0;
input_cpu        = false;
input_cpu_alarm  = 0;

// Action variable:
action_state = ACTION_DEFAULT;

// Physics variables:
top_speed        = 6;
max_speed        = 16;

x_allow          = true;
x_direction      = 0;
x_speed          = 0;
acceleration     = 0.046875;
deceleration     = 0.5;

y_allow            = true;
y_direction        = 1;
y_speed            = 0;
gravity_force      = 0.21875;
gravity_force_temp = 0.21875;
gravity_angle      = 0;

g_speed            = 0;

// Default variables:
balance_direction = 0;
push_animation    = false;
hint_wanted       = false;

// Jump variables:
jump_force    =  6.5;
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
roll_forced        = false;
roll_offset        = 0;

// Skid dust alarm:
skid_dust_alarm = 3;

// Shield variables:
shield_data     = 0;
shield_usable   = true;
shield_state    = 0;

shield_insta    = noone;
shield_instance = noone;

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

// Spring variables:
spring_strength = 0;
spring_alarm    = 0;
spring_angle    = 0;

// Gimmick lock variables:
gimmick_lock       = false;
gimmick_lock_alarm = 0;

// Water variables:
water_surface      = false;
water_splash_alarm = 14;

underwater         = false;
air_remaining      = 30;
air_alarm          = 60;

drown_countdown    = 0;
drowned            = false;

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

// After image variables:
afterimage_draw  = false;
afterimage_alarm = 0;

// Misc. variables:
wall_stop     =  true;
death_alarm   = -5;
depth_default =  0;
carry_ally    =  noone;
tunnel_lock   =  false;
score_multiplier = 0;

// Create trail:
if (global.misc_trails == true) start_trail(15);
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

animation_grid      = -1;
animation_current   =  "";
animation_target    =  "";
animation_previous  =  animation_current;
animation_variant   =  0;
animation_moment    =  0;
animation_finished  =  false;
animation_trigger   =  false;
animation_reverse   =  false;
animation_reload    =  false;
animation_alarm     =  0;

animation_direction =  1;
animation_x_scale   =  1;
animation_y_scale   =  1;
animation_angle     =  0;
animation_angle_mod =  0;
animation_blend     =  c_white;
animation_alpha     =  1;
animation_depth     =  0;

miles_tails_frame   =  0;
miles_tails_speed   =  0.14;
miles_tails_x       =  0;
miles_tails_y       =  0;
miles_tails_angle   =  0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Finish Initialization

// Go to checkpoint:
if (global.checkpoint_x != -1 && global.checkpoint_y != -1) {
    x                 = global.checkpoint_x;
    y                 = global.checkpoint_y;
    global.game_time = global.checkpoint_time;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///  Inputs

// Don't bother if in the middle of respawning/dying or the game is paused:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || game_paused()) exit;

// Receive inputs:
player_get_input();

// Input lock:
if (ground == true && input_lock_alarm > 0) input_lock_alarm -= 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Death
// One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.

// Don't bother if the death alarm has been updated or the game is paused:
if (death_alarm == -1 || game_paused()) exit;

if (action_state == ACTION_DEATH) {
    if (death_alarm == -5) {
        depth              = -11000
        ground_angle       =  0;
        shield_data        =  0;
        invincibility_type =  0;
        speed_shoe_type    =  0;
        death_alarm        =  128;
        
        if (drowned == false) {
            if (physics_type == PHYS_UNDERWATER) y_speed = -3.5;
            else y_speed = -7;
        } else {
            sound_play("snd_drown");
        }
        
        global.pause_allow = false;
        
        // Stop sounds:
        if (sound_isplaying("snd_fly")) sound_stop("snd_fly");
        if (sound_isplaying("snd_fly_drop")) sound_stop("snd_fly_drop");
        
        // Stop jingles:
        if (sound_isplaying("bgm_muteki")) sound_stop("bgm_muteki");
        if (sound_isplaying("bgm_speed_up")) sound_stop("bgm_speed_up");
    }
    
    // Add gravity:
    if (drowned == true) y_speed += 0.0625;
    else y_speed += 0.21875;
    
    y += y_speed;
    
    // Decrease death alarm:
    if (death_alarm > 0) {
        death_alarm -= 1;
        
        // Reset death alarm:
        if (death_alarm == 0) {
            // Respawn partner:
            if (input_cpu == true) action_state = ACTION_RESPAWN;
            
            // Set death alarm:
            death_alarm = -1;
        }
    }
    
    // Retry transition:
    if (input_cpu == false && death_alarm == 64 && !instance_exists(ctrl_transition)) transition_create(room, TRANS_RETRY);
}

// Death at screen bottom:
if (action_state != ACTION_RESPAWN) {
    if (y >= room_height && action_state != ACTION_DEATH) {
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

// Don't bother if in the middle of respawning/dying or the game is paused:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || game_paused()) exit;

// Steps:
steps = 1 + abs(floor(x_speed / 13)) + abs(floor(y_speed / 13));

repeat (steps) {
    // Movement:
    player_movement();

    // Semi solid collision:
    player_collision_semisolids();

    // Terrain collision:
    player_collision_terrain();

    // Obstacle collision:
    player_collision_obstacle();

    // Mode:
    player_mode();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Control

// Don't bother if in the middle of respawning/dying or the game is paused:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || game_paused()) exit;

// Slope acceleration/deceleration:
if (ground == true && action_state != ACTION_SLIDE) {
    // Check if we're not on a ceiling:
    if (ground_angle < 135 || ground_angle > 225) {
        if (action_state == ACTION_ROLL) {
            // Rolling upwards:
            if (sign(g_speed) == sign(dsin(ground_angle))) g_speed -= dsin(ground_angle) * roll_friction_up;

            // Rolling downwards:
            else g_speed -= dsin(ground_angle) * roll_friction_down;
        } else {
            if (abs(g_speed) > 0.125 || input_lock_alarm != 0) g_speed -= dsin(ground_angle) * 0.125;
        }
    }
}

// Acceleration & deceleration:
if ((action_state == ACTION_DEFAULT && hint_wanted == false && animation_current != "turn" && animation_current != "look" && animation_current != "crouch") || action_state == ACTION_JUMP ||
    (action_state == ACTION_SKID && animation_current != "skid_turn") || action_state == ACTION_BALANCE || action_state == ACTION_PUSH || action_state == ACTION_BREATHE ||
    action_state == ACTION_FLY || (action_state == ACTION_TORNADO && animation_current == "tornado") || action_state == ACTION_GLIDE_DROP) {
    // Input direction:
    input_direction = player_input[INP_RIGHT, CHECK_HELD] - player_input[INP_LEFT, CHECK_HELD];

    // Ground:
    if (ground == true && action_state != ACTION_PUSH) {
        if (input_direction != 0) {
            if (input_lock_alarm == 0) {
                // Turn:
                if (global.gameplay_turn == true && (ground_angle < 45 || ground_angle > 315) && ((action_state != ACTION_SKID && abs(g_speed) < 4.5) ||
                    (action_state == ACTION_SKID && sign(g_speed) != -input_direction && tag_animations == true)) && animation_direction != input_direction) {
                     g_speed = 0;

                     // Set animation:
                     if (action_state != ACTION_BALANCE) {
                         if (action_state == ACTION_SKID && tag_animations == true) action_state = ACTION_DEFAULT;
                         player_set_animation("turn");
                     }
                }

                // Decelerate:
                else if (g_speed != 0 && sign(g_speed) != input_direction) {
                    g_speed += deceleration * input_direction;

                    if (sign(g_speed) == input_direction) g_speed = deceleration * input_direction;
                }

                // Accelerate:
                else {
                    // Turn:
                    if (abs(g_speed) < top_speed) {
                        g_speed += acceleration * input_direction;

                        if (abs(g_speed) > top_speed) g_speed = top_speed * input_direction;
                    }
                }
            }
        }

        // Friction
        else {
            g_speed -= min(abs(g_speed), acceleration) * sign(g_speed);
        }
    }

    // Air:
    else {
        // Accelerate:
        if (input_direction != 0) {
            if (abs(x_speed) < top_speed || sign(x_speed) != input_direction) {
                x_speed += 2 * acceleration * input_direction;

                if (abs(x_speed) > top_speed && sign(x_speed) == input_direction) x_speed = top_speed * input_direction;
            }
        }

        // Air drag:
        if (abs(x_speed) > 0.125 && y_speed > -4 && y_speed < 0) x_speed *= 0.96875;
    }
}

// Wall stop:
repeat (steps) player_wall_stop();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Action List

// Don't bother if in the middle of respawning/dying or the game is paused:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || game_paused()) exit;

switch (character_data) {
    case CHAR_SONIC:
        break;

    case CHAR_MILES:
        break;

    case CHAR_KNUCKLES:
        break;

    case CHAR_CLASSIC:
        classic_action_clock_up();
        break;
}

player_action_default();
player_action_jump();
player_action_look();
player_action_crouch();
player_action_tag();
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
/// Handle List

// Don't bother if the game is paused:
if (game_paused()) exit;

// Handle scripts:
player_handle_layer();
player_handle_ring();
player_handle_item_box();
player_handle_hint();
player_handle_water_surface();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shield

if (shield_data != 0 && shield_instance == noone) {
    shield_instance = instance_create(x, y, eff_shield);

    with (shield_instance) {
        player_handle = other.id;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Refill Air

// Don't bother if the game is paused:
if (game_paused()) exit;

// Don't bother if in the middle of respawning/dying:
if (action_state != ACTION_RESPAWN && action_state != ACTION_DEATH && physics_type == PHYS_UNDERWATER && !instance_exists(ctrl_tally)) {
    // Refill air if in breathe action or bubble shield:
    if (action_state == ACTION_BREATHE || shield_data == SHIELD_BUBBLE) {
        air_remaining = 30;
        air_alarm     = 60;

        // Stop jingle:
        if (input_cpu == false) sound_stop("bgm_drown");
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
/// Status Effects

// Don't bother if in the middle of respawning/dying or the game is paused:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || game_paused()) exit;

// Invincibility:
if (invincibility_alarm > -1) {
    invincibility_alarm -= 1;
    
    if (invincibility_alarm == 0) {
        invincibility_type  =  0;
        invincibility_alarm = -1;
    }
}

// Speed shoes:
if (speed_shoe_alarm > -1) {
    speed_shoe_alarm -= 1;
    
    if (speed_shoe_alarm == 0) {
        speed_shoe_type  =  0;
        speed_shoe_alarm = -1;
    }
}

if (speed_shoe_type == 1) afterimage_draw = true;
else afterimage_draw = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Physics

// Update physics type:
if (instance_exists(obj_water_surface)) {
    if (y < obj_water_surface.y) {
        if (physics_type != PHYS_DEFAULT) physics_type = PHYS_DEFAULT;
    }

    if (y > obj_water_surface.y) {
        if (physics_type != PHYS_UNDERWATER) physics_type = PHYS_UNDERWATER;
    }
}

// Physics:
player_get_physics();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Air

// Don't bother if the game is paused:
if (game_paused()) exit;

// Don't bother if in the middle of respawning/dying:
if (action_state != ACTION_RESPAWN && action_state != ACTION_DEATH && !instance_exists(ctrl_tally)) {
    if (physics_type == PHYS_UNDERWATER) {
        // Refill air if in breathe action or bubble shield:
        if (action_state != ACTION_BREATHE && shield_data != SHIELD_BUBBLE) {
            if (air_alarm > 0) {
                air_alarm -= 1;

                if (air_alarm == 0) {
                    switch (air_remaining) {
                        // Drown alert:
                        case 25:
                        case 20:
                        case 15:
                            if (input_cpu == false) sound_play("snd_drown_alert");
                            break;

                        // Drown jingle:
                        case 12:
                            if (input_cpu == false) sound_play("bgm_drown");

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
/// Animation Target
// Sets the animation target and then calls the animation core script.

// Don't bother if the game is paused:
if (game_paused(ctrl_pause)) exit;

// Store previous height:
var temp_main_bottom;

temp_main_bottom = main_bottom;

// Action animations:
switch (action_state) {
    // Default:
    case ACTION_DEFAULT:
        // Classic default:
        if (character_data == CHAR_CLASSIC) {
            if (ground == true) {
                // Idle:
                if (g_speed == 0 && animation_target != "idle" && animation_target != "wait") player_set_animation("idle");

                if (g_speed <> 0) {
                    // Jog:
                    if (abs(g_speed) < 6.00 && animation_target != "jog") player_set_animation("jog");

                    // Run:
                    if (abs(g_speed) >= 6.00 && animation_target != "run") player_set_animation("run");
                }
            }
        }

        // Tag default:
        else if (tag_animations == true) {
            if (ground == true) {
                // Idle:
                if (g_speed == 0 && animation_target != "idle" && animation_target != "turn" &&
                    animation_target != "look" && animation_target != "crouch") player_set_animation("idle");

                if (g_speed <> 0) {
                    // Walk:
                    if (abs(g_speed) < 3.75 && animation_target != "walk") player_set_animation("walk");

                    // Walk fast:
                    if (abs(g_speed) >= 3.75 && abs(g_speed) < 4.50 && animation_target != "walk_fast") player_set_animation("walk_fast");

                    // Jog:
                    if (abs(g_speed) >=  4.50 && animation_target != "jog") player_set_animation("jog");
                }
            } else {
                // Fall:
                if (animation_target != "turn" && animation_target != "skid" && animation_target != "spring_flight" && animation_target != "spring_fall") player_set_animation("spring_fall");
            }
        }

        // Normal default:
        else {
            if (ground == true) {
                // Push:
                if (push_animation == true) {
                    if (animation_target != "push") player_set_animation("push");
                } else {
                    if (g_speed == 0) {
                        // Balance:
                        if (balance_direction != 0) {
                            if (animation_direction == balance_direction) {
                                if (animation_target != "balance_front") player_set_animation("balance_front");
                            } else {
                                if (animation_target != "balance_back") player_set_animation("balance_back");
                            }
                        } else {
                            // Idle:
                            if (animation_target != "idle" && animation_target != "turn" && animation_target != "wait" && animation_target != "land"
                            && animation_target != "ready" && animation_target != "look" && animation_target != "crouch" && animation_target != "omochao") player_set_animation("idle");
                        }
                    }

                    if (g_speed <> 0) {
                        // Walk:
                        if (abs(g_speed) < 1.50 && animation_target != "walk") player_set_animation("walk");

                        // Walk fast:
                        if (abs(g_speed) >= 1.50 && abs(g_speed) < 3.00 && animation_target != "walk_fast") player_set_animation("walk_fast");

                        // Jog:
                        if (abs(g_speed) >= 3.00 && abs(g_speed) < 4.50 && animation_target != "jog") player_set_animation("jog");

                        // Jog fast:
                        if (abs(g_speed) >= 4.50 && abs(g_speed) < 6.00 && animation_target != "jog_fast") player_set_animation("jog_fast");

                        // Run:
                        if (abs(g_speed) >= 6.00 && animation_target != "run" && animation_target != "dash") player_set_animation("run");
                    }
                }
            } else {
                // Fall:
                if (animation_target != "turn" && animation_target != "spin_flight" && animation_target != "spin_fall" && animation_current != "skid" && animation_current != "skid_fast" &&
                    animation_current != "skid_turn" && animation_target != "spring_flight" && animation_target != "spring_fall" && animation_target != "fly_cancel") player_set_animation("spring_fall");
            }
        }
        break;

    // Jump:
    case ACTION_JUMP:
        // Classic jump:
        if (character_data == CHAR_CLASSIC) {
            if (animation_target != "roll") player_set_animation("roll");
        }

        // Tag jump:
        else if (tag_animations == true) {
            if (y_speed <= 0 && animation_target != "spring_flight" && animation_target != "spring_fall") player_set_animation("spring_flight");
            if (y_speed > 0 && animation_target != "spring_fall") player_set_animation("spring_fall");
        }

        // Normal jump:
        else {
            if (tag_action == TAG_LEAP) {
                if (y_speed <= 0 && animation_target != "leap_flight" && animation_target != "leap_fall" && animation_target != "spring_fall") player_set_animation("leap_flight");
                if (y_speed > 0 && animation_target != "leap_fall" && animation_target != "spring_fall") player_set_animation("leap_fall");
            } else {
                if ((animation_target != "roll" && animation_target != "spin_flight" && animation_target != "spin_fall") || animation_current == "drop_dash") player_set_animation("spin_flight");
            }
        }
        break;

    // Look:
    case ACTION_LOOK:
        if (animation_target != "look") player_set_animation("look");
        break;

    // Crouch:
    case ACTION_CROUCH:
        if (animation_target != "crouch") player_set_animation("crouch");
        break;

    // Spin Dash:
    case ACTION_SPIN_DASH:
        // Classic Spin Dash:
        if (character_data == CHAR_CLASSIC) {
            if (animation_target != "spin_dash") player_set_animation("spin_dash");
        } else {
            if (animation_target != "spin_charge" && animation_target != "spin_dash") player_set_animation("spin_dash");
        }
        break;

    // Roll:
    case ACTION_ROLL:
        if (animation_target != "roll") player_set_animation("roll");
        break;

    // Skid:
    case ACTION_SKID:
        // Classic/tag skid:
        if (character_data == CHAR_CLASSIC || tag_animations == true) {
            if (animation_target != "skid") player_set_animation("skid");
        }

        // Normal skid:
        else {
            if (animation_target != "skid" && animation_target != "skid_fast" && animation_target != "skid_turn") player_set_animation("skid");
        }
        break;

    // Balance:
    case ACTION_BALANCE:
        if (character_data == CHAR_CLASSIC) {
            if (abs(balance_direction) == 2) {
                if (animation_target != "balance_front") player_set_animation("balance_front");
            } else {
                if (animation_target != "balance_back") player_set_animation("balance_back");
            }
        } else {
            if (animation_direction == balance_direction) {
                if (animation_target != "balance_front") player_set_animation("balance_front");
            } else {
                if (animation_target != "balance_back") player_set_animation("balance_back");
            }
        }
        break;

    // Push:
    case ACTION_PUSH:
        if (animation_target != "push") player_set_animation("push");
        break;

    // Spring:
    case ACTION_SPRING:
        // Classic spring:
        if (character_data == CHAR_CLASSIC) {
            if ((y_speed < 0 || spring_alarm > 0) && animation_target != "spring") player_set_animation("spring");
            if (((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "jog") player_set_animation("jog");
        }

        // Tag/normal spring:
        else {
            if ((y_speed < 0 || spring_alarm > 0) && animation_target != "spring_flight") player_set_animation("spring_flight");
            if (((y_speed >= 0 && spring_angle == gravity_angle + ANGLE_UP) || (spring_alarm == 0 && spring_angle != gravity_angle + ANGLE_UP)) && animation_target != "spring_fall") player_set_animation("spring_fall");
        }
        break;

    // Breathe:
    case ACTION_BREATHE:
        if (animation_target != "breathe") player_set_animation("breathe");
        break;

    // Hurt:
    case ACTION_HURT:
        if (animation_target != "hurt") player_set_animation("hurt");
        break;

    // Death:
    case ACTION_DEATH:
        if (character_data == CHAR_CLASSIC && drowned == true) {
            if (animation_target != "drown") player_set_animation("drown");
        } else {
            if (animation_target != "death") player_set_animation("death");
        }
        break;

    // Fly:
    case ACTION_FLY:
        if (flight_timer == flight_duration) {
            if (animation_target != "fly_drop") player_set_animation("fly_drop");
        } else {
            if (animation_target != "fly" && animation_target != "fly_drop" && animation_target != "fly_turn") player_set_animation("fly");
        }
        break;
}

// Wait:
if (!game_paused(ctrl_text) && ground == true && input_lock == false && tag_animations == false && animation_target == "idle") {
    if (animation_alarm > 0) {
        animation_alarm -= 1;

        if (animation_alarm == 0) {
            player_set_animation("wait");
        }
    }
} else {
    if (animation_alarm != 360) animation_alarm = 360;
}

// Missing animations:
if (character_data == CHAR_MILES) {
    if (animation_target == "super_spin") player_set_animation("spin_dash");
}

// Animation variants:
switch (animation_target) {
    case "idle":
    case "walk":
    case "walk_fast":
    case "jog":
        if (tag_animations == true) animation_variant = 1;
        else animation_variant = 0;
        break;

    case "wait":
        if (animation_target != animation_current) {
            if (player_exists(1) != noone) {
                if (player_exists(1) == self.id) animation_variant = 1;
                else animation_variant = 0;
            } else {
                animation_variant = choose(0, 1);
            }
        }
        break;

    default:
        animation_variant = 0;
}

// Animation core:
player_animation_core();

// Position fix:
if ((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_state == ACTION_JUMP && animation_current != "spin_flight")) {
    x += (temp_main_bottom - main_bottom) * x_direction;
    y += (temp_main_bottom - main_bottom) * y_direction;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Direction
// Sets the animation direction based on the current action and/or input:

// Don't bother if the game is paused:
if (game_paused()) exit;

// General:
if ((ground == true && action_state == ACTION_DEFAULT && hint_wanted == false && animation_current != "turn") || action_state == ACTION_ROLL || action_state == ACTION_BREATHE) {
    // Left:
    if ((x_speed <= 0 || g_speed <= 0) && player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;

    // Right:
    if ((x_speed >= 0 || g_speed >= 0) && player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;
}

// Airborne:
if ((ground == false && action_state == ACTION_DEFAULT) || action_state == ACTION_JUMP || action_state == ACTION_FLY) {
    // Left:
    if (player_input[INP_LEFT, CHECK_HELD] == true) animation_direction = -1;

    // Right:
    if (player_input[INP_RIGHT, CHECK_HELD] == true) animation_direction = 1;
}

// Collision direction:
if (animation_direction < 0) {
    // Main:
    rela_main_left  = main_right;
    rela_main_right = main_left;
    
    // Hurtbox:
    rela_hurtbox_left  = hurtbox_right;
    rela_hurtbox_right = hurtbox_left;
    
    // Hitbox:
    rela_hitbox_left  = hitbox_right;
    rela_hitbox_right = hitbox_left;
} else {
    // Main:
    rela_main_left  = main_left;
    rela_main_right = main_right;
    
    // Hurtbox:
    rela_hurtbox_left  = hurtbox_left;
    rela_hurtbox_right = hurtbox_right;
    
    // Hitbox:
    rela_hitbox_left  = hitbox_left;
    rela_hitbox_right = hitbox_right;
}

// Wall direction:
wall_left  = rela_main_left + 3;
wall_right = rela_main_right + 3;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Angle
// Sets the animation angle based on the current animation.

// Don't bother if in the middle of respawning/dying or the game is paused:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH || game_paused()) exit;

var angle_mod;

// Animation Angle:
switch (animation_current) {
    // Reset angle:
    case "idle":
    case "turn":
    case "wait":
    case "balance_front":
    case "balance_back":
    case "ready":
    case "land":
    case "look":
    case "crouch":
    case "spin_dash":
    case "spin_charge":
    case "roll":
    case "skid":
    case "skid_fast":
    case "skid_turn":
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
        if (character_data != CHAR_CLASSIC && action_state == ACTION_SPRING && spring_alarm > 0) animation_angle = spring_angle - 90;
        else animation_angle = approach_angle(animation_angle, 0, 4);
        break;
    
    // Terrain angle:
    default:
        // Default angle behavior:
        if (character_data != CHAR_CLASSIC && tag_animations == false) {
            if (ground == true) animation_angle = ground_angle;
            else animation_angle = approach_angle(animation_angle, 0, 4);
        }
        
        // Classic/Tag angle behavior:
        else {
            if (ground == true) {
                var angle_mod;
                
                angle_mod = animation_angle_mod;
                
                if (ground_angle <= 180) {
                    if (ground_angle < 36) angle_mod = 0;
                    else angle_mod = ground_angle;
                } else {
                    if (ground_angle > 324) angle_mod = 0;
                    else angle_mod = ground_angle;
                }
                
                if (abs(angle_difference(animation_angle_mod, angle_mod)) < 45) {
                    animation_angle_mod = approach_angle(animation_angle_mod, angle_mod, max(abs(x_speed), 4));
                } else {
                    animation_angle_mod = angle_mod;
                }
            } else {
                animation_angle_mod = approach_angle(animation_angle_mod, 0, 4);
            }
            
            // Rotate:
            animation_angle = round(animation_angle_mod / 45) * 45;
        }
}

// Miles Tails:
if (character_data == CHAR_MILES) {
    if (ground == true) miles_tails_angle = wrap_angle(ground_angle + (180 * (animation_direction == -1)));
    else {
        miles_tails_angle = point_direction(0, 0, x_speed, y_speed);
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Depth
// Sets the animation depth depending on if the player is a cpu or is being carried.

// Don't bother if the game is paused:
if (game_paused()) exit;

// Change animation depth based on control type:
if (input_cpu == false) animation_depth = -1;
else animation_depth = 0;

// Apply animation depth when not respawning or being carried:
if (depth != animation_depth && action_state != ACTION_RESPAWN && action_state != ACTION_CARRY) depth = animation_depth;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=605
invert=0
arg0=Old and Dusted
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Afterimage
/*
if (afterimage_draw == true) {
    if (afterimage_alarm > 0) afterimage_alarm -= 1;
    else {
        if (instance_number(eff_afterimage) < 3) {
            afterimage_alarm = 6;

            with (instance_create(floor(x), floor(y), eff_afterimage)) {
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

if (global.misc_trails == false) exit;

if (global.misc_trails == true) {
    switch (character_data) {
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
update_trail(floor(x) + (dcos(angle + 90) * (-2 - (1 * angle == 90)) * (1 * action_state == ACTION_ROLL)) + dcos(ground_angle) * x_speed,
    floor(y) - (dsin(ground_angle + 90) * (-3 - (1 * angle != 0)) * (1 * action_state == ACTION_ROLL)) + y_speed - dsin(ground_angle) * x_speed,
    action_state == ACTION_ROLL);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Player

// Knuckles test:
if (tag_animations == true) draw_sprite(spr_knuckles_roll, 1, floor(x) + 11 * animation_direction, floor(y) + 1);

// Trail:
if (global.misc_trails == true) {
    draw_set_blend_mode(bm_add);
    draw_set_color(trail_color);
    draw_trail(spr_trail, 20, true);
    draw_set_blend_mode(bm_normal);
}

// Change alpha when hurt:
if (invincibility_type == 1 && invincibility_alarm > 0) animation_alpha = (invincibility_alarm div 4) mod 2;
else animation_alpha = 1;

// Player:
if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, floor(x) + (animation_direction < 0), floor(y), animation_direction * animation_x_scale, animation_y_scale, animation_angle, animation_blend, animation_alpha);
}

/*
// Miles' tails:
if (character_data == CHAR_MILES) {
    miles_tails_x = x - 5 * dcos(miles_tails_angle) - abs(dcos(miles_tails_angle) * (ground == true && animation_direction == -1)) - (abs(dsin(miles_tails_angle)) * animation_direction);
    miles_tails_y = y + 4 * dsin(miles_tails_angle) - abs(dcos(miles_tails_angle) * (ground == true && animation_direction == -1));
    
    if (animation_current == "roll" || (animation_current == "spin_flight" && animation_current_frame >= animation_loop_frame)) draw_sprite_ext(spr_miles_tails, floor(miles_tails_frame), floor(miles_tails_x), floor(miles_tails_y), animation_direction * animation_x_scale, animation_y_scale, wrap(miles_tails_angle - 90), animation_blend, animation_alpha);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Size

// Exit if not in debug mode:
if (debug_mode == false) exit;

// Main size:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - rela_main_left;
        y1 = floor(y) - main_top;
        x2 = floor(x) + rela_main_right;
        y2 = floor(y) + main_bottom;
        break;

    case 1:
        x1 = floor(x) - main_top;
        y1 = floor(y) - rela_main_right;
        x2 = floor(x) + main_bottom;
        y2 = floor(y) + rela_main_left;
        break;

    case 2:
        x1 = floor(x) - rela_main_right;
        y1 = floor(y) - main_bottom;
        x2 = floor(x) + rela_main_left;
        y2 = floor(y) + main_top;
        break;

    case 3:
        x1 = floor(x) - main_bottom;
        y1 = floor(y) - rela_main_left;
        x2 = floor(x) + main_top;
        y2 = floor(y) + rela_main_right;
        break;
}

draw_set_color(c_orange);

draw_rectangle(x1, y1, x2, y2, true);

// Hurtbox:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - rela_hurtbox_left + (hurtbox_offset_x * animation_direction);
        y1 = floor(y) - hurtbox_top + hurtbox_offset_y;
        x2 = floor(x) + rela_hurtbox_right + (hurtbox_offset_x * animation_direction);
        y2 = floor(y) + hurtbox_bottom + hurtbox_offset_y;
        break;

    case 1:
        x1 = floor(x) - hurtbox_top + hurtbox_offset_y;
        y1 = floor(y) - rela_hurtbox_right + (hurtbox_offset_x * animation_direction);
        x2 = floor(x) + hurtbox_bottom + hurtbox_offset_y;
        y2 = floor(y) + rela_hurtbox_left + (hurtbox_offset_x * animation_direction);
        break;

    case 2:
        x1 = floor(x) - rela_hurtbox_right + (hurtbox_offset_x * animation_direction);
        y1 = floor(y) - hurtbox_bottom + hurtbox_offset_y;
        x2 = floor(x) + rela_hurtbox_left + (hurtbox_offset_x * animation_direction);
        y2 = floor(y) + hurtbox_top + hurtbox_offset_y;
        break;

    case 3:
        x1 = floor(x) - hurtbox_bottom + hurtbox_offset_y;
        y1 = floor(y) - rela_hurtbox_left + (hurtbox_offset_x * animation_direction);
        x2 = floor(x) + hurtbox_top + hurtbox_offset_y;
        y2 = floor(y) + rela_hurtbox_right + (hurtbox_offset_x * animation_direction);
        break;
}

if ((hurtbox_left != 0 || hurtbox_right != 0) && (hurtbox_top != 0 || hurtbox_bottom != 0)) {
    draw_set_color(c_red);

    draw_rectangle(x1, y1, x2, y2, true);
}

// Hitbox:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - rela_hitbox_left + (hurtbox_offset_x * animation_direction);
        y1 = floor(y) - hitbox_top + hitbox_offset_y;
        x2 = floor(x) + rela_hitbox_right + (hurtbox_offset_x * animation_direction);
        y2 = floor(y) + hitbox_bottom + hitbox_offset_y;
        break;

    case 1:
        x1 = floor(x) - hitbox_top + hitbox_offset_y;
        y1 = floor(y) - rela_hitbox_right + (hurtbox_offset_x * animation_direction);
        x2 = floor(x) + hitbox_bottom + hitbox_offset_y;
        y2 = floor(y) + rela_hitbox_left + (hurtbox_offset_x * animation_direction);
        break;

    case 2:
        x1 = floor(x) - rela_hitbox_right + (hurtbox_offset_x * animation_direction);
        y1 = floor(y) - hitbox_bottom + hitbox_offset_y;
        x2 = floor(x) + rela_hitbox_left + (hurtbox_offset_x * animation_direction);
        y2 = floor(y) + hitbox_top + hitbox_offset_y;
        break;

    case 3:
        x1 = floor(x) - hitbox_bottom + hitbox_offset_y;
        y1 = floor(y) - rela_hitbox_left + (hurtbox_offset_x * animation_direction);
        x2 = floor(x) + hitbox_top + hitbox_offset_y;
        y2 = floor(y) + rela_hitbox_right + (hurtbox_offset_x * animation_direction);
        break;
}

if ((hitbox_left != 0 || hitbox_right != 0) && (hitbox_top != 0 || hitbox_bottom != 0)) {
    draw_set_color(c_lime);

    draw_rectangle(x1, y1, x2, y2, true);
}
