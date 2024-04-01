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

on_edge    = false;
on_obstacle = false;

detach_allow   = true;

ceiling_allow      = true;
ceiling_landing    = 0;
ceiling_lock_alarm = 0;
touching_ceiling   = false;

// Size variables:
main_width       = 6;
main_height      = 14;
main_height_temp = 0;
wall_width       = main_width + 3;
wall_height      = 0;

hurtbox_width    = 0;
hurtbox_height   = 0;
hurtbox_offset_x = 0;
hurtbox_offset_y = 0;

hitbox_width     = 0;
hitbox_height    = 0;
hitbox_offset_x  = 0;
hitbox_offset_y  = 0;

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

// Input variables:
input_direction  = 0;
input_lock       = false;
input_lock_alarm = 0;
input_cpu        = false;
input_cpu_alarm  = 0;

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
animation_target    =  "";
animation_current   =  "";
animation_previous  =  animation_current;
animation_variant   =  0;
animation_moment    =  0;
animation_finished  =  false;
animation_trigger   =  false;
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
    global.stage_time = global.checkpoint_time;
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Death
// One is always aware that it lies in wait. Though life is merely a journey to the grave, it must not be undertaken without hope.

// Don't bother if the death alarm has been updated:
if (death_alarm == -1) exit;

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
    
    // Reset death alarm:
    if (death_alarm == 0) {
        // Respawn partner:
        if (input_cpu == true) action_state = ACTION_RESPAWN;
        
        // Set death alarm:
        death_alarm = -1;
    }
    
    // Decrease death alarm:
    else if (death_alarm > 0) {
        death_alarm -= 1;
    }
    
    // Retry transition:
    if (input_cpu == false && death_alarm == 64 && !instance_exists(ctrl_transition)) room_transition(room, TRANS_RETRY);
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

// Don't bother if in the middle of respawning/dying:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

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

