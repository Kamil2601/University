fn dig_pow(n: i64, p: i32) -> i64 {
    let digits = n.to_string().chars().map(|c| c.to_string().parse::<i64>().unwrap()).collect::<Vec<i64>>();
    let mut sum : i64 = 0;
    let mut power : u32 = p as u32;
    for d in digits{
        sum += d.pow(power) as i64;
        power+=1;
    }

    if sum%n==0 {return sum/n}
    else {return -1;}
}

fn main() {
    println!("{}",dig_pow(1,1));
}


#[cfg(test)]
    mod tests {
    use super::*;

    fn dotest(n: i64, p: i32, exp: i64) -> () {
        println!(" n: {:?};", n);
        println!("p: {:?};", p);
        let ans = dig_pow(n, p);
        println!(" actual:\n{:?};", ans);
        println!("expect:\n{:?};", exp);
        println!(" {};", ans == exp);
        assert_eq!(ans, exp);
        println!("{};", "-");
    }
    
    #[test]
    fn test1() {
        dotest(89, 1, 1);
    }

    #[test]
    fn test2() {
        dotest(92, 1, -1);
    }

    #[test]
    fn test3() {
        dotest(46288, 3, 51);
    }

    #[test]
    fn test4() {
        dotest(6, 1, 1);
    }

    #[test]
    fn test5() {
        dotest(25, 2, -1);
    }

    #[test]
    fn test6() {
        dotest(695, 2, 2);
    }

    #[test]
    fn test7() {
        dotest(32, 3, -1);
    }

    #[test]
    fn test8() {
        dotest(1,1,1);
    }

    #[test]
    fn test9() {
        dotest(2,2,2);
    }

    #[test]
    fn test10() {
        dotest(3, 3, 9);
    }
}