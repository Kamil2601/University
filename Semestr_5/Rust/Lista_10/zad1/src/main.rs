fn game(n: u64) -> Vec<u64> {
    if n%2==0 {vec![n*n/2]}
    else {vec![n*n,2]}
}

fn main() {
}

fn testing(n: u64, exp: Vec<u64>) -> () {
    assert_eq!(game(n), exp)
}

#[test]
fn test1() {
    testing(204, vec![20808]);
}

#[test]
fn test2() {
    testing(807, vec![651249, 2]);
}

#[test]
fn test3() {
    testing(5014, vec![12570098]);
}

#[test]
fn test4() {
    testing(750001, vec![562501500001, 2]);
}

#[test]
fn test5() {
    testing(500, vec![125000]);
}

#[test]
fn test6() {
    testing(2, vec![2]);
}

#[test]
fn test7() {
    testing(3, vec![9,2]);
}

#[test]
fn test8() {
    testing(11, vec![121,2]);
}

#[test]
fn test9() {
    testing(2, vec![2]);
}

#[test]
fn test10() {
    testing(21, vec![441, 2]);
}