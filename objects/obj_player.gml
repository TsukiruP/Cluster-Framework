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

// Player slot:
player_slot = 0;

// Physics variables:
physics_type       = PHYS_DEFAULT;

top_speed          = 6;
max_speed          = 16;

x_allow            = true;
x_speed            = 0;
acceleration       = 0.046875;
deceleration       = 0.5;
slope_friction     = 0.125;
air_friction       = 0.96875;

y_allow            = true;
y_speed            = 0;
gravity_force      = 0.21875;
gravity_force_temp = 0.21875;

// State variables:
state_current  = player_state_idle;
state_target   = state_current;
state_previous = state_current;
state_changed  = false;
state_start    = true;

// Idle variables:
hint_wanted = false;

// Jump variables:
jump_aux     =  false;
jump_force   =  6.5;
jump_release = -4;

bound_state  =  0;

// Roll variables:
roll_deceleration  = 0.125;
roll_friction      = 0.0234375;
roll_friction_up   = 0.078125;
roll_friction_down = 0.3125;
roll_rebounce      = false;

// Death variables:
death_alarm  = -5;
death_handle =  noone;

// Misc. variables:
depth_default    = 0;
score_multiplier = 0;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Collision Initialization

solid_list      = ds_list_create();
wall_direction  = 0;
collision_layer = 0;
cliff_direction = 0;

// Reset:
player_reset_air();

// Thresholds:
ceiling_land_threshold = -4;
slide_threshold        =  2.5;
air_friction_threshold =  0.125;

// Radii:
player_set_radii(6, 14, 3, 0);
wall_radius = x_radius + wall_offset;

// Hurtbox:
set_hurtbox();

// Hitbox:
set_hitbox();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character Initialization

// Character data:
character_id = CHAR_SONIC;

// Sonic variables:
skid_alarm = 0;

// Classic variables:
clock_up_state    = 0;
clock_up_alarm    = 0;
clock_up_timer    = 0;
clock_up_duration = 900;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Status Initialization

// Shield variables:
status_shield       = SHIELD_NONE;
status_shield_allow = true;

// Invincibility variables:
status_invin       = 0;
status_invin_alarm = 0;
status_insta_alarm = 0;

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

// Effect queue:
effect_queue = -1;

// Spin dash charge:
spin_dash_charge = 0;

// Shield handle:
shield_handle = noone;

// Debuff handle:
debuff_handle = noone;

// After image variables:
afterimage_draw  = false;
afterimage_alarm = 6;

// Trail variables:
trail_draw  = false;
trail_color = c_white;

// Start trail:
if (global.misc_trails == true) {
    start_trail(15);
}
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
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Water Initialization

// Surface variables:
on_surface    = false;
surface_timer = 0;

// Underwater variables:
underwater    = false;
air_remaining = 30;
air_alarm     = 60;

// Drown variables:
drown_index = 0;
drown       = false;
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

player_set_input(-1);
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
animation_reload    =  false;
animation_skip      =  false;
animation_timer     =  0;
animation_alarm     =  360;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
///  Inputs

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

