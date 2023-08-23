/// room_changeover(room, [changeover])


changeover                 = instance_create(0, 0, ctrl_changeover);
changeover.changeover_room = argument[0];

with(changeover) room_get_data(argument[0]);
if(argument_count >= 2) changeover.changeover_type = argument[1];

return changeover;
