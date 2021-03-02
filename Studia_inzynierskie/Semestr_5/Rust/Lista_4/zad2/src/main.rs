fn even_numbers(array: &Vec<i32>, number: usize) -> Vec<i32> {
    let temp : Vec<i32> = array.iter().cloned().filter(|&x| x%2==0).collect();
    temp[(temp.len()-number) ..].to_vec()
}

fn main() {
    
}

#[test]
fn test1() {
    assert_eq!(even_numbers(&vec!(1, 2, 3, 4, 5, 6, 7, 8, 9), 3), vec!(4, 6, 8));
    assert_eq!(even_numbers(&vec!(-22, 5, 3, 11, 26, -6, -7, -8, -9, -8, 26), 2), vec!(-8, 26));
    assert_eq!(even_numbers(&vec!(6, -25, 3, 7, 5, 5, 7, -3, 23), 1), vec!(6));
}

#[test]
fn test2() {
    assert_eq!(even_numbers(&vec!(-22, 5, 3, 11, 26, -6, -7, -8, -9, -8, 26), 2), vec!(-8, 26));
}

#[test]
fn test3() {
    assert_eq!(even_numbers(&vec!(6, -25, 3, 7, 5, 5, 7, -3, 23), 1), vec!(6));
}

#[test]
fn test4() {
    assert_eq!(even_numbers(&vec!(3, 7, 5, 5, 7,-2, -3, 23), 1), vec!(-2));
}

#[test]
fn test5() {
    assert_eq!(even_numbers(&vec!(6, -25, 3, 7, 5, 5, 7, -3, 23), 1), vec!(6));
}

#[test]
fn test6() {
    assert_eq!(even_numbers(&vec!(6, -25, 3, 7, 5, 5, 7, -3, 23), 1), vec!(6));
}

#[test]
fn test7() {
    assert_eq!(even_numbers(&vec!(1,2,3,4,5,6,7,8,9,10,11), 3), vec!(6,8,10));
}

#[test]
fn test8() {
    assert_eq!(even_numbers(&vec!(2,4,6,8,10,12), 4), vec!(6,8,10,12));
}

#[test]
fn test9() {
    assert_eq!(even_numbers(&vec!(1,3,5,7,9,2,4,6,2), 4), vec!(2,4,6,2));
}

#[test]
fn test10() {
    assert_eq!(even_numbers(&vec!(1,3,5,7,9,0,0,0,0,0), 4), vec!(0,0,0,0));
}