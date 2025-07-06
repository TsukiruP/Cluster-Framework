/// sonic_get_sequence(animation)
/// @desc Returns a sequence.
/// @param {string} animation
/// @returns {script}

var _animation; _animation = argument0;

if (tag_leader_state == STATE_FINISH)
{
    switch (_animation)
    {
        case "stand":
            return seq_sonic_tag_stand;
        
        case "turn":
            return seq_sonic_tag_turn;
        
        case "run_0":
            return seq_sonic_tag_run_0;
        
        case "run_1":
            return seq_sonic_tag_run_1;
        
        case "run_2":
            return seq_sonic_tag_run_2;
        
        case "look":
            return seq_sonic_tag_look;
        
        case "look_end":
            return seq_sonic_tag_look_end;
        
        case "crouch":
            return seq_sonic_tag_crouch;
        
        case "crouch_end":
            return seq_sonic_tag_crouch_end;
        
        case "brake":
            return seq_sonic_tag_brake;
        
        case "spring_flight":
            return seq_sonic_tag_spring_flight;
        
        case "spring_fall":
            return seq_sonic_tag_spring_fall;
    }
}

switch (_animation)
{
    case "cliff_front":
        return seq_sonic_cliff_front;
    
    case "cliff_back":
        return seq_sonic_cliff_back;
    
    case "wait_leader":
        return seq_sonic_wait_leader;
    
    case "wait_partner":
        return seq_sonic_wait_partner;
    
    case "standby":
        return seq_sonic_standby;
    
    case "land":
        return seq_sonic_land;
    
    case "omochao":
        return seq_sonic_omochao;
    
    case "omochao_end":
        return seq_sonic_omochao_end;
    
    case "turn":
        return seq_sonic_turn;
    
    case "turn_brake":
        return seq_sonic_turn_brake;
        
    case "run_0":
        return seq_sonic_run_0;
    
    case "run_1":
        return seq_sonic_run_1;
    
    case "run_2":
        return seq_sonic_run_2;
    
    case "run_3":
        return seq_sonic_run_3;
    
    case "run_4":
        return seq_sonic_run_4;
    
    case "run_5":
        return seq_sonic_run_5;
    
    case "look":
        return seq_sonic_look;
    
    case "look_end":
        return seq_sonic_look_end;
    
    case "crouch":
        return seq_sonic_crouch;
    
    case "crouch_end":
        return seq_sonic_crouch_end;
    
    case "spin_dash":
        return seq_sonic_spin_dash;
    
    case "spin_charge":
        return seq_sonic_spin_charge;
    
    case "roll":
        return seq_sonic_roll;
    
    case "spin_flight":
        return seq_sonic_spin_flight;
    
    case "spin_fall":
        return seq_sonic_spin_fall;
    
    case "brake":
        return seq_sonic_brake;
    
    case "brake_fast":
        return seq_sonic_brake_fast;
    
    case "hurt":
        return seq_sonic_hurt;
    
    case "death":
        return seq_sonic_death;
    
    case "push":
        return seq_sonic_push;
    
    case "ramp_flight":
        return seq_sonic_ramp_flight;
    
    case "ramp_fall":
        return seq_sonic_ramp_fall;
    
    case "spring_flight":
        return seq_sonic_spring_flight;
    
    case "spring_fall":
        return seq_sonic_spring_fall;
    
    case "rail":
        return seq_sonic_rail;
    
    case "breathe":
        return seq_sonic_breathe;
    
    // I didn't write goal sequences lol.
    /*
    case "goal":
        return seq_sonic_goal;
    
    case "goal_gold"
        return seq_sonic_goal_gold;
    */
    
    case "hammer":
        return seq_sonic_hammer;
    
    case "somersault":
        return seq_sonic_somersault;
    
    case "skid":
        return seq_sonic_skid;
    
    case "skid_end":
        return seq_sonic_skid_end;
    
    case "insta":
        return seq_sonic_insta;
    
    case "air_dash":
        return seq_sonic_air_dash;
    
    case "stomp":
        return seq_sonic_stomp;
    
    case "stomp_land":
        return seq_sonic_stomp_land;
    
    case "peel_out":
        return seq_sonic_peel_out;
    
    case "trick_up_flight":
        return seq_sonic_trick_up_flight;
    
    case "trick_up_fall":
        return seq_sonic_trick_up_fall;
    
    case "trick_down":
        return seq_sonic_trick_down;
    
    case "trick_bound":
        return seq_sonic_trick_bound;
    
    case "trick_front":
        return seq_sonic_trick_front;
    
    case "trick_back":
        return seq_sonic_trick_back;
    
    case "leap_frog":
        return seq_sonic_leap_frog;
    
    case "leap_flight":
        return seq_sonic_leap_flight;
    
    case "leap_fall":
        return seq_sonic_leap_fall;
    
    case "fly_carry":
        return seq_sonic_fly_carry;
        
    default:
        return seq_sonic_stand;
}