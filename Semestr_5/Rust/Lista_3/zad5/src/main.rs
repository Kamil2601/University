fn last_digit(str1: &str, str2: &str) -> i32 {  
    if str2 == "0"
    {
        return 1;
    }

    let exp : i32 = str2.chars().rev().take(2).collect::<String>().chars().rev().collect::<String>().parse::<i32>().unwrap();
    let base : i32 = str1.chars().last().unwrap().to_string().parse::<i32>().unwrap();

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

fn main() {
    //println!("{}",String::from("H").chars().rev().take(2).collect::<String>());
    println!("{}",last_digit("8", "86"));
}


#[test]
fn test1() {
    assert_eq!(last_digit("4", "1"), 4);}

#[test]
fn test2() {
    assert_eq!(last_digit("4", "2"), 6);
}

#[test]
fn test3() {
    assert_eq!(last_digit("9", "7"), 9);
}

#[test]
fn test4() {
    assert_eq!(last_digit("10","10000000000"), 0);
}

#[test]
fn test5() {
    assert_eq!(last_digit("1606938044258990275541962092341162602522202993782792835301376","2037035976334486086268445688409378161051468393665936250636140449354381299763336706183397376"), 6);
}

#[test]
fn test6() {
    assert_eq!(last_digit("3715290469715693021198967285016729344580685479654510946723", "68819615221552997273737174557165657483427362207517952651"), 7);
}

#[test]
fn test7() {
    assert_eq!(last_digit("41162602522202993782792835301376","6086268445688409378161051468393665936250636140449354381299763336706183397376"), 6);
}

#[test]
fn test8() {
    assert_eq!(last_digit("3721198967285016729344580685479654510946723", "6881963737174557165657483427362207517952651"), 7);
}

#[test]
fn test9() {
    assert_eq!(last_digit("3715290469715693045646546165465168489465165498654315616816821198967285016729344580685479654510946723", "6881961522156494984564888888552997273737174557165657483427362207517952651"), 7);
}

#[test]
fn test10() {
    assert_eq!(last_digit("0", "0"), 1);
}