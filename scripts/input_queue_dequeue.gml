/// input_queue_dequeue(queue)
/* */

with (ctrl_input)
{
    if (queue_list == -1) return false;
    return ds_queue_dequeue(ds_list_find_value(queue_list, argument0));
}
