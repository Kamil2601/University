fn order(sentence: &str) -> String {
    let mut result : Vec<String> = vec![String::new(); 10 as usize];
    for word in sentence.split(" "){
        match word.chars().find(|x| x.is_numeric()){
            Some(index) => result[index.to_string().parse::<usize>().unwrap()] = word.to_string(),
            _ => ()
        }
    }

    return result.iter().filter(|x| x.len()>0)
                .map(|x| x.to_string())
                .collect::<Vec<String>>().join(" ");
}

fn main() {
    println!("{}",order(" "));
}

#[cfg(test)]
mod tests {
    use super::*;
    #[test]
    fn test1() {
        assert_eq!(order("is2 Thi1s T4est 3a"), "Thi1s is2 3a T4est");
    }

    #[test]
    fn test2() {
        assert_eq!(order("2 3 4 1 "), "1 2 3 4");
    }

    #[test]
    fn test3() {
        assert_eq!(order("Ra2z D1wa Tr4zy Czt3ery"), "D1wa Ra2z Czt3ery Tr4zy");
    }

    #[test]
    fn test4() {
        assert_eq!(order("a1 b2 c3 d4"), "a1 b2 c3 d4");
    }

    #[test]
    fn test5() {
        assert_eq!(order("2 3 4"), "2 3 4");
    }

    #[test]
    fn test6() {
        assert_eq!(order("A2A B1B"), "B1B A2A");
    }

    #[test]
    fn test7() {
        assert_eq!(order("A2A B1B C3C"), "B1B A2A C3C");
    }

    #[test]
    fn test8() {
        assert_eq!(order("test1 test3 test2 test4"), "test1 test2 test3 test4");
    }

    #[test]
    fn test9() {
        assert_eq!(order("xd1"), "xd1");
    }

    #[test]
    fn test10() {
        assert_eq!(order("1dx"), "1dx");
    }
}
