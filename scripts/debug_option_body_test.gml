/// debug_option_body_test(index, [execute])
/// @param {int} index
/// @param {bool} [execute]
/// @returns {any}

var _index; _index = argument[0];
var _execute; if (argument_count > 1) _execute = argument[1]; else _execute = true;

switch (_index)
{
    case OPTION_TEXT:
        return "Body Test";

    case OPTION_CONFIRM:
        if (_execute)
        {
            text_set_body(choose(
            "The ruler that walks on the road of providence.",
            "The sun is wonderful. It can even make the dirt shine.",
            "I am the center of the world. So... I will save the world.",
            "People walk on the path of people and that which opens that path up is the path of Heaven.",
            "My evolution is faster than the speed of the light. There is nothing in the whole universe that can keep up with my evolution.",
            "Justice is myself. I am justice.",
            "There is only one name in the world that you must remember. The ruler that walks on the road of providence."
            ));
        }

        return true;

    default:
        return undefined;
}
