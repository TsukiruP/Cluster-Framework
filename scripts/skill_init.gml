/// skill_init()
// Initializes character skills.

// Sonic:
for (i = SONIC_JUMP; i <= SONIC_SHIELD; i += 1)
{
    global.skill_sonic[i] = 0;
}
