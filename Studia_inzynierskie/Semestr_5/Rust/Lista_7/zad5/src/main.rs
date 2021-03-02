
fn last_digit(lst: &[u64]) -> u64 {
    lst.iter().rev().fold(1,|acc, &val| {
        let a : u64 = if val < 20 {val} else {val % 20 + 20};
        let b : u64 = if acc < 4 {acc} else {acc % 4 + 4};
        return a.pow(b as u32) as u64;
    }) % 10
}

fn main() {
    println!("{}", last_digit(&vec![0,0,0,0]));
}

mod tests {
    use super::*;
    #[test]
    fn test1() {
        assert_eq!(last_digit(&vec![0, 0]), 1);
    }

    #[test]
    fn test2() {
        assert_eq!(last_digit(&vec![]), 1);
    }

    #[test]
    fn test3() {
        assert_eq!(last_digit(&vec![0, 0, 0]), 0);
    }

    #[test]
    fn test4() {
        assert_eq!(last_digit(&vec![1, 2]), 1);
    }

    #[test]
    fn test5() {
        assert_eq!(last_digit(&vec![3, 4, 5]), 1);
    }

    #[test]
    fn test6() {
        assert_eq!(last_digit(&vec![4, 3, 6]), 4);
    }

    #[test]
    fn test7() {
        assert_eq!(last_digit(&vec![7, 6, 21]), 1);
    }

    #[test]
    fn test8() {
        assert_eq!(last_digit(&vec![12, 30, 21]), 6);
    }

    #[test]
    fn test9() {
        assert_eq!(last_digit(&vec![2, 2, 2, 0]), 4);
    }

    #[test]
    fn test10() {
        assert_eq!(last_digit(&vec![937640, 767456, 981242]), 0);
    }

    #[test]
    fn test11() {
        assert_eq!(last_digit(&vec![123232, 694022, 140249]), 6);
    }

    #[test]
    fn test12() {
        assert_eq!(last_digit(&vec![123232, 694022, 140249]), 6);
    }


    
}
