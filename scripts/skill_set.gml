/// skill_set(character, ind, skill)
// Sets the character skill at the index.

var character, index;

// Initialize:
character = argument0;
index = argument1;
skill = argument2;

switch (character)
{
    // Sonic:
    case CHAR_SONIC:
        global.skill_sonic[index] = skill;
        break;
}
