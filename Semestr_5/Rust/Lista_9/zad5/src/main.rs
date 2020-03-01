mod solution {
    
    pub fn range_extraction(a: &[i32]) -> String {
        let mut prev = a[0];
        let mut range = 1;
        let mut result : Vec<String> = Vec::new();
        let arr : Vec<i32> = [a[1..].to_owned(),a[0..1].to_owned()].concat();
        
        for i in arr{
            if i == prev+1{
                range+=1;
            }
            else{
                match range{
                    1 => result.push(format!("{}",prev)),
                    2 => result.push(format!("{},{}",prev-1,prev)),
                    _ => result.push(format!("{}-{}",prev-range+1,prev))
                }
                range = 1;
            }
            prev = i;
        }
        return result.join(",");
    }
}

fn main() {
    println!("{}",solution::range_extraction(&[-3,-2,-1,2,10,15,16,18,19,20]));
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test1() {
        assert_eq!("-6,-3-1,3-5,7-11,14,15,17-20", solution::range_extraction(&[-6,-3,-2,-1,0,1,3,4,5,7,8,9,10,11,14,15,17,18,19,20]));	
    }

    #[test]
    fn test2() {
        assert_eq!("-3--1,2,10,15,16,18-20", solution::range_extraction(&[-3,-2,-1,2,10,15,16,18,19,20]));
    }

    #[test]
    fn test3() {
        assert_eq!("1-10", solution::range_extraction(&[1,2,3,4,5,6,7,8,9,10]));
    }

    #[test]
    fn test4() {
        assert_eq!("-2,-1,1,2,4,5", solution::range_extraction(&[-2,-1,1,2,4,5]));
    }

    #[test]
    fn test5() {
        assert_eq!("-6-0,2-7", solution::range_extraction(&[-6,-5,-4,-3,-2,-1,0,2,3,4,5,6,7]));
    }

    #[test]
    fn test6() {
        assert_eq!("0,2,4", solution::range_extraction(&[0,2,4]));
    }

    #[test]
    fn test7() {
        assert_eq!("-5-5", solution::range_extraction(&[-5,-4,-3,-2,-1,0,1,2,3,4,5]));
    }

    #[test]
    fn test8() {
        assert_eq!("1-3,5-7,9-11", solution::range_extraction(&[1,2,3,5,6,7,9,10,11]));
    }

    #[test]
    fn test9() {
        assert_eq!("1", solution::range_extraction(&[1]));
    }

    #[test]
    fn test10() {
        assert_eq!("1,2", solution::range_extraction(&[1,2]));
    }
}