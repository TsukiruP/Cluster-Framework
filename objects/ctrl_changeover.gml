#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// State variables:
debug            = false
fade_state       = 0;
menu_state       = 0;
title_card_state = 0;
death_state      = 0;

// Changeover variables:
changeover_type    = CO_FADE;
changeover_speed   = 0.02;
changeover_timer   = 0;
changeover_standby = 0;
changeover_room    = room;

// Background variables:
background_position     = -15;
background_speed        =  0;
background_target       =  global.display_height + 15;
background_scroll       =  0;
background_scroll_speed =  0.5;

// Banner variables:
banner_position     = -sprite_get_width(spr_title_card_banner) - 12;
banner_speed        = 0;
banner_target       = 0;
banner_scroll       = 0;
banner_scroll_speed = 1;

// Zone variables:
zone_position     = 0;
zone_start        = 0;
zone_speed        = 0;
zone_target       = 40;
zone_scroll       = 0;
zone_scroll_speed = 1;
zone_distance     = 0;

// Act variables:
act_position = global.display_height;
act_speed    = 0;

// Death variables:
death_position = 0;
death_start    = 0;
death_speed    = 0;
death_target   = global.display_width / 2 - 3;
death_distance = 0;
death_steps    = 15;
death_size     = 0;
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade Changeover

