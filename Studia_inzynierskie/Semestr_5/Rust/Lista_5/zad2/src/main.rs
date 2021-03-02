fn descending_order(x: u64) -> u64 {
    let mut vec = x.to_string().chars().map(|c| c.to_digit(10).unwrap()).collect::<Vec<u32>>();
    vec.sort_by(|x,y| {y.cmp(x)});
    vec.iter().map(|x| x.to_string()).collect::<String>().parse::<u64>().unwrap()
}

fn main() {
    descending_order(123456789);
}

#[test]
fn test1() {
    assert_eq!(descending_order(0), 0);
    
}

#[test]
fn test2() {
    assert_eq!(descending_order(1), 1);
    
}

#[test]
fn test3() {
    assert_eq!(descending_order(15), 51);
    
}

#[test]
fn test4() {
    assert_eq!(descending_order(1021), 2110);
    
}

#[test]
fn test5() {
    assert_eq!(descending_order(123456789), 987654321);
    
}

#[test]
fn test6() {
    assert_eq!(descending_order(145263), 654321);
    
}

#[test]
fn test7() {
    assert_eq!(descending_order(1254859723), 9875543221);
}

#[test]
fn test8() {
    assert_eq!(descending_order(123123123123), 333322221111);
}

#[test]
fn test9() {
    assert_eq!(descending_order(1111111111), 1111111111);
}

#[test]
fn test10() {
    assert_eq!(descending_order(12131415161718111), 87654321111111111);
}