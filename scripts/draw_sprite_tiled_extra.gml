/// draw_sprite_tiled_extra(sprite,image,x,y,xscale,yscale,angle,color,alpha,hrepeats,vrepeats)
/* draw_background_tiled_extra but for sprites. */

var __bg,__dx,__dy,__xs,__ys,__angle,__color,__alpha,__hrep,__vrep;

__bg=argument0
__im=argument1
__dx=argument2 __dy=argument3
__xs=argument4 __ys=argument5
__angle=modwrap(argument6,0,360)
__color=argument7 __alpha=argument8
__hrep=argument9 __vrep=argument10

var __tex,__w,__h,__u,__v,__angadd,__length;

__tex=sprite_get_texture(__bg, __im)
__w=sprite_get_width(__bg)*__xs
__h=sprite_get_height(__bg)*__ys

//       ????????
if (__w==0 || __h==0) exit

texture_set_repeat(1)
draw_primitive_begin_texture(pr_trianglestrip,__tex)

if (__hrep>0 && __vrep>0) {
    if (__xs=0 || __ys=0) exit
    __u=__dx __v=__dy
    draw_vertex_texture_color(__u-0.5,__v-0.5,0,0,__color,__alpha)
    __u=__dx+dcos(__angle)*__w*__hrep __v=__dy-dsin(__angle)*__w*__hrep
    draw_vertex_texture_color(__u-0.5,__v-0.5,__hrep,0,__color,__alpha)
    __u=__dx+dcos(__angle-90)*__h*__vrep __v=__dy-dsin(__angle-90)*__h*__vrep
    draw_vertex_texture_color(__u-0.5,__v-0.5,0,__vrep,__color,__alpha)
    __u=__dx+pivot_pos_x(__w*__hrep,__h*__vrep,__angle) __v=__dy+pivot_pos_y(__w*__hrep,__h*__vrep,__angle)
    draw_vertex_texture_color(__u-0.5,__v-0.5,__hrep,__vrep,__color,__alpha)
} else if (__hrep>0 || __vrep>0) {
    if (__xs=0 || __ys=0) exit //zero scale would produce a degenerate quad anyway
    __angadd=-__angle
    if (__hrep>0) {
        //vertical infinity; rotate uv logic 90 degrees
        __length=__w*__hrep __angle+=90
    } else {
        //horizontal infinity
        __length=__h*__vrep
    }

    if (__angle<45 || __angle>315 || (__angle>135 && __angle<225)) {
        //horizontal infinite tiler
        __u=0 repeat (2) {__v=__dy+(__dx-__u)*dtan(__angle) repeat (2) {
            draw_vertex_texture_color(__u-0.5,__v-0.5,pivot_pos_x(__u-__dx,__v-__dy,__angadd)/__w,pivot_pos_y(__u-__dx,__v-__dy,__angadd)/__h,__color,__alpha)
        __v+=__length*dsecant(__angle)} __u=room_width}
    } else {
        //vertical infinite tiler
        __v=0 repeat (2) {__u=__dx+(__dy-__v)*dtan(90-__angle) repeat (2) {
            draw_vertex_texture_color(__u-0.5,__v-0.5,pivot_pos_x(__u-__dx,__v-__dy,__angadd)/__w,pivot_pos_y(__u-__dx,__v-__dy,__angadd)/__h,__color,__alpha)
        __u+=__length*dsecant(90-__angle)} __v=room_height}
    }
} else {
    if (__xs=0 || __ys=0) {
        //infinite scale mode
        __u=0 repeat (2) {__v=0 repeat (2) {
            draw_vertex_texture_color(__u-0.5,__v-0.5,0.5,0.5,__color,__alpha)
        __v=room_height} __u=room_width}
    } else {
        //cover room mode
        __u=0 repeat (2) {__v=0 repeat (2) {
            draw_vertex_texture_color(__u-0.5,__v-0.5,pivot_pos_x(__u-__dx,__v-__dy,__angle)/__w,pivot_pos_y(__u-__dx,__v-__dy,__angle)/__h,__color,__alpha)
        __v=room_height} __u=room_width}
    }
}

draw_primitive_end()
