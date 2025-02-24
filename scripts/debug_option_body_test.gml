/// debug_option_body_test(return)
/// @param {any} return
/// @returns {any}

var _return; _return = argument0;

switch (_return)
{
    // Text:
    case 0:
        return "Body Test";

    // Confirm:
    case 2:
        text_set_body(choose(
        "The ruler that walks on the road of providence.",
        "The sun is wonderful. It can even make the dirt shine.",
        "I am the center of the world. So... I will save the world.",
        "People walk on the path of people and that which opens that path up is the path of Heaven.",
        "My evolution is faster than the speed of the light. There is nothing in the whole universe that can keep up with my evolution.",
        "Justice is myself. I am justice.",
        "There is only one name in the world that you must remember. The ruler that walks on the road of providence."
        ));
        return true;

    // Undefined:
    default:
        return undefined;
}
