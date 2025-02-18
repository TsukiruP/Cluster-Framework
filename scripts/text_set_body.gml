/// text_set_body(body, ...)
/// @desc Sets body text.
/// @param {string} ...body
/// @returns {void}

var body; body = argument[0];

with (ctrl_text)
{
    var i;

    ds_list_clear(body_list);

    for (i = 0; i < argument_count; i += 1)
    {
        ds_list_add(body_list, argument[i]);
    }

    body_length = ds_list_size(body_list) - 1;
    body_current = 0;
    body_target = 0;
}
