fn alphabet_position(text: &str) -> String {
    text.chars().filter(|c| c.is_alphabetic()).map(|c| {
        let p = (c.to_ascii_lowercase() as u8) - ('a' as u8) + 1;
        return format!("{}",p.to_string());        
    }).collect::<Vec<String>>().join(" ")
}

fn main() {
    println!("Hello, world!");
}


#[test]
fn test1() {
    assert_eq!(
        alphabet_position("The narwhal bacons at midnight."),
        "20 8 5 14 1 18 23 8 1 12 2 1 3 15 14 19 1 20 13 9 4 14 9 7 8 20".to_string()
    );
}

#[test]
fn test2() {
    assert_eq!(
        alphabet_position("The sunset sets at twelve o' clock."),
        "20 8 5 19 21 14 19 5 20 19 5 20 19 1 20 20 23 5 12 22 5 15 3 12 15 3 11".to_string()
    );
}


#[test]
fn test3() {
    assert_eq!(
        alphabet_position("A.B?C_D#E F^G..aaa"),
        "1 2 3 4 5 6 7 1 1 1".to_string()
    );
}

#[test]
fn test4() {
    assert_eq!(
        alphabet_position("AA cC dDDD b_B_B-b123465131843546813546813a"),
        "1 1 3 3 4 4 4 4 2 2 2 2 1".to_string()
    );
}

#[test]
fn test5() {
    assert_eq!(
        alphabet_position("123124124411"),
        "".to_string()
    );
}

#[test]
fn test6() {
    assert_eq!(
        alphabet_position("abcdefg"),
        "1 2 3 4 5 6 7".to_string()
    );
}

#[test]
fn test7() {
    assert_eq!(
        alphabet_position(""),
        "".to_string()
    );
}

#[test]
fn test8() {
    assert_eq!(
        alphabet_position("Z"),
        (('z' as u8) - ('a' as u8) + 1).to_string()
    );
}

#[test]
fn test9() {
    assert_eq!(
        alphabet_position("abc"),
        "1 2 3".to_string()
    );
}

#[test]
fn test10() {
    assert_eq!(
        alphabet_position("C_b_A"),
        "3 2 1".to_string()
    );
}