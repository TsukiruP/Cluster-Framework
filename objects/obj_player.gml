#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Initialization

// Image speed:
image_speed = 0;

// Timeline initialization:
ctl_initialize();

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
main_left      = 6;
main_right     = 6;
main_top       = 14;
main_bottom    = 14;

main_left_rel  = 0;
main_right_rel = 0;

wall_left      = main_left + 3;
wall_right     = main_right + 3;
wall_top       = 0;
wall_bottom    = 0;

// Hurtbox variables:
hurtbox_left      = 0;
hurtbox_right     = 0;
hurtbox_top       = 0;
hurtbox_bottom    = 0;

hurtbox_offset_x  = 0;
hurtbox_offset_y  = 0;

hurtbox_left_rel  = 0;
hurtbox_right_rel = 0;

// Hitbox variables:
hitbox_left      = 0;
hitbox_right     = 0;
hitbox_top       = 0;
hitbox_bottom    = 0;

hitbox_offset_x  = 0;
hitbox_offset_y  = 0;

hitbox_left_rel  = 0;
hitbox_right_rel = 0;

// Action variables:
action_current  = player_action_idle;
action_previous = action_current;
action_changed  = false;

// Physics variables:
top_speed        = 6;
max_speed        = 16;

g_speed          = 0;

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

// Default variables:
balance_direction = 0;
push_animation    = false;
hint_wanted       = false;

// Jump variables:
jump_force    =  6.5;
jump_complete =  false;
jump_release  = -4;

// Roll variables:
roll_deceleration  = 0.125;
roll_friction      = 0.0234375;
roll_friction_up   = 0.078125;
roll_friction_down = 0.3125;
roll_rebounce      = false;
roll_forced        = false;
roll_offset        = 0;

// Misc. variables:
wall_stop        =  true;
death_alarm      = -5;
depth_default    =  0;
tunnel_lock      =  false;
score_multiplier =  0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character Initialization

// Character data:
character_data = CHAR_SONIC;

// Classic variables:
clock_up_alarm    = 0;
clock_up_state    = 0;
clock_up_timer    = 0;
clock_up_duration = 900;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Initialization

// Shield variables:
status_shield        = SHIELD_NONE;
status_shield_usable = true;
status_shield_state  = 0;

// Invincibility variables:
status_hurt        = 0;
status_invin       = 0;
status_invin_alarm = 0;

// Speed shoes variables:
status_speed       = 0;
status_speed_alarm = 0;

// Panic variables:
status_panic       = false;
status_panic_alarm = 0;

// Swap variables:
status_swap       = false;
status_swap_alarm = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effect Initialization

// Spin dash charge:
spin_dash_charge = 0;

// Skid dust alarm:
skid_dust_alarm = 3;

// Shield variables:
shield_insta  = noone;
shield_handle = noone;

// After image variables:
afterimage_draw  = false;
afterimage_alarm = 0;

// Create trail:
if (global.misc_trails == true) start_trail(15);
trail_color = c_white;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle Initialization

// Spring variables:
spring_strength = 0;
spring_angle    = 0;
spring_alarm    = 0;
spring_current  = noone;

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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Input Initialization

input_x_direction = 0;
input_y_direction = 0;

input_lock        = false;
input_lock_alarm  = 0;
input_cpu         = false;
input_cpu_alarm   = 0;

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
animation_alarm     =  360;

animation_angle     =  0;
animation_angle_mod =  0;
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

// Don't bother if the game is paused:
if (game_paused()) exit;

// Receive inputs:
player_get_input();

// Input direction:
input_x_direction = input_player[INP_RIGHT, CHECK_HELD] - input_player[INP_LEFT, CHECK_HELD];
input_y_direction = input_player[INP_DOWN, CHECK_HELD] - input_player[INP_UP, CHECK_HELD];

// Input lock:
if (ground == true && input_lock_alarm > 0) input_lock_alarm -= 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Actions

// Don't bother if the game is currently paused:
if (game_paused()) exit; 

