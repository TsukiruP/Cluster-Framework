/// input_queue_enqueue(queue, value)
/* */

with (ctrl_input)
{
    if (queue_list == -1)
    {
        exit;
    }

    ds_queue_enqueue(ds_list_find_value(queue_list, argument0), argument1);
}
