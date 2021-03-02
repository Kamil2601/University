fn worth_sum(units : Vec<u32>, worth : Vec<u32>) -> u32{
    units.iter().zip(worth.iter()).fold(0,|acc,(u,w)| acc+u*w)
}

fn good_vs_evil(good: &str, evil: &str) -> String { 
    let good_units = good.split(" ").map(|x| x.parse::<u32>().unwrap()).collect::<Vec<u32>>();
    let evil_units = evil.split(" ").map(|x| x.parse::<u32>().unwrap()).collect::<Vec<u32>>();

    let good_worth : Vec<u32> = vec![1,2,3,4,4,10];
    let evil_worth : Vec<u32> = vec![1,2,2,2,3,5,10];

    let good_sum = worth_sum(good_units, good_worth);
    let evil_sum = worth_sum(evil_units, evil_worth);

    if good_sum>evil_sum{
        return "Battle Result: Good triumphs over Evil".to_string();
    }
    else if evil_sum>good_sum{
        return "Battle Result: Evil eradicates all trace of Good".to_string();
    }
    else{
        return "Battle Result: No victor on this battle field".to_string();
    }
}

fn main() {
    println!("{}", good_vs_evil("1 2 3 4 5 6", "1 2 3 4 5 6 7"));
}

#[test]
fn test1() {
    assert_eq!(good_vs_evil("0 0 0 0 0 10", "0 0 0 0 0 0 0"), "Battle Result: Good triumphs over Evil");
}

#[test]
fn test2() {
    assert_eq!(good_vs_evil("0 0 0 0 0 0", "0 0 0 0 0 0 10"), "Battle Result: Evil eradicates all trace of Good");
}

#[test]
fn test3() {
    assert_eq!(good_vs_evil("0 0 0 0 0 10", "0 0 0 0 0 0 10"), "Battle Result: No victor on this battle field");
}

#[test]
fn test4() {
    assert_eq!(good_vs_evil("1 0 0 0 0 10", "0 0 0 0 0 0 10"), "Battle Result: Good triumphs over Evil");
}

#[test]
fn test5() {
    assert_eq!(good_vs_evil("0 0 0 0 0 10", "1 0 0 0 0 0 10"), "Battle Result: Evil eradicates all trace of Good");
}

#[test]
fn test6() {
    assert_eq!(good_vs_evil("1 2 3 4 5 6", "1 2 3 4 5 6 7"), "Battle Result: Evil eradicates all trace of Good");
}

#[test]
fn test7() {
    assert_eq!(good_vs_evil("1 2 3 4 5 6", "1 2 3 4 5 6 0"), "Battle Result: Good triumphs over Evil");
}


#[test]
fn test8() {
    assert_eq!(good_vs_evil("10 0 0 0 0 10", "10 0 0 0 0 0 10"), "Battle Result: No victor on this battle field");
}


#[test]
fn test9() {
    assert_eq!(good_vs_evil("10 0 0 0 0 10", "0 5 0 0 0 0 10"), "Battle Result: No victor on this battle field");
}

#[test]
fn test10() {
    assert_eq!(good_vs_evil("0 5 0 0 0 10", "0 0 0 0 10 0 10"), "Battle Result: Evil eradicates all trace of Good");
}