// Don't bother if in the middle of respawning/dying:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

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
if ((action_state == ACTION_DEFAULT && animation_current != "turn" && animation_current != "look" && animation_current != "crouch") || action_state == ACTION_JUMP ||
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

                     // Play animation:
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
/// Utility Scripts

// Actions:
player_action_list();

// Animation target:
player_animation_target();

// Animation direction:
player_animation_direction();

// Animation angle:
player_animation_angle();

// Animation depth:
player_animation_depth();

// Position fix:
player_position_fix();

// Object handle:
player_handle_list();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Effects

// Don't bother if in the middle of respawning/dying:
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

// Invincibility:
if (invincibility_alarm > -1) {
    invincibility_alarm -= 1;
    
    if (invincibility_alarm == 0) {
        invincibility_type  =  0;
        invincibility_alarm = -1;
    }
}

// Hurt invincibility:
if (invincibility_type == 1 && invincibility_alarm == -1) {
    if (ground == true || action_state != ACTION_HURT) invincibility_alarm = 120;
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
/// Underwater

// Don't bother if in the middle of respawning/dying:
if (action_state != ACTION_RESPAWN && action_state != ACTION_DEATH && !instance_exists(ctrl_tally)) {
    if (physics_type == PHYS_UNDERWATER) {
        // Refill air if in breathe action or bubble shield:
        if (action_state == ACTION_BREATHE || shield_data == SHIELD_BUBBLE) {
            air_remaining = 30;
            air_alarm     = 60;
            
            // Stop jingle:
            if (input_cpu == false) sound_stop("bgm_drown");
        }
        
        // Decrease air variables:
        else {
            // Decrease air alarm:
            if (air_alarm != 0) air_alarm -= 1;
            else {
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
if (action_state == ACTION_RESPAWN || action_state == ACTION_DEATH) exit;

player_get_input();

// Input lock:
if (ground == true && input_lock_alarm > 0) input_lock_alarm -= 1;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Update Physics

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
#define Step_2
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

// Character:
draw_sprite_ext(sprite_index, image_index, floor(x) + (animation_direction < 0), floor(y), animation_direction * animation_x_scale, animation_y_scale, animation_angle, animation_blend, animation_alpha);

/*
// Miles' tails:
if (character_data == CHAR_MILES) {
    miles_tails_x = x - 5 * dcos(miles_tails_angle) - abs(dcos(miles_tails_angle) * (ground == true && animation_direction == -1)) - (abs(dsin(miles_tails_angle)) * animation_direction);
    miles_tails_y = y + 4 * dsin(miles_tails_angle) - abs(dcos(miles_tails_angle) * (ground == true && animation_direction == -1));
    
    if (animation_current == "roll" || (animation_current == "spin_flight" && animation_current_frame >= animation_loop_frame)) draw_sprite_ext(spr_miles_tails, floor(miles_tails_frame), floor(miles_tails_x), floor(miles_tails_y), animation_direction * animation_x_scale, animation_y_scale, wrap_angle(miles_tails_angle - 90), animation_blend, animation_alpha);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Size

// Exit if not in debug mode:
if (debug_mode == false) exit;

// Draw main size:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - main_width;
        y1 = floor(y) - main_height;
        x2 = floor(x) + main_width;
        y2 = floor(y) + main_height;
        break;

    case 1:
        x1 = floor(x) - main_height;
        y1 = floor(y) - main_width;
        x2 = floor(x) + main_height;
        y2 = floor(y) + main_width;
        break;

    case 2:
        x1 = floor(x) - main_width;
        y1 = floor(y) - main_height;
        x2 = floor(x) + main_width;
        y2 = floor(y) + main_height;
        break;

    case 3:
        x1 = floor(x) - main_height;
        y1 = floor(y) - main_width;
        x2 = floor(x) + main_height;
        y2 = floor(y) + main_width;
        break;
}

draw_set_color(c_orange);
draw_rectangle(x1, y1, x2, y2, true);

// Draw hurtbox:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - hurtbox_width + (hurtbox_offset_x * animation_direction);
        y1 = floor(y) - hurtbox_height +  hurtbox_offset_y;
        x2 = floor(x) + hurtbox_width + (hurtbox_offset_x * animation_direction);
        y2 = floor(y) + hurtbox_height +  hurtbox_offset_y;
        break;

    case 1:
        x1 = floor(x) - hurtbox_height +  hurtbox_offset_y;
        y1 = floor(y) - hurtbox_width - (hurtbox_offset_x * animation_direction);
        x2 = floor(x) + hurtbox_height +  hurtbox_offset_y;
        y2 = floor(y) + hurtbox_width - (hurtbox_offset_x * animation_direction);
        break;

    case 2:
        x1 = floor(x) - hurtbox_width - (hurtbox_offset_x * animation_direction);
        y1 = floor(y) - hurtbox_height -  hurtbox_offset_y;
        x2 = floor(x) + hurtbox_width - (hurtbox_offset_x * animation_direction);
        y2 = floor(y) + hurtbox_height -  hurtbox_offset_y;
        break;

    case 3:
        x1 = floor(x) - hurtbox_height -  hurtbox_offset_y;
        y1 = floor(y) - hurtbox_width + (hurtbox_offset_x * animation_direction);
        x2 = floor(x) + hurtbox_height -  hurtbox_offset_y;
        y2 = floor(y) + hurtbox_width + (hurtbox_offset_x * animation_direction);
        break;
}

if (hurtbox_width != 0 && hurtbox_height != 0) {
    draw_set_color(c_red);
    draw_rectangle(x1, y1, x2, y2, true);
}

// Draw hitbox:
var x1, y1, x2, y2;

switch (mode) {
    case 0:
        x1 = floor(x) - hitbox_width + (hitbox_offset_x * animation_direction);
        y1 = floor(y) - hitbox_height +  hitbox_offset_y;
        x2 = floor(x) + hitbox_width + (hitbox_offset_x * animation_direction);
        y2 = floor(y) + hitbox_height +  hitbox_offset_y;
        break;

    case 1:
        x1 = floor(x) - hitbox_height +  hitbox_offset_y;
        y1 = floor(y) - hitbox_width - (hitbox_offset_x * animation_direction);
        x2 = floor(x) + hitbox_height +  hitbox_offset_y;
        y2 = floor(y) + hitbox_width - (hitbox_offset_x * animation_direction);
        break;

    case 2:
        x1 = floor(x) - hitbox_width - (hitbox_offset_x * animation_direction);
        y1 = floor(y) - hitbox_height -  hitbox_offset_y;
        x2 = floor(x) + hitbox_width - (hitbox_offset_x * animation_direction);
        y2 = floor(y) + hitbox_height -  hitbox_offset_y;
        break;

    case 3:
        x1 = floor(x) - hitbox_height -  hitbox_offset_y;
        y1 = floor(y) - hitbox_width + (hitbox_offset_x * animation_direction);
        x2 = floor(x) + hitbox_height -  hitbox_offset_y;
        y2 = floor(y) + hitbox_width + (hitbox_offset_x * animation_direction);
        break;
}

if (hitbox_width != 0 && hitbox_height != 0) {
    draw_set_color(c_lime);
    draw_rectangle(x1, y1, x2, y2, true);
}
