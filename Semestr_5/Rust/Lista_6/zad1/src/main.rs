fn string_to_vec(text : String) -> Vec<i32>{
    let offset = ('a' as i32) - 1;
    text.chars().map(|c| ((c as i32) - offset)).collect::<Vec<i32>>()
}

fn int_to_vec(n : i32, length : usize) -> Vec<i32>{
    let mut vec = n.to_string().chars().map(|c| c.to_string().parse::<i32>().unwrap()).collect::<Vec<i32>>();
    while vec.len() < length{
        vec.extend(vec.clone().iter());
    }
    vec[0..length].to_vec()
}

fn encode(msg: String, n: i32) -> Vec<i32> {
    let vec1 = string_to_vec(msg);
    let vec2 = int_to_vec(n,vec1.len());
    
    vec1.iter().zip(vec2).map(|(x,y)| x+y).collect::<Vec<i32>>()
}

fn main() {
    encode("abcdefghababa".to_string(),123);
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test1() {
        assert_eq!(encode("scout".to_string(), 1939), vec![20, 12, 18, 30, 21]);
    }

    #[test]
    fn test2() {
        assert_eq!(encode("scout".to_string(), 1939), vec![20, 12, 18, 30, 21]);
    }

    #[test]
    fn test3() {
        assert_eq!(encode("aaaa".to_string(), 12), vec![2, 3, 2, 3]);
    }

    #[test]
    fn test4() {
        assert_eq!(encode("abcdefgh".to_string(), 1), vec![2,3,4,5,6,7,8,9]);
    }

    #[test]
    fn test5() {
        assert_eq!(encode("abcabc".to_string(), 112), vec![2,3,5,2,3,5]);
    }

    #[test]
    fn test6() {
        assert_eq!(encode("ab".to_string(), 19), vec![2,11]);
    }

    #[test]
    fn test8() {
        assert_eq!(encode("aaaa".to_string(), 123), vec![2,3,4,2]);
    }

    #[test]
    fn test9() {
        assert_eq!(encode("cccaaacccbbb".to_string(), 111222), vec![4,4,4,3,3,3,4,4,4,4,4,4]);
    }

    #[test]
    fn test10() {
        assert_eq!(encode("acbac".to_string(), 1), vec![2,4,3,2,4]);
    }
}