if (script_exists(action_current)) {
    script_execute(action_current, ACTION_STEP);

    if (action_changed != false) {
        action_changed = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle List

// Don't bother if the game is paused:
if (game_paused()) exit;

player_handle_item_box();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Shield

if (status_shield != 0 && shield_handle == noone) {
    shield_handle = instance_create(x, y, eff_shield);

    with (shield_handle) {
        player_handle = other.id;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Splashes

if (instance_exists(obj_water_surface)) {
    if (water_surface == true) {
        // Create step/run splash:
        if (ground == true && abs(g_speed) > 0) {
            if (water_splash_alarm > 0) {
                water_splash_alarm -= 1;

                if (water_splash_alarm == 0) {
                    if (abs(g_speed) >= 4.50) {
                        effect_create(ctl_splash_run, floor(x), obj_water_surface.y, depth, image_xscale);
                        water_splash_alarm = 7;
                    } else {
                        effect_create(ctl_splash_step, floor(x), obj_water_surface.y, depth, image_xscale);
                        water_splash_alarm = 14;
                    }
                }
            }
        }

        // Create jump splash:
        if (ground == false && sign(y_speed) == -1) {
            effect_create(ctl_splash_run, floor(x), obj_water_surface.y, depth, image_xscale);
        }
    } else {
        water_splash_alarm = 14;
    }

    // Water surface:
    if (floor(y) + main_bottom + 1 == obj_water_surface.y) {
        water_surface = true;
    } else {
        water_surface = false;
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
if (action_current != player_action_death && physics_type == PHYS_UNDERWATER && !instance_exists(ctrl_tally)) {
    // Refill air if in breathe action or bubble shield:
    if (status_shield == SHIELD_BUBBLE) {
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
/// Alarms

// Don't bother if the game is paused:
if (game_paused()) exit;

if (status_speed == 1) afterimage_draw = true;
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
if (action_current != player_action_death && !instance_exists(ctrl_tally)) {
    if (physics_type == PHYS_UNDERWATER) {
        // Refill air if in breathe action or bubble shield:
        if (status_shield != SHIELD_BUBBLE) {
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
                            // Set physics:
                            g_speed = 0;

                            // Set flag:
                            drowned = true;

                            // Set action:
                            player_set_action(player_action_death);
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
var main_bottom_temp;

main_bottom_temp = main_bottom;

switch (action_current) {
    // Idle:
    case player_action_idle:
        if (animation_target != "stand" && animation_target != "balance" && animation_target != "wait" && animation_target != "look" && animation_target != "crouch") {
            player_set_animation("stand");
        }
        break;
    
    // Turn:
    case player_action_turn:
        if (animation_target != "turn" && animation_target != "turn_skid") {
            player_set_animation("turn");
        }
        break;
    
    // Run:
    case player_action_run:
        // Walk:
        if (abs(g_speed) < 1.50) {
            if (animation_target != "walk") player_set_animation("walk");
        }
        
        // Walk fast:
        else if (abs(g_speed) < 3.00) {
            if (animation_target != "walk_fast") player_set_animation("walk_fast");
        }
        
        // Jog:
        else if (abs(g_speed) < 4.50) {
            if (animation_target != "jog") player_set_animation("jog");
        }
        
        // Jog fast:
        else if (abs(g_speed) < 6.00) {
            if (animation_target != "jog") player_set_animation("jog");
        }
        
        // Run:
        else {
            if (animation_target != "run") player_set_animation("run");
        }
        break;
    
    // Air:
    case player_action_air:
        if (animation_target != "turn" && animation_target != "turn_skid" && animation_target != "spin" && animation_target != "skid" && animation_target != "spring_flight" && animation_target != "spring_fall") {
            player_set_animation("spring_fall");
        }
        break;
    
    // Jump:
    case player_action_jump:
        if (animation_target != "spin") {
            player_set_animation("spin");
        }
        break;
    
    // Look:
    case player_action_look:
        if (animation_target != "look") {
            player_set_animation("look");
        }
        break;
    
    // Crouch:
    case player_action_crouch:
        if (animation_target != "crouch") {
            player_set_animation("crouch");
        }
        break;
    
    // Spin Dash:
    case player_action_spin_dash:
        if (animation_target != "spin_dash" && animation_target != "spin_charge") {
            player_set_animation("spin_dash");
        }
        break;
    
    // Roll:
    case player_action_roll:
        if (animation_target != "spin") {
            player_set_animation("spin");
        }
        break;
    
    // Skid:
    case player_action_skid:
        if (animation_target != "skid" && animation_target != "skid_fast") {
            player_set_animation("skid");
        }
        break;
    
    // Hurt:
    case player_action_hurt:
        if (animation_target != "hurt") {
            player_set_animation("hurt");
        }
        break;
    
    // Death:
    case player_action_death:
        if (animation_target != "death") {
            player_set_animation("death");
        }
        break;
}

// Variants:
switch (animation_target) {
    // Tag:
    case "stand":
    case "turn":
    case "walk":
    case "walk_fast":
    case "jog":
    case "look":
    case "crouch":
    case "skid":
    case "spring_flight":
    case "spring_fall":
        // Tag variants
        break;
    
    // Wait:
    case "wait":
        if (animation_target != animation_current) {
            // Leader & partner wait:
            if (player_exists(1) != noone) {
                if (player_exists(1) == self.id) animation_variant = 1;
                else animation_variant = 0;
            }
            
            // Randomize wait:
            else {
                animation_variant = choose(0, 1);
            }
        }
        break;
    
    case "spin":
        // Spin flight & fall:
        if (action_current == player_action_jump) {
            animation_variant = 1;
        }
        
        // Roll:
        else {
            animation_variant = 0;
        }
        break;
    
    default:
        animation_variant = 0;
}

// Animation core:
player_animation_core();

// Position fix:
if ((ground == true && ceiling_lock_alarm == 0) || (mode == 0 && action_current == player_action_jump && animation_current == "spin" && animation_variant == 2)) {
    x += (main_bottom_temp - main_bottom) * x_direction;
    y += (main_bottom_temp - main_bottom) * y_direction;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Angle
// Sets the animation angle based on the current animation.

// Don't bother if the game is paused:
if (game_paused()) exit;

var angle_mod;

// Animation Angle:
switch (animation_current) {
    // Reset angle:
    case "stand":
    case "turn":
    case "wait":
    case "balance":
    case "ready":
    case "land":
    case "look":
    case "crouch":
    case "spin_dash":
    case "roll":
    case "skid":
    case "skid_turn":
    case "hurt":
    case "death":
    case "push":
    case "breathe":
    case "goal":
        image_angle = 0;
        break;
    
    // Spring angle:
    case "spring":
        if (character_data != CHAR_CLASSIC && spring_angle != ANGLE_DOWN && spring_alarm > 0) image_angle = spring_angle - 90;
        else image_angle = approach_angle(animation_angle, 0, 4);
        break;
    
    // Terrain angle:
    default:
        // Default angle behavior:
        if (character_data != CHAR_CLASSIC) {
            if (ground == true) image_angle = player_get_angle(x, y);
            else image_angle = approach_angle(image_angle, 0, 4);
        }
        
        // Classic/Tag angle behavior:
        else {
            if (ground == true) {
                var angle_mod;
                
                angle_mod = animation_angle_mod;
                
                if (player_get_angle(x, y) <= 180) {
                    if (player_get_angle(x, y) < 36) angle_mod = 0;
                    else angle_mod = player_get_angle(x, y);
                } else {
                    if (player_get_angle(x, y) > 324) angle_mod = 0;
                    else angle_mod = player_get_angle(x, y);
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
            image_angle = round(animation_angle_mod / 45) * 45;
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
update_trail(floor(x) + (dcos(ground_angle + 90) * (-2 - (1 * ground_angle == 90)) * (1 * action_current == player_action_roll)) + dcos(ground_angle) * x_speed,
    floor(y) - (dsin(ground_angle + 90) * (-3 - (1 * ground_angle != 0)) * (1 * action_current == player_action_roll)) + y_speed - dsin(ground_angle) * x_speed,
    action_current == player_action_roll);
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
/// OLD targets

/*
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
            // Spring flight:
            if ((y_speed < 0 && spring_angle == ANGLE_UP) || (spring_angle != ANGLE_DOWN && spring_alarm > 0)) {
                if (animation_target != "spring_flight") player_set_animation("spring_flight");
            }

            // Spring fall:
            else {
                if (animation_target != "spring_fall") player_set_animation("spring_fall");
            }
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
*/
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Player

// Trail:
if (global.misc_trails == true) {
    draw_set_blend_mode(bm_add);
    draw_set_color(trail_color);
    draw_trail(spr_trail, 20, true);
    draw_set_blend_mode(bm_normal);
}

// Change alpha when hurt:
if (status_invin == INVIN_HURT && status_invin_alarm > 0) image_alpha = (status_invin_alarm div 4) mod 2;
else image_alpha = 1;

// Player:
if (sprite_exists(sprite_index)) {
    draw_sprite_ext(sprite_index, image_index, floor(x) + (image_xscale < 0), floor(y), image_xscale, image_yscale, image_angle, c_white, image_alpha);
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
        x1 = floor(x) - main_left_rel;
        y1 = floor(y) - main_top;
        x2 = floor(x) + main_right_rel;
        y2 = floor(y) + main_bottom;
        break;

    case 1:
        x1 = floor(x) - main_top;
        y1 = floor(y) - main_right_rel;
        x2 = floor(x) + main_bottom;
        y2 = floor(y) + main_left_rel;
        break;

    case 2:
        x1 = floor(x) - main_right_rel;
        y1 = floor(y) - main_bottom;
        x2 = floor(x) + main_left_rel;
        y2 = floor(y) + main_top;
        break;

    case 3:
        x1 = floor(x) - main_bottom;
        y1 = floor(y) - main_left_rel;
        x2 = floor(x) + main_top;
        y2 = floor(y) + main_right_rel;
        break;
}

draw_set_color(c_orange);

draw_rectangle(x1, y1, x2, y2, true);

// Hurtbox:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - hurtbox_left_rel + (hurtbox_offset_x * image_xscale);
        y1 = floor(y) - hurtbox_top + hurtbox_offset_y;
        x2 = floor(x) + hurtbox_right_rel + (hurtbox_offset_x * image_xscale);
        y2 = floor(y) + hurtbox_bottom + hurtbox_offset_y;
        break;

    case 1:
        x1 = floor(x) - hurtbox_top + hurtbox_offset_y;
        y1 = floor(y) - hurtbox_right_rel + (hurtbox_offset_x * image_xscale);
        x2 = floor(x) + hurtbox_bottom + hurtbox_offset_y;
        y2 = floor(y) + hurtbox_left_rel + (hurtbox_offset_x * image_xscale);
        break;

    case 2:
        x1 = floor(x) - hurtbox_right_rel + (hurtbox_offset_x * image_xscale);
        y1 = floor(y) - hurtbox_bottom + hurtbox_offset_y;
        x2 = floor(x) + hurtbox_left_rel + (hurtbox_offset_x * image_xscale);
        y2 = floor(y) + hurtbox_top + hurtbox_offset_y;
        break;

    case 3:
        x1 = floor(x) - hurtbox_bottom + hurtbox_offset_y;
        y1 = floor(y) - hurtbox_left_rel + (hurtbox_offset_x * image_xscale);
        x2 = floor(x) + hurtbox_top + hurtbox_offset_y;
        y2 = floor(y) + hurtbox_right_rel + (hurtbox_offset_x * image_xscale);
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
        x1 = floor(x) - hitbox_left_rel + (hurtbox_offset_x * image_xscale);
        y1 = floor(y) - hitbox_top + hitbox_offset_y;
        x2 = floor(x) + hitbox_right_rel + (hurtbox_offset_x * image_xscale);
        y2 = floor(y) + hitbox_bottom + hitbox_offset_y;
        break;

    case 1:
        x1 = floor(x) - hitbox_top + hitbox_offset_y;
        y1 = floor(y) - hitbox_right_rel + (hurtbox_offset_x * image_xscale);
        x2 = floor(x) + hitbox_bottom + hitbox_offset_y;
        y2 = floor(y) + hitbox_left_rel + (hurtbox_offset_x * image_xscale);
        break;

    case 2:
        x1 = floor(x) - hitbox_right_rel + (hurtbox_offset_x * image_xscale);
        y1 = floor(y) - hitbox_bottom + hitbox_offset_y;
        x2 = floor(x) + hitbox_left_rel + (hurtbox_offset_x * image_xscale);
        y2 = floor(y) + hitbox_top + hitbox_offset_y;
        break;

    case 3:
        x1 = floor(x) - hitbox_bottom + hitbox_offset_y;
        y1 = floor(y) - hitbox_left_rel + (hurtbox_offset_x * image_xscale);
        x2 = floor(x) + hitbox_top + hitbox_offset_y;
        y2 = floor(y) + hitbox_right_rel + (hurtbox_offset_x * image_xscale);
        break;
}

if ((hitbox_left != 0 || hitbox_right != 0) && (hitbox_top != 0 || hitbox_bottom != 0)) {
    draw_set_color(c_lime);

    draw_rectangle(x1, y1, x2, y2, true);
}
