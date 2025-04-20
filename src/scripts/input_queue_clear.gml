/// input_queue_clear()
/// @desc Clears input queues.
/// @returns {void}

with (ctrl_input)
{
    if (queue_list == -1) exit;

    for ({var i; i = 0}; i < ds_list_size(queue_list); i += 1)
    {
        ds_queue_clear(ds_list_find_value(queue_list, i));
        repeat (16) ds_queue_enqueue(ds_list_find_value(queue_list, i), false);
    }
}