// Receive inputs:
if (input_lock == false) {
    // Reset CPU alarm:
    if (input_cpu == true) {
        if (input_get_check(INP_ANY, CHECK_HELD, DEV_JOYSTICK0 + player_slot)) {
            input_cpu_alarm = 600;
        }
    }

    // Direct inputs:
    if (input_cpu == false || (input_cpu == true && input_cpu_alarm > 0)) {
        player_set_input(player_slot);
    } else {

    }

    /*
    // Player 1:
    if (input_cpu == false) {
        player_set_input(player_id)
    }

    // Player 2:
    else if (input_cpu == true) {
        // Set partner alarm:
        if (input_check(INP_ANY, CHECK_HELD, DEV_JOYSTICK1)) input_cpu_alarm = 600;

        if (input_cpu_alarm == 0) {
            if (player_exists(0) != noone) {
                var player_handle;

                player_handle = player_exists(0);

                // Move right:
                if ((x < player_handle.x - 16 || (player_handle.y < y - 50 && player_handle.ground == true && player_handle.x_speed > 0)) &&
                    (player_handle.y >= y - 50 || player_handle.ground == false || player_handle.x_speed >= 0)) {
                    input_player[INP_RIGHT, CHECK_HELD] = true;
                } else {
                    input_player[INP_RIGHT, CHECK_HELD] = false;
                }

                // Move left:
                if ((x > player_handle.x + 16 || (player_handle.y < y - 50 && player_handle.ground == true && player_handle.x_speed < 0)) &&
                    (player_handle.y >= y - 50 || player_handle.ground == false || player_handle.x_speed <= 0)) {
                    input_player[INP_LEFT, CHECK_HELD] = true;
                } else {
                    input_player[INP_LEFT, CHECK_HELD] = false;
                }

                // Up & down:
                var queue_up, queue_down;

                queue_up   = ds_queue_dequeue(ctrl_input.partner_input_up);
                queue_down = ds_queue_dequeue(ctrl_input.partner_input_down);

                ds_queue_enqueue(ctrl_input.partner_input_up, player_handle.input_player[INP_UP, CHECK_HELD]);
                ds_queue_enqueue(ctrl_input.partner_input_down, player_handle.input_player[INP_DOWN, CHECK_HELD]);

                input_player[INP_UP, CHECK_HELD] = queue_up;
                input_player[INP_DOWN, CHECK_HELD] = queue_down;

                // Jump:
                if (ground == true && state_current != player_state_look && state_current != player_state_crouch && player_handle.y < y - 50 && player_handle.ground == false) {
                    input_player[INP_JUMP, CHECK_PRESSED] = true;
                } else {
                    input_player[INP_JUMP, CHECK_PRESSED] = false;
                }

                if (state_current == player_state_jump) {
                    input_player[INP_JUMP, CHECK_HELD] = true;
                } else {
                    input_player[INP_JUMP, CHECK_HELD] = false;
                }
            }
        } else {
            // Decrease partner alarm:
            if (input_cpu_alarm > 0) input_cpu_alarm -= 1;

            // Register inputs:
            for (i = INP_LEFT; i <= INP_ALT; i += 1) {
                for (j = CHECK_PRESSED; j <= CHECK_HELD; j += 1) {
                    input_player[i, j] = input_check(i, j, DEV_JOYSTICK1);
                }
            }
        }
    }
    */
}

// Input direction:
input_x_direction = input_player[INP_RIGHT, CHECK_HELD] - input_player[INP_LEFT, CHECK_HELD];
input_y_direction = input_player[INP_DOWN, CHECK_HELD] - input_player[INP_UP, CHECK_HELD];

// Input lock:
if (on_ground == true && input_lock_alarm > 0) {
    input_lock_alarm -= 1;
}

