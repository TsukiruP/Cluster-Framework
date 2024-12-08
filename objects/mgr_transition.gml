#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Transition Initialization

// Flags:
debug = false;
pause_ignore = false;
load_skip = false;

// Transition variables:
transition_id = TRANS_FADE;
transition_state = 0;
transition_alarm = 0;
transition_time = 0;
transition_room = room;
transition_run = -1;

// Fade handle:
fade_handle = noone;

// Player handle:
player_handle = noone;

// Background variables:
background_y_current = -15;
background_y_target = screen_get_height() + 15;
background_y_speed = 0;
background_y_factor = 5;

background_x_scroll = 0;
background_x_scroll_speed = 1;

// Banner variables:
banner_x_current = -sprite_get_width(spr_title_card_banner) - 12;
banner_x_target = 0;
banner_x_speed = 0;
banner_x_factor = 6;

banner_y_scroll = 0;
banner_y_scroll_speed = 1;

// Zone variables:
zone_x_current = 0;
zone_x_target = 40;
zone_x_speed = 0;
zone_x_factor = 9;

// Loading variables:
switch (game_save_get("player0"))
{
    // Sonic:
    default:
        character_index = spr_sonic_run_4;
        character_y_offset = -7;
}

character_x_current = -sprite_get_width(character_index);
character_x_target = screen_get_width() - 27;
character_x_speed = 0;
character_x_factor = 12;

character_alpha = 1;
stars_y = screen_get_height() - 16;

// Retry variables:
draw_set_font(global.font_title_card);

retry_text = "Try Again";
retry_width = string_width(retry_text);
retry_x_current = screen_get_width() + retry_width + zone_x_factor;
retry_x_target = (screen_get_width() / 2) - 3;
retry_x_speed = 0;
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Alarm & Time

// Exit if the stage is paused:
if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

// Alarm:
if (transition_alarm >= 0)
{
    transition_alarm -= 1;

    if (transition_alarm <= 0)
    {
        if ((transition_id != TRANS_CARD && transition_state == 1) || (transition_id == TRANS_CARD && transition_state == 2))
        {
            // Open debug topic:
            if (debug == true)
            {
                text_subject_set("Debug");
            }

            // Close debug topic:
            if (debug == false || (debug == true && input_get_check(INP_CONFIRM, CHECK_PRESSED)))
            {
                if (debug == true)
                {
                    with (mgr_text)
                    {
                        text_clear = true;
                    }
                }

                // Retry has its own room_goto call:
                if (transition_id != TRANS_RETRY)
                {
                    game_checkpoint_set(true);
                    room_goto(transition_room);
                }

                transition_state += 1;

                // Title card calls a delay:
                if (transition_id == TRANS_CARD)
                {
                    transition_alarm = 90;
                }
            }
        }
    }
}

// Time:
if (transition_id == TRANS_CARD)
{
    transition_time += 1;
}

// Alpha:
if (transition_id == TRANS_CARD)
{
    if (transition_state >= 3 && character_alpha > 0)
    {
        character_alpha -= 0.05;
    }
}
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Background

// Exit if the stage is paused:
if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

// Background target - bottom of screen:
if ((transition_id == TRANS_MENU && transition_state < 2) || (transition_id == TRANS_CARD && transition_state < 4))
{
    background_y_target = screen_get_height() + 15;
}

// Background target - retry letterbox:
else if (transition_id == TRANS_RETRY && (transition_state < 2 || transition_state == 4))
{
    background_y_target = 32;
}

// Background target - middle of screen:
else if (transition_id == TRANS_RETRY && (transition_state == 2 || transition_state == 3))
{
    background_y_target = screen_get_height() / 2 + 15;
}

// Background target - top of screen:
else
{
    background_y_target = -15;
}

