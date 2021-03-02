fn summy(strng: &str) -> i32 {
    strng.split(" ").map(|s| s.parse::<i32>().unwrap()).sum()
}

fn main() {
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test1() {
        assert_eq!(summy("1 2 3"), 6);
    }

    #[test]
    fn test2() {
        assert_eq!(summy("1 2 3 4"), 10);
       
    }

    #[test]
    fn test3() {
        assert_eq!(summy("1 2 3 4 5"), 15);
        
    }

    #[test]
    fn test4() {
        assert_eq!(summy("10 10"), 20);
        
    }

    #[test]
    fn test5() {
        assert_eq!(summy("0 0"), 0);
    }

    #[test]
    fn test6() {
        assert_eq!(summy("1 1 1 1 -1 -1 -1"), 1);
    }

    #[test]
    fn test7() {
        assert_eq!(summy("0 3 2 1"), 6);
    }

    #[test]
    fn test8() {
        assert_eq!(summy("-1 1 2 3 -2 3"), 6);
    }

    #[test]
    fn test9() {
        assert_eq!(summy("-1 1 2 3 -2 3 0 0 0 0 1"), 7);
    }

    #[test]
    fn test10() {
        assert_eq!(summy("8 -1 1 -2 1"), 7);
    }
}
