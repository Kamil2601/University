use std::collections::HashMap;

fn stock_list(list_art: Vec<&str>, list_cat: Vec<&str>) -> String {
    if list_art.len()==0{
        return "".to_string();
    }

    let mut sums : HashMap<char, u32> = HashMap::new();

    for cat in list_cat.iter(){
        sums.insert(cat.chars().next().unwrap(), 0);
    }

    for book in list_art{
        let v = book.split(" ").map(|x| x.to_string()).collect::<Vec<String>>();

        let cat : char = v[0].clone().chars().next().unwrap();
        let val : u32 = v[1].clone().parse::<u32>().unwrap();

        if sums.contains_key(&cat){
            *sums.get_mut(&cat).unwrap() += val
        }
    }

    let mut result : Vec<String> = Vec::new();

    for cat in list_cat.iter(){
        result.push(format!("({} : {})",cat, sums.get(&cat.chars().next().unwrap()).unwrap()));
    }

    return result.join(" - ");
}

fn main() {
    let b = vec!["BBAR 150", "CDXE 515", "BKWR 250", "BTSQ 890", "DRTY 600"];
    let c = vec!["A", "B", "C", "D"];
    println!("{}",stock_list(b, c));
}

#[cfg(test)]
    mod tests {
    use super::*;

    fn dotest(list_art: Vec<&str>, list_cat: Vec<&str>, exp: &str) -> () {
        println!("list_art: {:?};", list_art);
        println!("list_cat: {:?};", list_cat);
        let ans = stock_list(list_art, list_cat);
        println!("actual:\n{:?};", ans);
        println!("expect:\n{:?};", exp);
        println!("{};", ans == exp);
        assert_eq!(ans, exp);
        println!("{};", "-");
    }

    #[test]
    fn test1() {
        let b = vec!["BBAR 150", "CDXE 515", "BKWR 250", "BTSQ 890", "DRTY 600"];
        let c = vec!["A", "B", "C", "D"];
        dotest(b, c, "(A : 0) - (B : 1290) - (C : 515) - (D : 600)");
    }

    #[test]
    fn test2() {
        let b = vec!["ABAR 100", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"];
        let c = vec!["A", "B"];
        dotest(b, c, "(A : 100) - (B : 1140)");
    }

    #[test]
    fn test3() {
        let b = vec!["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"];
        let c = vec!["A", "B", "C"];
        dotest(b, c, "(A : 200) - (B : 1140) - (C : 500)");
    }

    #[test]
    fn test4() {
        let b = vec!["BBAR 150", "CDXE 515", "BKWR 250", "BTSQ 890", "DRTY 600"];
        let c = vec!["A", "B", "C", "D"];
        dotest(b, c, "(A : 0) - (B : 1290) - (C : 515) - (D : 600)");
    }

    #[test]
    fn test5() {
        let b = vec!["ABAR 200", "CDXE 500", "BKWR 250", "BTSQ 890", "DRTY 600"];
        let c = vec!["A", "B"];
        dotest(b, c, "(A : 200) - (B : 1140)");
    }

    #[test]
    fn test6() {
        let b = vec!["CBART 20", "CDXEF 50", "BKWRK 25", "BTSQZ 89", "DRTYM 60"];
        let c = vec!["A", "B", "C", "W"];
        dotest(b, c, "(A : 0) - (B : 114) - (C : 70) - (W : 0)");
    }

    #[test]
    fn test7() {
        let b = vec!["ROXANNE 102", "RHODODE 123", "BKWRKAA 125", "BTSQZFG 239", "DRTYMKH 060"];
        let c = vec!["B", "R", "D", "X"];
        dotest(b, c, "(B : 364) - (R : 225) - (D : 60) - (X : 0)");
    }

    #[test]
    fn test8() {
        let b = vec![];
        let c = vec!["A", "B"];
        dotest(b, c, "");
    }

    #[test]
    fn test9() {
        let b = vec!["ABAR 200"];
        let c = vec!["A", "B"];
        dotest(b, c, "(A : 200) - (B : 0)");
    }

    #[test]
    fn test10() {
        let b = vec!["ABAR 200", "CDXE 500"];
        let c = vec!["A", "B"];
        dotest(b, c, "(A : 200) - (B : 0)");
    }
}

