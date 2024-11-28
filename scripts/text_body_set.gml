/// text_body_set(str1, str2, ...)
// Sets body text.

with (mgr_text)
{
    var i;

    // Clear list:
    ds_list_clear(body_list);

    // Body list:
    for (i = 0; i < argument_count; i += 1)
    {
        ds_list_add(body_list, argument[i]);
    }

    // Body length:
    body_length = ds_list_size(body_list) - 1;

    // Reset:
    body_current = 0;
    body_target = 0;
}
