fn longest(a1: &str, a2: &str) -> String {
    let mut s : Vec<char> = format!("{}{}",a1,a2).chars().collect();
    s.sort();
    s.dedup();
    s.iter().collect()
}

fn main() {
}

#[cfg(test)]
    mod tests {
    use super::*;
   
    fn testing(s1: &str, s2: &str, exp: &str) -> () {
        println!("s1:{:?} s2:{:?}", s1, s2);
        println!("{:?} {:?}", longest(s1, s2), exp);
        println!("{}", longest(s1, s2) == exp);
        assert_eq!(&longest(s1, s2), exp)
    }

    #[test]
    fn test1() {
        testing("aretheyhere", "yestheyarehere", "aehrsty");
    }

    #[test]
    fn test2() {
        testing("loopingisfunbutdangerous", "lessdangerousthancoding", "abcdefghilnoprstu"); 
    }

    #[test]
    fn test3() {
        testing("ace", "bd", "abcde");
    }

    #[test]
    fn test4() {
        testing("aaaaaaaa", "bbbbbbbbbbb", "ab");
    }

    #[test]
    fn test5() {
        testing("bbbbbccccccc", "aaaaaa", "abc");
    }

    #[test]
    fn test6() {
        testing("abcdefghijk", "abcdefghijk", "abcdefghijk");
    }

    #[test]
    fn test7() {
        testing("abcdefghijk", "abcdefghijklmn", "abcdefghijklmn");
    }

    #[test]
    fn test8() {
        testing("bcd", "a", "abcd")
    }


    #[test]
    fn test9() {
         testing("a", "a", "a")
    }

    #[test]
    fn test10() {
        testing("ghghgh", "bcbcbcbca", "abcgh")
    }
}
