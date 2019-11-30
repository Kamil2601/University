fn fcn(n: i32) -> i64 {
    (2 as i64).pow(n as u32)
}

fn main() {
    println!("Hello, world!");
}

fn testequal(n: i32, exp: i64) -> () {
    assert_eq!(exp, fcn(n))
}

#[test]
fn test1() {
    testequal(21, 2097152);
}

#[test]
fn test2() {
    testequal(17, 131072);
}

#[test]
fn test3() {
    testequal(3, 8);
}

#[test]
fn test4() {
    testequal(4, 16);
}

#[test]
fn test5() {
    testequal(5, 32);
}

#[test]
fn test6() {
    testequal(6, 64);
}

#[test]
fn test7() {
    testequal(7, 128);
}

#[test]
fn test8() {
    testequal(8, 256);
}

#[test]
fn test9() {
    testequal(9, 512);
}

#[test]
fn test10() {
    testequal(10, 1024);
}
