fn solution(n: f64) -> f64 {
    (2.0*n).round()/2.0
}

fn main() {
    println!("Hello, world!");
}


#[cfg(test)]
mod tests {
    use super::solution;
    
    #[test]
    fn test1() {
        assert_eq!(solution(4.2), 4.0);
        
    }

    #[test]
    fn test2() {
        assert_eq!(solution(4.4), 4.5);
        
    }

    #[test]
    fn test3() {
        assert_eq!(solution(4.6), 4.5);
        
    }

    #[test]
    fn test4() {
        assert_eq!(solution(4.8), 5.0);
    }

    #[test]
    fn test5() {
        assert_eq!(solution(4.75), 5.0);
    }

    #[test]
    fn test6() {
        assert_eq!(solution(1.249999), 1.0);
    }

    #[test]
    fn test7() {
        assert_eq!(solution(4.0), 4.0);
    }

    #[test]
    fn test8() {
        assert_eq!(solution(4.5), 4.5);
    }

    #[test]
    fn test9() {
        assert_eq!(solution(2.500000), 2.5);
    }

    #[test]
    fn test10() {
        assert_eq!(solution(1.1234567), 1.0);
    }
}