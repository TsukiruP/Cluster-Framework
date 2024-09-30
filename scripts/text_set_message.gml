/// text_set_message(str1, str2, ...)
// Sets the message of the text box.

with (ctrl_text)
{
    // Text length:
    text_length = argument_count - 1;

    // Text message:
    for (i = 0; i < argument_count; i += 1)
    {
        text_message[i] = argument[i];
    }

    // Reset current & target:
    text_current = 0;
    text_target = 0;
}
