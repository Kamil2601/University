use std::collections::BTreeMap;

fn letter_frequency(input: &str) -> BTreeMap<char, i32> {
    let mut result : BTreeMap<char,i32> = BTreeMap::new();

    for c in input.chars(){ 
        if c.is_alphabetic(){
            if let Some(x) = result.get_mut(&(c.to_ascii_lowercase())) {
                *x += 1;
            }
            else{
                result.insert(c.to_ascii_lowercase(),1);
            }
        }
    }

    return result;
}

fn main() {
    println!("{}",'A'.to_ascii_lowercase());
}

#[cfg(test)]
mod tests {
    use std::collections::BTreeMap;
    use super::letter_frequency;
    
    #[test]
    fn test1() {
        let answer: BTreeMap<char, i32> =
        [('a', 2),
         ('c', 1),
         ('l', 1),
         ('t', 1),
         ('u', 1)]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("actual"), answer);
    }
    
    #[test]
    fn test2() {
        let answer: BTreeMap<char, i32> =
        [('a', 3),
         ('b', 2),
         ('f', 1),
         ('p', 1),
         ('s', 1),
         ('t', 2),
         ('u', 1),
         ('x', 5)]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("AaabBF UttsP xxxxx"), answer);
    }

    #[test]
    fn test3() {
        let answer: BTreeMap<char, i32> =
        [('a', 2),
         ('b', 2),
         ('c', 2),
         ('d', 2),
         ('e', 6),]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("Aa Bb Cc Dd eeEEee"), answer);
    }

    #[test]
    fn test4() {
        let answer: BTreeMap<char, i32> =
        []
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency(""), answer);
    }
    
    #[test]
    fn test5() {
        let answer: BTreeMap<char, i32> =
        []
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("123.1.3.4*###1123123"), answer);
    }

    #[test]
    fn test6() {
        let answer: BTreeMap<char, i32> =
        [('a', 3),
         ('b', 3),
         ('c', 3),
         ]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("A1A2A3B1B2B3C1C2C3"), answer);
    }

    #[test]
    fn test7() {
        let answer: BTreeMap<char, i32> =
        [('a', 2),
         ('d', 1),
         ('r', 2),
         ('t', 1),
         ('w', 1),
         ('y', 1),
         ('z', 2)
         ]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("Raz Dwa Trzy"), answer);
    }

    #[test]
    fn test8() {
        let answer: BTreeMap<char, i32> =
        [('a', 3),
         ('b', 3),
         ('c', 3),
         ]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("A1a2A3b1B2B3c1c##############C3"), answer);
    }

    #[test]
    fn test9() {
        let answer: BTreeMap<char, i32> =
        [('a', 3),
         ('b', 3),
         ('c', 3),
         ]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("abcABCabc"), answer);
    }

    #[test]
    fn test10() {
        let answer: BTreeMap<char, i32> =
        [('a', 3),
         ('b', 3),
         ('c', 3),
         ]
         .iter().cloned().collect();
         
      assert_eq!(letter_frequency("Aa a Bb b Cc c"), answer);
    }
}
