/// input_queue_clear()
/* Clears all input queues. */

with (ctrl_input)
{
    if (queue_list == -1) exit;

    var i;

    for (i = 0; i < ds_list_size(queue_list); i += 1)
    {
        ds_queue_clear(ds_list_find_value(queue_list, i));

        repeat (16)
        {
            ds_queue_enqueue(ds_list_find_value(queue_list, i), false);
        }
    }
}
