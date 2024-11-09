/// skill_init()
// Initializes character skills.

// Sonic:
for (i = SONIC_JUMP; i <= SONIC_SHIELD; i += 1)
{
    skill_set(CHAR_SONIC, i, 0);
}
