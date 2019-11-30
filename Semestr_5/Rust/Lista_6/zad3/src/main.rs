fn line(i : i32, n : i32) -> String{
    format!("{}{}"," ".repeat((n/2-i+1) as usize), "*".repeat((2*i-1) as usize))
}

fn print(n: i32) -> Option<String> {
    
    if n>0 && n%2==1{
        let mut result = String::new();
        for i in (1..(n/2+2)).chain((1..n/2+1).rev()){
            result = format!("{}{}\n",result,line(i,n));
        }
        // for i in (1..n/2+1).rev(){
        //     result = format!("{}{}\n",result,line(i,n));
        // }
        return Some(result);
    }
    else{
        return None
    }
}

fn main() {
    println!("Hello, world!");
}

#[test]
fn test1() {
    assert_eq!(print(3), Some(" *\n***\n *\n".to_string()) );
}

#[test]
fn test2() {
    assert_eq!(print(5), Some("  *\n ***\n*****\n ***\n  *\n".to_string()) );
}

#[test]
fn test3() {
    assert_eq!(print(-3),None);
}

#[test]
fn test4() {
    assert_eq!(print(2),None);
}

#[test]
fn test5() {
    assert_eq!(print(0),None);
}

#[test]
fn test6() {
    assert_eq!(print(1), Some("*\n".to_string()) );
}

#[test]
fn test7() {
    assert_eq!(print(6), None);
}

#[test]
fn test8() {
    assert_eq!(print(7), Some("   *\n  ***\n *****\n*******\n *****\n  ***\n   *\n".to_string()) );
}

#[test]
fn test9() {
    assert_eq!(print(18), None);
}

#[test]
fn test10() {
    assert_eq!(print(9), Some("    *\n   ***\n  *****\n *******\n*********\n *******\n  *****\n   ***\n    *\n".to_string()) );
}
