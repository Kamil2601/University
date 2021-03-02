fn comp(a: Vec<i64>, b: Vec<i64>) -> bool {
    let mut a_ = a.iter().map(|x| x*x).collect::<Vec<i64>>();
    a_.sort();
    let mut b_ = b.clone();
    b_.sort();

    a_ == b_
}

fn main() {
    let a1 = vec![121, 144, 19, 161, 19, 144, 19, 11];
    let a2 = vec![11*11, 11*11, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19];
    println!("{}",comp(a1,a2));
}

fn testing(a: Vec<i64>, b: Vec<i64>, exp: bool) -> () {
    assert_eq!(comp(a, b), exp)
}

#[test]
fn test1() {
    let a1 = vec![121, 144, 19, 161, 19, 144, 19, 11];
    let a2 = vec![11*21, 121*121, 144*144, 19*19, 161*161, 19*19, 144*144, 19*19];
    testing(a1, a2, false);
}

#[test]
fn test2() {

    let a1 = vec![1];
    let a2 = vec![1,2];
    testing(a1, a2, false);
}

#[test]
fn test3() {

    let a1 = vec![1,2];
    let a2 = vec![4,1];
    testing(a1, a2, true);
}

#[test]
fn test4() {

    let a1 = vec![5,10,20];
    let a2 = vec![400,100,25];
    testing(a1, a2, true);
}

#[test]
fn test5() {

    let a1 = vec![5,10,20,37];
    let a2 = vec![400,100,25];
    testing(a1, a2, false);
}

#[test]
fn test6() {

    let a1 = vec![5,10,20,37];
    let a2 = vec![400,100,25,37];
    testing(a1, a2, false);
}

#[test]
fn test7() {

    let a1 = vec![0,0,0,0,0];
    let a2 = vec![0,0,0,0,0];
    testing(a1, a2, true);
}

#[test]
fn test8() {

    let a1 = vec![0,0,0,0,0,0];
    let a2 = vec![0,0,0,0,0];
    testing(a1, a2, false);
}

#[test]
fn test9() {

    let a1 = vec![0,0,0,0,0,0];
    let a2 = vec![0,0,0,0,0,0,0,0];
    testing(a1, a2, false);
}

#[test]
fn test10() {

    let a1 = vec![1,2,3,4,5,6,7];
    let a2 = vec![49,36,25,16,9,4,1];
    testing(a1, a2, true);
}