// Panic:
if (status_panic == true && input_lock_alarm == 0) {
    input_x_direction *= -1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// State

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

// Set current state:
if (state_current != state_target) {
    state_current = state_target;
}

// Effect queue:
player_effect_queue();

// Execute state step:
if (script_exists(state_current)) {
    script_execute(state_current, STATE_STEP);

    if (state_changed != false) {
        state_changed = false;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Traits

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

player_trait_debug();
classic_trait_clock_up();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Handle List

// Exit if the stage is paused, text is active or dying:
if (game_ispaused() || state_current == player_state_death) {
    exit;
}

/*
player_handle_layer();
player_handle_ring();
player_handle_checkpoint();
player_handle_spring();
player_handle_item_box();
player_handle_badnik();
player_handle_hint();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Debuffs

// Immunity:
if (status_invin >= INVIN_BUFF) {
    // Clear speed down:
    if (status_speed == SPEED_SLOW) {
        status_speed       = SPEED_NONE;
        status_speed_alarm = 0;
    }

    // Clear panic:
    if (status_panic == true) {
        status_panic       = false;
        status_panic_alarm = 0;
    }

    // Clear swap:
    if (status_swap == true) {
        status_swap       = false;
        status_swap_alarm = 0;
    }
}


// Slow:
if (status_speed == SPEED_SLOW) {
    // Cap speed:
    if (spring_strength == 0) {
        if (abs(x_speed) > top_speed) {
            x_speed = top_speed * sign(x_speed);
        }
    }

    // Stop jingle:
    if (sound_isplaying("bgm_speed")) {
        sound_stop("bgm_speed");
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Effects

// Create shield:
if ((status_shield != SHIELD_NONE || status_invin != INVIN_NONE) && shield_handle == noone) {
    shield_handle = instance_create(x, y, eff_shield);

    with (shield_handle) {
        player_handle = other.id;
    }
}

// Create debuff:
if ((status_speed == SPEED_SLOW || status_panic == true) && debuff_handle == noone) {
    debuff_handle = instance_create(x, y, eff_debuff);

    with (debuff_handle) {
        player_handle = other.id;
    }
}

// Set afterimage:
if (status_speed == SPEED_UP) {
    afterimage_draw = true;
} else {
    afterimage_draw  = false;
    afterimage_alarm = 6;
}

// Set trail:
if (state_current == player_state_roll) {
    trail_draw = true;
} else {
    trail_draw = false;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Splashes

// Exit if there's no water surface:
if (!instance_exists(obj_water_surface)) {
    exit;
}

// Entry splash:
if (y > obj_water_surface.y && yprevious < obj_water_surface.y) {
    x_speed *= 0.50;
    y_speed *= 0.25;

    // Create splash:
    if (y_speed >= 2.50) {
        effect_create(ctl_splash_1, x, obj_water_surface.y, -10);
    } else {
        effect_create(ctl_splash_0, x, obj_water_surface.y, -10);
    }

    // Play sound:
    sound_play_single("snd_splash");
}

// Exit splash:
else if (y < obj_water_surface.y && yprevious > obj_water_surface.y) {
    y_speed = max(y_speed * 2, -16);

    // Create splash:
    if (abs(y_speed) >= 6) {
        effect_create(ctl_splash_1, x, obj_water_surface.y, -10);
    } else {
        effect_create(ctl_splash_0, x, obj_water_surface.y, -10);
    }

    // Play sound:
    sound_play_single("snd_splash");
}


// Surface timer:
if (on_surface == true && abs(x_speed) > 0) {
    surface_timer += 1;

    // Splash:
    if (surface_timer mod 9 == 0) {
        if (abs(x_speed) >= 4.50) {
            effect_create(ctl_splash_3, x, obj_water_surface.y, depth, image_xscale);
        } else {
            effect_create(ctl_splash_2, x, obj_water_surface.y, depth, image_xscale);
        }
    }
} else {
    surface_timer = 0;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Air

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

// Don't bother if in the middle of respawning/dying:
if (state_current != player_state_death && physics_type == PHYS_WATER && !instance_exists(ctrl_tally)) {
    // Refill air if in breathe state or bubble shield:
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

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

// Insta invincibility:
if (status_insta_alarm > 0) {
    status_insta_alarm -= 1;
}

// Hurt invincibility:
if (status_invin_alarm > 0) {
    status_invin_alarm -= 1;

    if (status_invin_alarm == 0) {
        status_invin = INVIN_NONE;
    }
}

// Speed shoes:
if (status_speed_alarm > 0) {
    status_speed_alarm -= 1;

    if (status_speed_alarm == 0) {
        status_speed = SPEED_NONE;
    }
}

// Panic:
if (status_panic_alarm > 0) {
    status_panic_alarm -= 1;

    if (status_panic_alarm == 0) {
        status_panic = false;
    }
}

// Spring:
if (spring_alarm > 0) {
    spring_alarm -= 1;

    if (spring_alarm <= 0) {
        spring_strength = 0;
        spring_angle    = 0;
        spring_alarm    = 0;
        spring_current  = noone;
    }
}

// Clock Up:
if (clock_up_alarm > 0) {
    clock_up_alarm -= 1;
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Physics

// Update physics type:
if (instance_exists(obj_water_surface)) {
    if (y < obj_water_surface.y) {
        if (physics_type != PHYS_DEFAULT) {
            physics_type = PHYS_DEFAULT;
        }
    }

    if (y > obj_water_surface.y) {
        if (physics_type != PHYS_WATER) {
            physics_type = PHYS_WATER;

            // Clear elemental shields:
            if (status_shield == SHIELD_FIRE || status_shield == SHIELD_LIGHTNING) {
                status_shield = SHIELD_NONE;
            }
        }
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

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

// Don't bother if in the middle of respawning/dying:
if (state_current != player_state_death && !instance_exists(ctrl_tally)) {
    if (physics_type == PHYS_WATER) {
        // Refill air if in breathe state or bubble shield:
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
                            drown_index += 1;
                            break;

                        // Drown:
                        case 0:
                            // Set speed:
                            x_speed = 0;

                            // Drown:
                            drown = true;

                            // Set death:
                            player_set_damage(self);
                        break;
                    }

                    air_remaining -= 1;
                    air_alarm      = 60;
                }
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation Target

// Exit if the stage is paused:
if (game_ispaused(ctrl_pause)) {
    exit;
}

var y_radius_temp;

// Store previous radius:
y_radius_temp = y_radius;

switch (state_target) {
    // Idle:
    case player_state_idle:
        if (cliff_direction == 0) {
            if (animation_target != "stand" && animation_target != "wait" && animation_target != "ready" && animation_target != "land" && animation_target != "omochao" &&
                animation_target != "look_end" && animation_target != "crouch_end") {
                player_set_animation("stand");
            }
        } else {
            if (image_xscale == cliff_direction) {
                if (animation_target != "cliff_front") player_set_animation("cliff_front");
            } else {
                if (animation_target != "cliff_back") player_set_animation("cliff_back");
            }
        }
        break;

    // Turn:
    case player_state_turn:
        if (animation_target != "turn" && animation_target != "turn_brake") {
            player_set_animation("turn");
        }
        break;

    // Run:
    case player_state_run:
        if (animation_target != "push") {
            // Walk:
            if (abs(x_speed) < 1.50) {
                if (animation_target != "run_0") player_set_animation("run_0");
            }

            // Walk fast:
            else if (abs(x_speed) < 3.00) {
                if (animation_target != "run_1") player_set_animation("run_1");
            }

            // Jog:
            else if (abs(x_speed) < 4.50) {
                if (animation_target != "run_2") player_set_animation("run_2");
            }

            // Jog fast:
            else if (abs(x_speed) < 6.00) {
                if (animation_target != "run_3") player_set_animation("run_3");
            }

            // Run:
            else {
                if (animation_target != "run_4") player_set_animation("run_4");
            }
        }
        break;

    // Air:
    case player_state_air:
        if ((animation_target != "turn" && animation_target != "turn_brake" && animation_target != "spin" && animation_target != "brake" && animation_target != "spring_flight" && animation_target != "spring_fall") ||
            (animation_current == "spring_flight" && y_speed >= 0) || spring_alarm > 0) {
            // Flight:
            if (y_speed < 0 || (spring_angle != ANGLE_DOWN && spring_alarm > 0)) {
                player_set_animation("spring_flight");
            }

            // Fall:
            else {
                player_set_animation("spring_fall");
            }
        }
        break;

    // Jump:
    case player_state_jump:
        if (animation_target != "spin" && animation_target != "insta") {
            player_set_animation("spin");
        }
        break;

    // Look:
    case player_state_look:
        if (animation_target != "look") {
            player_set_animation("look");
        }
        break;

    // Crouch:
    case player_state_crouch:
        if (animation_target != "crouch") {
            player_set_animation("crouch");
        }
        break;

    // Spin Dash:
    case player_state_spin_dash:
        if (animation_target != "spin_dash" && animation_target != "spin_charge") {
            player_set_animation("spin_dash");
        }
        break;

    // Roll:
    case player_state_roll:
        if (animation_target != "spin") {
            player_set_animation("spin");
        }
        break;

    // Brake:
    case player_state_brake:
        if (animation_target != "brake" && animation_target != "brake_fast") {
            player_set_animation("brake");
        }
        break;

    // Hurt:
    case player_state_hurt:
        if (animation_target != "hurt") {
            player_set_animation("hurt");
        }
        break;

    // Death:
    case player_state_death:
        if (animation_target != "death") {
            player_set_animation("death");
        }
        break;

    // Death:
    case player_state_bound:
        if (animation_target != "spin") {
            player_set_animation("spin");
        }
        break;

    // Hammer:
    case player_state_hammer:
        if (animation_target != "hammer") {
            player_set_animation("hammer");
        }
        break;

    // Skid:
    case sonic_state_skid:
        if (animation_target != "somersault" && animation_target != "skid" && animation_target != "skid_end") {
            player_set_animation("somersault");
        }
        break;
}

// Wait:
if (!game_ispaused(ctrl_text) && on_ground == true && input_lock == false && animation_target == "stand") {
    if (animation_alarm > 0) {
        animation_alarm -= 1;

        if (animation_alarm == 0) {
            player_set_animation("wait");
        }
    }
} else {
    if (animation_alarm != 360) animation_alarm = 360;
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
    case "look_end":
    case "crouch":
    case "crouch_end":
    case "brake":
    case "spring_flight":
    case "spring_fall":
        // Tag variants
        break;

    // Wait:
    case "wait":
        if (animation_target != animation_current) {
            // Leader & partner wait:
            if (instance_number(obj_player) > 1) {
                // Leader:
                if (player_slot == 0) {
                    animation_variant = 0;
                }

                // Partner:
                else {
                    animation_variant = 1;
                }
            }

            // Randomize wait:
            else {
                animation_variant = choose(0, 1);
            }
        }
        break;

    case "spin":
        // Spin flight & fall:
        if (state_target == player_state_jump) {
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

// Timeline speed:
switch (animation_target) {
    case "run_0":
    case "run_1":
    case "run_2":
    case "run_3":
    case "run_4":
        ctl_speed = clamp(abs(x_speed * 16 * 3) / 64, 0.5, 7);
        break;

    default:
        ctl_speed = 1;
}

// Animation core:
player_animation_core();

// Animation timer:
animation_timer += 1;

// Position fix:
if (on_ground == true) {
    x += (y_radius_temp - y_radius) * dsin(mask_rotation);
    y += (y_radius_temp - y_radius) * dcos(mask_rotation);
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Image Angle

// Exit if the stage is paused or text is active:
if (game_ispaused()) {
    exit;
}

var angle_mod;

// Animation Angle:
switch (animation_current) {
    // Reset angle:
    case "stand":
    case "cliff_front":
    case "cliff_back":
    case "wait":
    case "ready":
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
    case "skid":
        image_angle = gravity_angle();
        break;

    // Spring angle:
    case "spring_flight":
    case "spring_fall":
        if (character_id != CHAR_CLASSIC && spring_angle != ANGLE_DOWN && spring_alarm > 0) {
            image_angle = spring_angle - 90;
        } else {
            image_angle = approach_angle(image_angle, gravity_angle(), 4);
        }
        break;

    // Terrain angle:
    default:
        // Default angle behavior:
        if (character_id != CHAR_CLASSIC) {
            if (on_ground == true) {
                image_angle = angle;
            } else {
                image_angle = approach_angle(image_angle, gravity_angle(), 4);
            }
        }

        // Classic/Tag angle behavior:
        else {
            if (on_ground == true) {
                if (angle mod 45 != 0) {
                    image_angle = roundto(angle, 45);
                }
            } else {
                image_angle = approach_angle(image_angle, gravity_angle(), 4);
            }
        }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Afterimage

if (afterimage_draw == true) {
    if (afterimage_alarm > 0) {
        afterimage_alarm -= 1;

        if (afterimage_alarm <= 0) {
            if (instance_number(eff_afterimage) < 3) {
                // Create afterimage:
                with (instance_create(floor(x), floor(y), eff_afterimage)) {
                    sprite_index = other.sprite_index;
                    image_index  = other.image_index;
                    image_xscale = other.image_xscale;
                    image_angle  = other.image_angle;
                    image_alpha  = 0.9;
                    depth        = other.depth + 1;
                }

                // Reset alarm:
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
/// Trail

// Exit if trails are disabled:
if (global.misc_trails == false) {
    exit;
}

// Color trail:
if (global.misc_trails == true) {
    switch (character_id) {
        // Miles:
        case CHAR_MILES:
            trail_color = c_yellow;
            break;

        // Knuckles:
        case CHAR_KNUCKLES:
            trail_color = c_red;
            break;

        // Sonic:
        default:
            trail_color = c_blue;
            break;
    }
}

// Update trail:
update_trail(floor(x) + (dcos(angle + 90) * (-2 - (1 * angle == 90)) * (trail_draw == true)) + dcos(angle) * x_speed,
    floor(y) - (dsin(angle + 90) * (-3 - (1 * angle != 0)) * (trail_draw == true)) + y_speed - dsin(angle) * x_speed,
    (trail_draw == true));
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

// Hurt alpha:
if (status_invin == INVIN_HURT && status_invin_alarm > 0) {
    image_alpha = sync_rate(status_invin_alarm, 2, 2);
} else {
    image_alpha = 1;
}

// Player:
if (sprite_exists(sprite_index)) {
    draw_self_floored();
}

// Reset:
draw_reset();
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Collision

// Exit if not in debug mode:
if (global.game_debug == false) {
    exit;
}

var x_int, y_int, sine, csine;

x_int = floor(x);
y_int = floor(y);

// Bounding box:
if (mask_rotation mod 180 != 0) {
    draw_rectangle_color(x_int - y_radius, y_int - x_radius, x_int + y_radius, y_int + x_radius, c_orange, c_orange, c_orange, c_orange, true);
} else {
    draw_rectangle_color(x_int - x_radius, y_int - y_radius, x_int + x_radius, y_int + y_radius, c_orange, c_orange, c_orange, c_orange, true);
}

// Wall radius:
sine  = dsin(mask_rotation);
csine = dcos(mask_rotation);

draw_line_color(x_int - csine * wall_radius, y_int + sine * wall_radius, x_int + csine * wall_radius, y_int - sine * wall_radius, c_white, c_white);

// Hurtbox:
draw_collision(hurtbox_left, hurtbox_top, hurtbox_right, hurtbox_bottom, hurtbox_offset_x, hurtbox_offset_y, image_xscale, mask_rotation, c_maroon);

// Hitbox:
draw_collision(hitbox_left, hitbox_top, hitbox_right, hitbox_bottom, hitbox_offset_x, hitbox_offset_y, image_xscale, mask_rotation, c_green);

// Reset:
draw_reset();