// Background position:
if (background_y_current != background_y_target)
{
    var background_y_factor, background_x_distance;

    // Background factor:
    if (transition_id == TRANS_RETRY)
    {
        background_y_factor = 15;
    }
    else
    {
        background_y_factor = 5;
    }

    // Background distance:
    background_x_distance = background_y_target - background_y_current;

    background_y_speed = ceil(abs(background_x_distance) / background_y_factor);
    background_y_current += background_y_speed * sign(background_x_distance);

    if (background_y_current == background_y_target)
    {
        background_y_speed = 0;

        // Transition behavior:
        switch (transition_id)
        {
            // Menu:
            case TRANS_MENU:
                // Move to change rooms:
                if (transition_state == 0)
                {
                    transition_state = 1;
                    transition_alarm = 60;
                }
                break;

            // Title card:
            case TRANS_CARD:
                if (transition_state == 0)
                {
                    transition_state = 1;
                }
                break;
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Player Start

// Exit if the stage is paused:
if ((game_ispaused(mnu_pause) && pause_ignore == false) || (transition_id != TRANS_CARD && transition_id != TRANS_RETRY))
{
    exit;
}

if (instance_exists(stage_get_player(0)))
{
    // Hide HUD:
    if ((game_room_get_start() == START_RUN || (game_room_get_start() == START_READY && transition_id == TRANS_CARD)) && transition_state == 3)
    {
        if (instance_exists(mgr_hud))
        {
            with (mgr_hud)
            {
                hud_hide = true;
                hud_x_current = hud_x_target;
            }
        }
    }

    // Run:
    if (game_room_get_start() == START_RUN && transition_state >= 4 && transition_run != -1)
    {
        // Reset run:
        if ((transition_id == TRANS_RETRY && (game_checkpoint_get_x() != -1 && game_checkpoint_get_y() != -1)) || stage_get_player(0).x >= game_room_get_run())
        {
            transition_run = -1;
        }

        // Run:
        else
        {
            with (obj_player)
            {
                x_speed = top_speed;
                input_player[INP_RIGHT, CHECK_HELD] = true;
            }
        }
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Fade

if (transition_id == TRANS_FADE)
{
    switch (transition_state)
    {
        // 0 - Start fade:
        case 0:
            if (!instance_exists(fade_handle))
            {
                fade_handle = fade_create();
                fade_handle.persistent = true;
            }

            if (fade_handle.fade_alpha >= 1)
            {
                stage_set_time_allow(false);
                transition_state = 1;
                transition_alarm = 60;
            }
            break;

        // 2 - Reverse fade:
        case 2:
            fade_reverse(fade_handle);
            transition_state = 3;
            break;

        // 3 - End fade:
        case 3:
            // Start stage:
            stage_start();

            if (!instance_exists(fade_handle))
            {
                instance_destroy();
            }
            break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Title Card

// Exit if the stage is paused:
if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

if (transition_id == TRANS_CARD)
{
    // Banner scroll:
    banner_y_scroll += banner_y_scroll_speed;
    banner_y_scroll = banner_y_scroll mod(sprite_get_height(spr_title_card_banner));

    // Skip:
    if (game_room_get_start() == START_READY && transition_state >= 4 && transition_state != 6 && instance_exists(stage_get_player(0)))
    {
        if (input_get_check(INP_ANY, CHECK_PRESSED) && !input_get_check(INP_START, CHECK_PRESSED))
        {
            transition_state = 5;

            // Skip ready animation:
            if (stage_get_player(0).animation_current == "ready")
            {
                with (obj_player)
                {
                    player_set_animation("stand");
                }
            }
        }
    }

    // Banner & zone target:
    if (transition_state >= 4)
    {
        banner_x_target = -sprite_get_width(spr_title_card_banner) - 12;
        zone_x_target = screen_get_width() + zone_x_factor;
    }
    else
    {
        banner_x_target = 0;
        zone_x_target = 40;
    }

    // Banner position:
    if (transition_state > 0 && banner_x_current != banner_x_target)
    {
        var banner_x_distance;

        // Banner distance:
        banner_x_distance = banner_x_target - banner_x_current;

        banner_x_speed = ceil(abs(banner_x_distance) / banner_x_factor);
        banner_x_current += banner_x_speed * (sign(banner_x_distance));
    }

    // Zone position:
    if (transition_state > 0 && zone_x_current != zone_x_target)
    {
        zone_x_speed = ceil((zone_x_target - zone_x_current) / zone_x_factor);
        zone_x_current += zone_x_speed;

        if (zone_x_current >= zone_x_target && sign(zone_x_current) == sign(zone_x_target))
        {
            zone_x_speed = 0;
            zone_x_current = zone_x_target;
        }
    }

    // Character position:
    if (character_x_current != character_x_target)
    {
        character_x_speed = ceil((character_x_target - character_x_current) / character_x_factor);
        character_x_current += character_x_speed;

        if (character_x_current >= character_x_target)
        {
            character_x_speed = 0;
            character_x_current = character_x_target;

            transition_alarm = 30;
        }
    }

    switch (transition_state)
    {
        // 0 - Initialize zone:
        case 0:
            // Font:
            draw_set_font(global.font_title_card);

            if (zone_x_current != (-string_width(game_room_get_zone(transition_room)) - zone_x_factor))
            {
                zone_x_current = -string_width(game_room_get_zone(transition_room)) - zone_x_factor;
            }
            break;

        // 1 - Room change:
        case 1:
            // Move to room change:
            if (transition_alarm == 0 && banner_x_current == banner_x_target && zone_x_current == zone_x_target && character_x_current == character_x_target)
            {
                stage_set_time_allow(false);
                transition_state = 2;
                transition_alarm = 30;

                // Load skip:
                if (load_skip == true)
                {
                    transition_alarm = 0;
                }
            }
            break;

        // 3 - Standing by:
        case 3:
            if (transition_alarm <= 0)
            {
                transition_state = 4;
            }
            break;

        // 4 - Opener start:
        case 4:
            if ((game_room_get_start() != START_RUN || transition_run != -1) && debug == false && instance_exists(stage_get_player(0)))
            {
                // Ready:
                if (game_room_get_start() == START_READY)
                {
                    // Time it with the background:
                    if (background_y_current <= floor(stage_get_player(0).y + stage_get_player(0).y_radius - view_yview[view_current]))
                    {
                        with (obj_player)
                        {
                            if (animation_current != "ready" && animation_previous != "ready")
                            {
                                player_set_animation("ready");
                            }
                        }
                    }
                }

                // Unlock player:
                else if (game_room_get_start() != START_IDLE && game_room_get_start() != START_RUN)
                {
                    with (obj_player)
                    {
                        input_lock = false;
                    }
                }

                // Move to next state:
                if (game_room_get_start() == START_IDLE || (game_room_get_start() == START_READY && stage_get_player(0).animation_previous == "ready"))
                {
                    transition_state = 5;
                }
            }

            // Skip opener end, since there's no player:
            else
            {
                transition_state = 5;
            }
            break;
            
        // 5 - Title card end:
        case 5:
            // Start stage:
            stage_start();
            
            // Destroy:
            if (banner_x_current == banner_x_target && zone_x_current == zone_x_target)
            {
                stage_set_time_allow(true);
                instance_destroy();
            }
            break;
    }
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Retry

// Exit if the stage is paused:
if (game_ispaused(mnu_pause) && pause_ignore == false)
{
    exit;
}

if (transition_id == TRANS_RETRY)
{
    // Background scroll:
    background_x_scroll += background_x_scroll_speed;
    background_x_scroll = background_x_scroll mod sprite_get_width(spr_transition_background);

    // Skip:
    if (transition_state < 2 && instance_exists(stage_get_player(0)) && input_get_check(INP_ANY, CHECK_PRESSED))
    {
        transition_state = 2;
    }

    // Retry target:
    if (transition_state >= 2)
    {
        retry_x_target = -retry_width - zone_x_factor;
    }
    else
    {
        retry_x_target = (screen_get_width() / 2) - 3;
    }

    // Retry position:
    if (retry_x_current != retry_x_target)
    {
        retry_x_speed = ceil(abs(retry_x_current - retry_x_target) / zone_x_factor);
        retry_x_current -= retry_x_speed;

        if (retry_x_current <= retry_x_target && sign(retry_x_current) == sign(retry_x_target))
        {
            retry_x_speed = 0;
            retry_x_current = retry_x_target;
        }
    }

    // Check text & background:
    if (background_y_current == background_y_target && retry_x_current == retry_x_target)
    {
        if (transition_state == 0 || transition_state == 2)
        {
            transition_state += 1;
            transition_alarm = 30 + (30 * (transition_state == 0));
        }
    }

    switch (transition_state)
    {
        // 3 - Room change:
        case 3:
            if (transition_alarm <= 0)
            {
                if (debug == false)
                {
                    room_goto(transition_room);
                }

                transition_state = 4;
            }
            break;

        // 4 - Opener end:
        case 4:
            if (game_room_get_start() != START_RUN || (game_room_get_start() == START_RUN && transition_run == -1) || debug == true)
            {
                transition_state = 5;
            }
            break;

        // 5 - Retry end:
        case 5:
            // Start stage:
            stage_start();

            if (background_y_current == background_y_target)
            {
                instance_destroy();
            }
            break;
    }
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Room Initialization

// Pause ignore:
pause_ignore = false;

// Play music:
audio_bgm_play(game_room_get_music());

// Create background:
if (game_room_get_background() != -1)
{
    instance_create(0, 0, game_room_get_background());
}

// Create water:
if (game_room_get_water() != -1)
{
    instance_create(0, game_room_get_water(), obj_water_surface);
}
#define Other_10
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Open Debug Subject
#define Other_11
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Close Debug Subject
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Menu Transition

if (transition_id == TRANS_MENU)
{
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_y_current);
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Title Card Transition

if (transition_id == TRANS_CARD)
{
    var transition_character;

    // Font:
    draw_set_font(global.font_title_card);

    // Background:
    draw_sprite(spr_transition_background, 0, view_xview[view_current], view_yview[view_current] + background_y_current);

    // Bar:
    draw_sprite_tiled_vertical(spr_title_card_banner, 0, view_xview[view_current] + banner_x_current, view_yview[view_current] + banner_y_scroll);

    // Zone:
    draw_set_valign(fa_bottom);
    draw_text(view_xview[view_current] + zone_x_current, view_yview[view_current] + 126, game_room_get_zone(transition_room));

    // Act:
    if (game_room_get_act(transition_room) != 0)
    {
        draw_sprite(spr_title_card_acts, game_room_get_act(transition_room), view_xview[view_current] + zone_x_current + 5, view_yview[view_current] + 128);
    }

    // Loading:
    if (load_skip == false && transition_state == 2)
    {
        draw_sprite(spr_title_card_load, 0, view_xview[view_current] + 4, view_yview[view_current] + screen_get_height() - 12);
    }

    // Stars:
    draw_sprite_ext(spr_title_card_stars, sync_rate(transition_time, 4, sprite_get_number(spr_title_card_stars)), view_xview[view_current] + character_x_current, view_yview[view_current] + stars_y, 1, 1, 0, c_white, character_alpha);

    // Character:
    d3d_set_fog(true, c_white, 0, 0);
    draw_sprite_ext(character_index, sync_rate(transition_time, 4, sprite_get_number(character_index)), view_xview[view_current] + character_x_current, view_yview[view_current] + stars_y + character_y_offset, 1, 1, 0, c_white, character_alpha);
    d3d_set_fog(false, c_black, 0, 0);

    // Reset:
    draw_reset();
}
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw Retry Transition

if (transition_id == TRANS_RETRY)
{
    // Font:
    draw_set_font(global.font_title_card);
    draw_set2(fa_center, fa_middle);

    // Background:
    draw_sprite_tiled_horizontal(spr_transition_background, 1, view_xview[view_current] + background_x_scroll, view_yview[view_current] + background_y_current);
    draw_sprite_tiled_horizontal_yscale(spr_transition_background, 1, view_xview[view_current] - 16 - background_x_scroll - 1, view_yview[view_current] + screen_get_height() - background_y_current, -1);

    // Try again:
    draw_text(view_xview[view_current] + retry_x_current, view_yview[view_current] + screen_get_height() / 2, retry_text);

    // Reset:
    draw_reset();
}
