/// text_message_add_many(str...)
// Sets the text controller's message variables

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
