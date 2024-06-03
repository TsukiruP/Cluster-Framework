/// text_message_set(str1, str2, ...)
// Sets the messages of text boxes to the given strings.

with (ctrl_text) {
    // Text length:
    text_length = argument_count - 1;

    // Text message:
    for (i = 0; i < argument_count; i += 1) {
        text_message[i] = argument[i];
    }

    // Reset current & target:
    text_current = 0;
    text_target  = 0;
}
