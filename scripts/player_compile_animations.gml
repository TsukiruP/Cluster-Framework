/// player_compile_animations()

if(global.animation_initialized == false) {
    sonic_add_animations();
    miles_add_animations();
    knuckles_add_animations();
    classic_add_animations();

    global.animation_initialized = true;
}
