fn xo(string: &'static str) -> bool {
    string.chars().map(|x| match x{
        'x' | 'X' => 1,
        'o'| 'O' => -1,
        _ => 0,
    }).sum::<i32>() == 0
}

fn main() {
    println!("Hello, world!");
}


#[test]
fn test1() {
    assert_eq!(xo("xo"), true);

}

#[test]
fn test2() {
    assert_eq!(xo("Xo"), true);
    
}

#[test]
fn test3() {
    assert_eq!(xo("xxOo"), true);
    
}

#[test]
fn test4() {
    assert_eq!(xo("xxxm"), false);
    
}

#[test]
fn test5() {
    assert_eq!(xo("Oo"), false);
    
}

#[test]
fn test6() {
    assert_eq!(xo("ooom"), false);
}

#[test]
fn test7() {
    assert_eq!(xo("oOxXoXsdfsdfafaOxqwertyuiuy"), true);
}

#[test]
fn test8() {
    assert_eq!(xo(""), true);
}

#[test]
fn test9() {
    assert_eq!(xo("OOOOOxxxxx"), true);
}

#[test]
fn test10() {
    assert_eq!(xo("OoXxOoXxOoxqqqqqqq"), false);
}