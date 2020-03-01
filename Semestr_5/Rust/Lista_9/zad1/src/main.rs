fn part_list(arr: Vec<&str>) -> String {
    
    let mut left : Vec<String> = vec![arr[0].to_string()];
    let mut right : Vec<String> = arr[1..].iter().map(|word| word.to_string()).collect();

    let mut result : Vec<(Vec<String>,Vec<String>)> = Vec::new();

    while !(right.is_empty()){
        result.push((left.clone(), right.clone()));
        left.push(right.remove(0));
    }

    return result
            .iter()
            .map(|(l,r)| format!("({}, {})",l.join(" "),r.join(" ")))
            .collect::<Vec<String>>().join("");
}

fn main() {
    println!("{}", part_list(vec!["I", "wish", "I", "hadn't", "come"]));
}

#[cfg(test)]
    mod tests {
    use super::*;

    fn dotest(arr: Vec<&str>, exp: &str) -> () {
        println!("arr: {:?}", arr);
        let ans = part_list(arr);
        println!("actual:\n{}", ans);
        println!("expect:\n{}", exp);
        println!("{}", ans == exp);
        assert_eq!(ans, exp);
        println!("{}", "-");
    }

    #[test]
    fn test1() {
        dotest(vec!["I", "wish", "I", "hadn't", "come"],
                "(I, wish I hadn't come)(I wish, I hadn't come)(I wish I, hadn't come)(I wish I hadn't, come)");     
    }

    #[test]
    fn test2() {
        dotest(vec!["cdIw", "tzIy", "xDu", "rThG"], 
            "(cdIw, tzIy xDu rThG)(cdIw tzIy, xDu rThG)(cdIw tzIy xDu, rThG)");
        
    }

    #[test]
    fn test3() {
        dotest(vec!["1", "2", "3"], 
            "(1, 2 3)(1 2, 3)");
        
    }

    #[test]
    fn test4() {
        dotest(vec!["a", "b"], 
            "(a, b)");
        
    }

    #[test]
    fn test5() {
        dotest(vec!["jeden", "dwa", "trzy", "cztery", "piec"], 
            "(jeden, dwa trzy cztery piec)(jeden dwa, trzy cztery piec)(jeden dwa trzy, cztery piec)(jeden dwa trzy cztery, piec)");
        
    }

    #[test]
    fn test6() {
        dotest(vec!["abc", "abc", "abc"], 
            "(abc, abc abc)(abc abc, abc)");
        
    }

    #[test]
    fn test7() {
        dotest(vec!["a, b","c, d"], 
            "(a, b, c, d)");
        
    }

    #[test]
    fn test8() {
        dotest(vec!["1", "2", "3", "4", "5", "6"], 
            "(1, 2 3 4 5 6)(1 2, 3 4 5 6)(1 2 3, 4 5 6)(1 2 3 4, 5 6)(1 2 3 4 5, 6)");
        
    }

    #[test]
    fn test9() {
        dotest(vec!["x", "y", "z"],
            "(x, y z)(x y, z)");
        
    }

    #[test]
    fn test10() {
        dotest(vec!["Dzień", "dobry"], 
            "(Dzień, dobry)");
        
    }
}