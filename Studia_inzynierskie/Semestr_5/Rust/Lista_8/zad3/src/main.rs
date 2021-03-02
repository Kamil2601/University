use std::char;

fn dec2_fact_string(nb: u64) -> String {
    let mut result = String::new();

    let mut n = nb;
    let mut fact : u64 = 1;
    let mut k : u64 = 1;
    let mut p : u64;
    let mut c : char;

    while n>=fact{
        k+=1;
        fact*=k;
    }
    
    while k>0
    {
        fact/=k;
        k-=1;
        p = n/fact;
        c = if p<10 {char::from_digit(p as u32,10).unwrap()} else { ((p - 10) as u8 + ('A' as u8)) as char};
        n %= fact;
        result = format!("{}{}",result,c);
    }

    return result;
}

fn fact_string_2dec(s: String) -> u64 {
    s.chars().rev().fold((0, 1, 1), |(sum,fact,pos),c|{
        let val = if c.is_numeric() {c.to_string().parse::<u64>().unwrap()}
                else {(c as u64) - ('A' as u64) + 10};
        return  (sum+val*fact,fact*pos,pos+1);
    }).0
}

fn main() {
    println!("{}",dec2_fact_string(123));
}

fn testing1(nb: u64, exp: &str) -> () {
    assert_eq!(&dec2_fact_string(nb), exp)
}

fn testing2(s: &str, exp: u64) -> () {
    assert_eq!(fact_string_2dec(s.to_string()), exp)
}

#[test]
fn test1() {

    testing1(463, "341010");
    
}

#[test]
fn test2() {

    testing1(2982, "4041000");   
}

#[test]
fn test3() {

    testing1(123, "100110");   
}

#[test]
fn test4() {

    testing1(0, "0");   
}

#[test]
fn test5() {

    testing1(1, "10");   
}

#[test]
fn test6() {
    testing2("4041000", 2982);    
}

#[test]
fn test7() {
    testing2("341010", 463);
}

#[test]
fn test8() {
    testing2("100110",123);
}

#[test]
fn test9() {
    testing2("0", 0);
}

#[test]
fn test10() {
    testing2("10", 1);
}