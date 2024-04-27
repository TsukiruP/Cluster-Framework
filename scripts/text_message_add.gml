/// text_message_add([strings to be added])
//

with (ctrl_text) {
    text_length = argument_count;

    for (i = 0; i < argument_count; i += 1) {
        text_message[i] = argument[i];
    }

    text_current = 0;
    text_target  = 0;
}