if(changeover_type == CO_FADE) {
    // 0 - Fade to black:
    if(fade_state == 0) {
        if(changeover_timer < 1) changeover_timer += changeover_speed;
        else {
            changeover_timer = 1;
            fade_state       = 1;
        }
    }

    // 1 - Standing by:
    if(fade_state == 1) {
        if(changeover_standby < 0.5) changeover_standby += changeover_speed;
        else {
            changeover_standby = 0.5;

            if(debug == true) {
                event_user(0);

                if(user_input_accept("pressed")) {
                    fade_state = 2;
                    event_user(1);
                }
            } else {
                room_goto(changeover_room);
                fade_state = 2;
            }
        }
    }

    // 2 - Fade from black:
    if(fade_state == 2) {
        if(changeover_timer > 0) changeover_timer -= changeover_speed;
        else instance_destroy();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Menu Changeover

if(changeover_type == CO_MENU) {
    // 0 - Background start:
    if(menu_state == 0) {
        if(background_position < background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position += background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
            menu_state          = 1;
        }
    }

    // 1 - Room change:
    if(menu_state == 1) {
        if(changeover_timer < 1) changeover_timer += changeover_speed;
        else {
            //changeover_timer = 1;

            if(debug == true) {
                event_user(0);

                if(user_input_accept("pressed")) {
                    menu_state = 2;
                    event_user(1);
                }
            } else {
                room_goto(changeover_room);
                menu_state = 2;
            }
        }
    }

    // 2 - Background end:
    if(menu_state == 2) {
        // Background target:
        background_target = -15;

        if(background_position > background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position -= background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target
            instance_destroy();
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Card Changeover

if(changeover_type == CO_TITLE_CARD) {
    // Banner scroll:
    banner_scroll += banner_scroll_speed;

    // Zone distance:
    zone_distance = zone_start + zone_position;

    // 0 - Background start:
    if(title_card_state == 0) {
        if(background_position < background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position += background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
            title_card_state    = 1;
        }
    }

    // 1 - Banner/zone start:
    if(title_card_state == 1) {
        // Banner start:
        if(banner_position < 0) {
            banner_speed     = ceil(abs(banner_position - banner_target) / 6);
            banner_position += banner_speed;
        } else {
            banner_speed    = 0;
            banner_position = banner_target;
        }

        // Zone start:
        if(zone_distance < zone_target) {
            zone_speed     = ceil(abs(zone_distance - zone_target) / 9);
            zone_position += zone_speed;
        } else {
            zone_speed       = 0;
            zone_position    = -zone_start + zone_target;
            title_card_state = 2;
        }
    }

    // 2 - Room change:
    if(title_card_state == 2) {
        if(changeover_timer < 1) changeover_timer += changeover_speed;
        else {
            changeover_timer = 1;

            if(debug == true) {
                event_user(0);

                if(user_input_accept("pressed")) {
                    title_card_state = 4;
                    event_user(1);
                }
            } else {
                room_goto(changeover_room);
                title_card_state = 3;
            }
        }
    }

    // 3 - Standing by:
    if(title_card_state == 3) {
        if(changeover_standby < 2) changeover_standby += changeover_speed;
        else {
            changeover_standby = 2;
            title_card_state   = 4;
        }
    }

    // 4 - Background end:
    if(title_card_state == 4) {
        // Background target:
        background_target = -15;

        if(background_position > background_target) {
            background_speed     = ceil(abs(background_position - background_target) / 5);
            background_position -= background_speed;

            // Player kickoffs:
            if(player_exists()) {
                // Run kickoff:
                if(room_kickoff == KICKOFF_RUN) {
                    global.player_id.x_speed     = global.player_id.x_top_speed;
                    global.player_id.input_right = true;
                }

                // Wait/ready kickoffs:
                else if(room_kickoff == KICKOFF_WAIT || room_kickoff == KICKOFF_READY) {
                    if(floor(background_position) <= global.player_id.y + 13 - view_yview[view_current]) {
                        // Wait kickoff:
                        if(room_kickoff == KICKOFF_WAIT) {
                            global.player_id.animation_current = "wait_short";

                            if(partner_exists()) global.partner_id.animation_current = "wait_short";
                        }

                        // Ready kickoff:
                        if(room_kickoff == KICKOFF_READY) {
                            global.player_id.animation_current = "ready";

                            if(partner_exists()) global.partner_id.animation_current = "ready";
                        }
                    }
                } else if(room_kickoff != KICKOFF_DEFAULT) global.player_id.control_type = 1;
            }
        } else {
            background_speed    = 0;
            background_position = background_target;
            title_card_state    = 5;
        }
    }

    // 5 - Banner/stage end:
    if(title_card_state == 5) {
        // Banner target:
        banner_target = -sprite_get_width(spr_title_card_banner) - 12;

        // Zone target:
        zone_target = global.display_width + 9;

        if(debug == false) {
            // Kickoff standbys:
            if(player_exists()) {
                // Default standby:
                if(room_kickoff == KICKOFF_DEFAULT) {
                    if(changeover_standby < 4.4) changeover_standby += changeover_speed;
                    else changeover_standby = 4.4;
                }

                // Animation standby:
                if(room_kickoff == KICKOFF_WAIT && global.player_id.animation_current != "wait_short" ||
                    room_kickoff == KICKOFF_READY && global.player_id.animation_current != "ready") {
                    if(changeover_standby < 2.2) changeover_standby += changeover_speed;
                    else changeover_standby = 2.2;
                }

                // Running:
                if(room_kickoff == KICKOFF_RUN) {
                    if(room_run_end_x != -1 && global.player_id.x >= room_run_end_x) room_run_end_x = -1;
                }
            }
        }

        if(debug == true || room_kickoff == KICKOFF_DEBUG || (room_kickoff == KICKOFF_DEFAULT && changeover_standby == 4.4) ||
            ((room_kickoff == KICKOFF_WAIT || room_kickoff == KICKOFF_READY) && changeover_standby >= 2.2) ||
            (room_kickoff == KICKOFF_RUN && room_run_end_x == -1)) {
            // Start stage:
            stage_start();

            // Remove persistence:
            persistent = false;

            // Banner end:
            if(banner_position > banner_target) {
                banner_speed     = ceil(abs(banner_position - banner_target) / 6);
                banner_position -= banner_speed;
            } else {
                banner_speed = 0;
                banner_position = banner_target;
            }

            // Zone end:
            if(zone_distance < zone_target) {
                zone_speed     = ceil(abs(zone_distance - zone_target) / 9);
                zone_position += zone_speed;
            } else {
                zone_speed    = 0;
                zone_position = -zone_distance + zone_target;
            }
        }

        // Title card end:
        if(banner_position == banner_target && zone_distance == zone_target) instance_destroy();
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Death Changeover

if(changeover_type == CO_DEATH) {
    // Background scroll:
    background_scroll += background_scroll_speed;

    // Death distance:
    death_distance = death_start - death_position;

    // Background position:
    if(death_state != 4) {
        if(background_position < background_target) {
            background_speed     = ceil(abs(background_position - background_target) / death_steps);
            background_position += background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
        }
    } else {
        if(background_position > background_target) {
            background_speed     = ceil(abs(background_target - background_position) / death_steps);
            background_position -= background_speed;
        } else {
            background_speed    = 0;
            background_position = background_target;
        }
    }

    // Death position:
    if(death_distance > death_target) {
        death_speed     = ceil(abs(death_target - death_distance) / 9);
        death_position += death_speed;
    } else {
        death_speed    = 0;
        death_position = -death_target + death_start;
    }

    // Skip states:
    if(changeover_standby != 1 && death_state <= 1 && changeover_standby != 1 && user_input_accept("pressed")) {
        changeover_standby = 1;
        death_state        = 1;
    }

    // 0 - Background start:
    if(death_state == 0) {
        // Background target:
        background_target = 32;

        if(death_distance == death_target && background_position == background_target) death_state = 1;
    }

    // 1 - Standing by:
    if(death_state == 1) {
        if(changeover_standby < 1) changeover_standby += changeover_speed;
        else {
            if(debug == true) event_user(0);
            if((debug == true && user_input_accept("pressed")) || debug == false) {
                if(debug == true) event_user(1);

                death_state = 2;
            }
        }
    }

    // 2 - Death end:
    if(death_state == 2) {
        // Background target:
        background_target = global.display_height / 2 + 15;

        // Death target:
        death_target = -death_size - 9;

        if(death_distance == death_target && background_position == background_target) death_state = 3;
    }

    // 3 - Room change:
    if(death_state == 3) {
        if(changeover_timer < 1) changeover_timer += changeover_speed;
        else {
            if(global.checkpoint_x != -1 && global.checkpoint_y != -1) {
                if(debug == false) room_goto(changeover_room);

                death_state = 4;
            } else {
                persistent                  = false;
                changeover                  = room_changeover(room);
                changeover.changeover_timer = 1;
                changeover.depth            = depth - 50;
                death_state                 = -1;
            }
        }
    }

    // 4 - Background end:
    if(death_state == 4) {
        // Background target:
        background_target = -15;

        // Resume stage:
        stage_start();

        if(background_position == background_target) instance_destroy();
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Create Objects

// Create water:

// Create background:
if(room_background != -1) instance_create(0, 0, room_background);

// Create stage objects:
if(changeover_type == CO_TITLE_CARD || changeover_type == CO_DEATH) {
    instance_create(0, 0, ctrl_culling);
    instance_create(0, 0, ctrl_stage);
    instance_create(0, 0, ctrl_hud);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Open Debug Header
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Close Debug Header
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Fade Changeover

if(changeover_type == CO_FADE) {
    draw_set_color(c_black);
    draw_set_alpha(changeover_timer);

    draw_rectangle(view_xview[view_current], view_yview[view_current], view_xview[view_current] + global.display_width, view_yview[view_current] + global.display_height, false);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu Changeover

if(changeover_type == CO_MENU) {
    draw_sprite(spr_changeover_background, 0, view_xview[view_current], view_yview[view_current] + background_position);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title Card Changeover

if(changeover_type == CO_TITLE_CARD) {
    // Font:
    draw_set_font(global.font_title_card);

    // Background:
    draw_sprite(spr_changeover_background, 0, view_xview[view_current], view_yview[view_current] + background_position);

    // Bar:
    draw_sprite_tiled_vertical(spr_title_card_banner, 0, view_xview[view_current] + banner_position, view_yview[view_current] + banner_scroll);

    // Zone:
    zone_start = -string_width(room_zone) - 9;

    draw_text(view_xview[view_current] + zone_start + zone_position, view_yview[view_current] + 87, room_zone);

    if(room_act != 0) draw_sprite(spr_title_card_acts, room_act, view_xview[view_current] + zone_start + zone_position + 5, view_yview[view_current] + 128);

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Death Changeover

if(changeover_type == CO_DEATH) {
    // Font:
    draw_set_font(global.font_title_card);
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    // Background:
    draw_sprite_tiled_horizontal(spr_changeover_background, 1, view_xview[view_current] + background_scroll, view_yview[view_current] + background_position);
    draw_sprite_tiled_horizontal_yscale(spr_changeover_background, 1, view_xview[view_current] - background_scroll, view_yview[view_current] + global.display_height - background_position, -1);

    // Try again:
    death_size  = string_width("Try Again");
    death_start = global.display_width + death_size + 9;

    draw_text(view_xview[view_current] + death_start - death_position, view_yview[view_current] + global.display_height / 2, "Try Again");

    // Reset draw variables:
    draw_set_color(c_white);
    draw_set_alpha(1);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}
