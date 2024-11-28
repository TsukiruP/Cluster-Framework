/// text_set_body(str1, str2, ...)
// Sets body text.

with (mgr_text)
{
    var i;

    // Body length:
    body_length = argument_count - 1;

    // Body message:
    for (i = 0; i < argument_count; i += 1)
    {
        body_string[i] = argument[i];
    }

    // Reset:
    body_current = 0;
    body_target = 0;
}
