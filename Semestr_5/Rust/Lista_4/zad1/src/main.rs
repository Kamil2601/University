fn find_digit(num: i32, nth: i32) -> i32 {
    if nth<=0{
        return -1;
    }
    let mut n = num.abs();
    for i in 0..nth-1{
        n/=10;
    }
    n%10
}

fn main() {
    println!("{}\n",find_digit(987654321,3))
}


#[test]
fn test1() {
    assert_eq!(find_digit(5673, 4), 5);
}

#[test]
fn test2() {
    assert_eq!(find_digit(129, 2), 2);
}


#[test]
fn test3() {
    assert_eq!(find_digit(-2825, 3), 8);
}


#[test]
fn test4() {
    assert_eq!(find_digit(-456, 4), 0);
}


#[test]
fn test5() {
    assert_eq!(find_digit(0, 20), 0);
}


#[test]
fn test6() {
    assert_eq!(find_digit(65, 0), -1);
}


#[test]
fn test7() {
    assert_eq!(find_digit(24, -8), -1);
}

#[test]
fn test8() {
    assert_eq!(find_digit(987654321, 4), 4);
}

#[test]
fn test9() {
    assert_eq!(find_digit(-987654321, 4), 4);
}

#[test]
fn test10() {
    assert_eq!(find_digit(-987654321, 9), 9);
}

