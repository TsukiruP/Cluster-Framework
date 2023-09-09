#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Stage Initialization

global.stage_rings = 0;
global.stage_score = 0;
global.stage_time  = 0;
global.object_time = 0;
global.add_time    = false;
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Character Initialization

if(instance_exists(obj_player_spawn)) {
    with(obj_player_spawn) {
        // Spawn player:
        global.player_id                = instance_create(x, y, par_character);
        global.player_id.character_data = global.player_data;

        // Create camera:
        with(global.player_id) {
            camera              = instance_create(x, y, ctrl_camera);
            camera.focus_handle = global.player_id;
        }

        // Spawn partner:
        if(global.partner_data != 0) {
            global.partner_id                     =  instance_create(x - 30, y, par_character);
            global.partner_id.character_data      =  global.partner_data;
            global.partner_id.control_type        =  2;
        }

        character_compile_animations();

        instance_destroy();
    }
}
#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Pause Menu
#define Step_1
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Global Timers

// Stage timer:
if(global.add_time == true) {
    global.stage_time += 1000 / 60;
}

// Object timer
global.object_time += 1000 / 60;
