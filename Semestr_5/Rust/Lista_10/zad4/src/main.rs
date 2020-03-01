use regex::Regex;

fn change(s: &str, prog: &str, version: &str) -> String {
    let mut data : Vec<String> = s.split("\n").map(|x| x.clone().to_string()).collect();

    data.pop();
    data.remove(2);
    data[3] = "Date: 2019-01-01".to_string();
    data[0] = format!("Program: {}", prog.to_string());
    data[1] = "Author: g964".to_string();

    let phone = data[2].split(" ").collect::<Vec<&str>>()[1];
    let old_version = data[4].split(" ").collect::<Vec<&str>>()[1];

    let phone_regex = Regex::new(r"^[+]1[-]\d{3}[-]\d{3}[-]\d{4}$").unwrap();
    let version_regex = Regex::new(r"^\d+[.]\d+$").unwrap();


    if !phone_regex.is_match(phone) || !version_regex.is_match(old_version){
        return "ERROR: VERSION or PHONE".to_string();
    }

    if data[4] != "Version: 2.0"{
        data[4] =  format!("Version: {}", version);
    }

    data[2] = "Phone: +1-503-555-0090".to_string();

    return data.join(" ");
}

fn main() {
    let s1="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0091\nDate: Tues April 9, 2005\nVersion: 6.7.5\nLevel: Alpha";
    change(s1, "Ladder", "1.1");
}

#[cfg(test)]
    mod tests {
    use super::*;
   
    fn dotest(s: &str, prog: &str, version: &str, exp: &str) -> () {
        println!("s:{:?}", s);
        println!("prog:{:?}", prog);
        println!("version:{:?}", version);
        let ans = change(s, prog, version);
        println!("actual: {:?}", ans);
        println!("expect: {:?}", exp);
        println!("{}", ans == exp);
        assert_eq!(ans, exp);
        println!("{}", "-");
    }    
      

    #[test]
    fn test1() {
        let s1="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0091\nDate: Tues April 9, 2005\nVersion: 6.7\nLevel: Alpha";
        dotest(s1, "Ladder", "1.1", "Program: Ladder Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 1.1");
    }

    #[test]
    fn test2() {
        let s2="Program title: Balance\nAuthor: Dorries\nCorporation: Funny\nPhone: +1-503-555-0095\nDate: Tues July 19, 2014\nVersion: 6.7\nLevel: Release";
        dotest(s2, "Circular", "1.5", "Program: Circular Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 1.5");        
    } 
    #[test]
    fn test3() {      
        let s3="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0090\nDate: Tues April 9, 2005\nVersion: 67\nLevel: Alpha";
        dotest(s3, "Ladder", "1.1", "ERROR: VERSION or PHONE");
    }

    #[test]
    fn test4() {      
        let s="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0091\nDate: Tues April 9, 2005\nVersion: 6.7\nLevel: Alpha";
        dotest(s, "Ladder", "1.1", "Program: Ladder Author: g964 Phone: +1-503-555-0090 Date: 2019-01-01 Version: 1.1");
    }

    #[test]
    fn test5() {      
        let s="Program title: Wood\nAuthor: Stan\nCorporation: IB\nPhone: +1-503-555-0092\nDate: Tues March 29, 2017\nVersion: 1.5.6\nLevel: Alpha";
        dotest(s, "Balance", "0.3", "ERROR: VERSION or PHONE");
    }

    #[test]
    fn test6() {      
        let s="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0090\nDate: Tues April 9, 2005\nVersion: 67\nLevel: Alpha";
        dotest(s, "Ladder", "1.1", "ERROR: VERSION or PHONE");
    }

    #[test]
    fn test7() {      
        let s="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0090\nDate: Tues April 9, 2005\nVersion: 67\nLevel: Alpha";
        dotest(s, "Ladder", "1.1", "ERROR: VERSION or PHONE");
    }

    #[test]
    fn test8() {      
        let s="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0090\nDate: Tues April 9, 2005\nVersion: 67\nLevel: Alpha";
        dotest(s, "Ladder", "1.1", "ERROR: VERSION or PHONE");
    }

    #[test]
    fn test9() {      
        let s="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0090\nDate: Tues April 9, 2005\nVersion: 67\nLevel: Alpha";
        dotest(s, "Ladder", "1.1", "ERROR: VERSION or PHONE");
    }

    #[test]
    fn test10() {      
        let s="Program title: Primes\nAuthor: Kern\nCorporation: Gold\nPhone: +1-503-555-0090\nDate: Tues April 9, 2005\nVersion: 67\nLevel: Alpha";
        dotest(s, "Ladder", "1.1", "ERROR: VERSION or PHONE");
    }
}