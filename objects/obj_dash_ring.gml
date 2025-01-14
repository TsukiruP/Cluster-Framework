#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

event_inherited();

image_index = 1;

targetable = false;
cover = noone;
rainbow_ring = false;
rainbow_score = true;
#define Step_2
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Animation

if (rainbow_ring == true)
{
    image_index = time_sync(game_get_time(), 4, 6) + 1;
    cover.image_index = image_index + 6;
}
#define Other_4
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Field Initialization

event_inherited();

//field rainbow_ring: false

/*preview
    var orientation, flip_x, flip_y;

    image_xscale = 1;
    image_yscale = 1;
    orientation = Field("orientation", 0);
    flip_x = Field("flip_x", 0);
    flip_y = Field("flip_y", 0);
    rainbow_ring = Field("rainbow_ring", 0);

    switch (orientation)
    {
        case 1:
            if (rainbow_ring == true)
            {
                sprite_index = Sprite("spr_rainbow_ring_horizontal",  0);
            }
            else
            {
                sprite_index = Sprite("spr_dash_ring_horizontal",  0);
            }
            break;

        case 2:
            if (rainbow_ring == true)
            {
                sprite_index = Sprite("spr_rainbow_ring_diagonal",  0);
            }
            else
            {
                sprite_index = Sprite("spr_dash_ring_diagonal",  0);
            }
            break;

        default:
            if (rainbow_ring == true)
            {
                sprite_index = Sprite("spr_rainbow_ring_vertical",  0);
            }
            else
            {
                sprite_index = Sprite("spr_dash_ring_vertical",  0);
            }
    }

    if (flip_x == true)
    {
        image_xscale = -1;
    }

    if (flip_y == true)
    {
        image_yscale = -1;
    }
*/
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Dash Ring Initialization

// Spring orientation:
switch (orientation)
{
    case ORIEN_HORIZONTAL:
        if (rainbow_ring == true)
        {
            sprite_index = spr_rainbow_ring_horizontal;
        }
        else
        {
            sprite_index = spr_dash_ring_horizontal;
        }

        hurtbox_set(6, 24, 7, 26);
        angle = ANGLE_RIGHT;
        break;

    case ORIEN_DIAGONAL:
        if (rainbow_ring == true)
        {
            sprite_index = spr_rainbow_ring_diagonal;
        }
        else
        {
            sprite_index = spr_dash_ring_diagonal;
        }

        hurtbox_set(7, 7, 7, 7);
        angle = ANGLE_RIGHT_UP;
        break;

    default:
        if (rainbow_ring == true)
        {
            sprite_index = spr_rainbow_ring_vertical;
        }
        else
        {
            sprite_index = spr_dash_ring_vertical;
        }

        hurtbox_set(26, 5, 26, 6);
        angle = ANGLE_UP;

}

if (flip_x == true)
{
    image_xscale = -1;
    angle = 180 - angle;
}

if (flip_y == true)
{
    image_yscale = -1;
    angle = 360 - angle;
}

cover = instance_create(x, y, par_effect);
cover.depth = -10;
cover.sprite_index = sprite_index;
cover.image_xscale = image_xscale;
cover.image_yscale = image_yscale;

if (rainbow_ring == false)
{
    cover.image_index = 2;
}
