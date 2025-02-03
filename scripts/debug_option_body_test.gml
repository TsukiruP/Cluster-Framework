/// debug_option_body_test(return)

switch (argument0)
{
    // Text:
    case 0:
        return "Body Test";

    // Confirm:
    case 2:
        text_set_body("This message is a test!", "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Fusce sagittis dolor vel sapien rutrum, et eleifend lacus molestie. Ut eget sem vestibulum, pharetra magna tempus, suscipit libero. Vestibulum vel aliquam lorem. Mauris vulputate, augue varius consequat pharetra, justo eros convallis libero, ultrices blandit purus ex a turpis. Aliquam rhoncus a libero sed vehicula. Nullam vulputate sed odio vitae feugiat. Aliquam erat volutpat. Phasellus aliquet vitae erat vitae sollicitudin. Aenean eu ante eget enim maximus vehicula.");
        return true;

    // Undefined:
    default:
        return undefined;
}
