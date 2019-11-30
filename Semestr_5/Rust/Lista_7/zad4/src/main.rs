fn john_ann(n: i32) -> (Vec<i32>,Vec<i32>){
    let mut john : Vec<i32> = vec![0];
    let mut ann : Vec<i32> = vec![1];

    for i in 1..n{
        john.push(i-ann[john[i as usize -1] as usize]);
        ann.push(i-john[ann[i as usize -1] as usize]);
    }

    return (john, ann);
}

fn john(n: i32) -> Vec<i32> {
    john_ann(n).0
}
fn ann(n: i32) -> Vec<i32> {
    john_ann(n).1
}
fn sum_john(n: i32) -> i32 {
    john(n).iter().sum()
}
fn sum_ann(n: i32) -> i32 {
    ann(n).iter().sum()
}

fn main() {
    let (j,a) = john_ann(10);
    
    for x in j.iter(){
        print!("{} ",x);
    }

    print!("\n");

    for x in a.iter(){
        print!("{} ",x);
    }

    print!("\n");
}

fn test_john(n: i32, exp: Vec<i32>) -> () {
    assert_eq!(john(n), exp)
}
fn test_ann(n: i32, exp: Vec<i32>) -> () {
    assert_eq!(ann(n), exp)
}
fn test_sum_john(n: i32, exp: i32) -> () {
    assert_eq!(sum_john(n), exp)
}
fn test_sum_ann(n: i32, exp: i32) -> () {
    assert_eq!(sum_ann(n), exp)
}


#[test]
fn test1() {
    test_john(11, vec![0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6]);
}

#[test]
fn test2() {
    test_john(14, vec![0, 0, 1, 2, 2, 3, 4, 4, 5, 6, 6, 7, 7, 8]);
}

#[test]
fn test3() {
    test_ann(6, vec![1, 1, 2, 2, 3, 3]);
}

#[test]
fn test4() {
    test_ann(15, vec![1, 1, 2, 2, 3, 3, 4, 5, 5, 6, 6, 7, 8, 8, 9]);
}

#[test]
fn test5() {
    test_sum_john(75, 1720);
}

#[test]
fn test6() {
    test_sum_john(78, 1861);
}
#[test]
fn test7() {
    test_sum_ann(115, 4070);
}

#[test]
fn test8() {
    test_sum_ann(150, 6930);
}

#[test]
fn test9() {
    test_john(2, vec![0,0]);
}

#[test]
fn test10() {
    test_ann(2, vec![1,1]);
}