/// miles_get_sequence(animation)
/// @desc Returns a sequence.
/// @param {string} animation
/// @returns {script}

var _animation; _animation = argument0;

if (tag_leader_state == STATE_FINISH)
{
    switch (_animation)
    {
        case "stand":
            return seq_miles_tag_stand;

        case "turn":
            return seq_miles_tag_turn;

        case "run_0":
            return seq_miles_tag_run_0;

        case "run_1":
            return seq_miles_tag_run_1;

        case "run_2":
            return seq_miles_tag_run_2;

        case "look":
            return seq_miles_tag_look;

        case "look_end":
            return seq_miles_tag_look_end;

        case "crouch":
            return seq_miles_tag_crouch;

        case "crouch_end":
            return seq_miles_tag_crouch_end;

        case "brake":
            return seq_miles_tag_brake;

        case "spring_flight":
            return seq_miles_tag_spring_flight;

        case "spring_fall":
            return seq_miles_tag_spring_fall;
    }
}

switch (_animation)
{
    case "cliff_front":
        return seq_miles_cliff_front;

    case "cliff_back":
        return seq_miles_cliff_back;

    case "wait_leader":
        return seq_miles_wait_leader;

    case "wait_partner":
        return seq_miles_wait_partner;

    case "standby":
        return seq_miles_standby;

    case "land":
        return seq_miles_land;

    case "omochao":
        return seq_miles_omochao;

    case "omochao_end":
        return seq_miles_omochao_end;

    case "turn":
        return seq_miles_turn;

    case "turn_brake":
        return seq_miles_turn_brake;

    case "run_0":
        return seq_miles_run_0;

    case "run_1":
        return seq_miles_run_1;

    case "run_2":
        return seq_miles_run_2;

    case "run_3":
        return seq_miles_run_3;

    case "run_4":
        return seq_miles_run_4;

    case "look":
        return seq_miles_look;

    case "look_end":
        return seq_miles_look_end;

    case "crouch":
        return seq_miles_crouch;

    case "crouch_end":
        return seq_miles_crouch_end;

    case "spin_dash":
        return seq_miles_spin_dash;

    case "spin_charge":
        return seq_miles_spin_charge;

    case "roll":
        return seq_miles_roll;

    case "spin_flight":
        return seq_miles_spin_flight;

    case "spin_fall":
        return seq_miles_spin_fall;

    case "brake":
        return seq_miles_brake;

    case "brake_fast":
        return seq_miles_brake_fast;

    case "hurt":
        return seq_miles_hurt;

    case "death":
        return seq_miles_death;

    case "push":
        return seq_miles_push;

    case "ramp_flight":
        return seq_miles_ramp_flight;

    case "ramp_fall":
        return seq_miles_ramp_fall;

    case "spring_flight":
        return seq_miles_spring_flight;

    case "spring_fall":
        return seq_miles_spring_fall;

    case "rail":
        return seq_miles_rail;

    case "breathe":
        return seq_miles_breathe;

    // I didn't write goal sequences lol.
    /*
    case "goal":
        return seq_miles_goal;
    
    case "goal_gold"
        return seq_miles_goal_gold;
    */
    
    case "fly":
        return seq_miles_fly;
    
    case "fly_drop":
        return seq_miles_fly_drop;
    
    case "fly_turn":
        return seq_miles_fly_turn;
    
    case "swim":
        return seq_miles_swim;
    
    case "swim_drop":
        return seq_miles_swim_drop;
    
    case "swim_turn":
        return seq_miles_swim_turn;
    
    case "fly_cancel":
        return seq_miles_fly_cancel;
    
    case "fly_hammer":
        return seq_miles_fly_hammer;
    
    case "fly_hammer_attack":
        return seq_miles_fly_hammer_attack;
    
    case "hammer":
        return seq_miles_hammer;
    
    case "tail_swipe":
        return seq_miles_tail_swipe;
    
    case "windup":
        return seq_miles_windup;
    
    case "tornado":
        return seq_miles_tornado;
    
    case "tornado_end":
        return seq_miles_tornado_end;
    
    case "dizzy":
        return seq_miles_dizzy;
    
    case "dizzy_end":
        return seq_miles_dizzy_end;
    
    case "insta":
        return seq_miles_insta;
    
    case "trick_up_flight":
        return seq_miles_trick_up_flight;
    
    case "trick_up_fall":
        return seq_miles_trick_up_fall;
    
    case "trick_down":
        return seq_miles_trick_down;
    
    case "trick_front":
        return seq_miles_trick_front;
    
    case "trick_front_fall":
        return seq_miles_trick_front_fall;
    
    case "trick_back":
        return seq_miles_trick_back;
    
    case "trick_back_fall":
        return seq_miles_trick_back_fall;
    
    case "jump_box":
        return seq_miles_jump_box;
        
    default:
        return seq_miles_stand;
}
