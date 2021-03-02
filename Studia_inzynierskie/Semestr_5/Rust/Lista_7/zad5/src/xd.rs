fn pow_mod4(a: u64, b_mod_4: u64, zero_or_one: u64) -> u64 {
    match a % 4 {
        0 => match zero_or_one {
            0 => 1,
            _ => 0,
        },
        1 => 1,
        2 =>{ println!("test");
            match zero_or_one {
            0 => 1,
            1 => 2,
            _ => 0,
        }},

        _ => match b_mod_4 {
            1 => 3,
            _ => 1,
        },
    }
}

fn last_digit_aux(base: u64, exp: u64, zero_or_one : u64) -> u64 {

    match zero_or_one{
        0 => {println!("Tu");
            return 1;},
        _ => ()
    }

    match base{
        0 | 1 | 5 | 6 => base,
        2 => [6,2,4,8][(exp%4) as usize],
        3 => [1,3,9,7][(exp%4) as usize],
        4 => [6,4][(exp%2) as usize],
        7 => [1,7,9,3][(exp%4) as usize],
        8 => [6,8,4,2][(exp%4) as usize],
        _ => [1,9][(exp%2) as usize],
    }        
}

fn last_digit(lst: &[u64]) -> u64 {
    if lst.len() == 0 {
        return 1;
    } else if lst.len() == 1 {
        return lst[0] % 10;
    } else if lst.len() == 2{
        return last_digit_aux(lst[0]%10, lst[1]%4, lst[1]);
    } else {
        let mut pow = lst[lst.len() - 1] % 4;
        let mut zero_or_one : u64 = lst[lst.len() - 1];
        for &k in lst[1..lst.len()-1].iter().rev(){
            println!("{} {} {}",k, pow, zero_or_one);
            pow = pow_mod4(k, pow, zero_or_one);
            println!("{}",pow);
            
            if zero_or_one == 0 || k==1{
                zero_or_one = 1;
            }
            else if k==0 && zero_or_one!=0{
                zero_or_one = 0;
            }
            else{
                zero_or_one = 2;
            }
        }
        println!("{} {} {}",lst[0],pow,zero_or_one);
        return last_digit_aux(lst[0]%100, pow, zero_or_one)%10;
    }

}
