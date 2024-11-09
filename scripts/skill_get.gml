/// skill_get(character, ind)
// Returns the characher skill at the index.

var character, index;

// Initialize:
character = argument0;
index = argument1;

switch (character)
{
    // Sonic:
    case CHAR_SONIC:
        return global.skill_sonic[index];
}

// Return nothing:
return 0;
