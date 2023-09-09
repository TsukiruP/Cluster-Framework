/// character_compile_animations()

if(global.animation_initialized == false) {
    classic_add_animations();
    sonic_add_animation();
    miles_add_animations();
    knuckles_add_animations();

    global.animation_initialized = true;
}
