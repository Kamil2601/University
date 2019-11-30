fn dbl_linear(n: u32) -> u32{
    let mut i : usize = 0;
    let mut j : usize = 0;
    let mut sequence : Vec<u32> = [1].to_vec();
    for k in 0..n{
        let a = 2*sequence[i]+1;
        let b = 3*sequence[j]+1;
        if a<=b{
            sequence.push(a);
            i+=1;
            if a==b {j+=1}
        } else{
            sequence.push(b);
            j+=1;
        }        
    }

    return sequence[n as usize];
}

fn main() {
    for i in 6..11{
        println!("#[test]");
        println!("fn test{}() {}",i,'{');
        println!("    testing({}, {})",20+i,dbl_linear(20+i));
        println!("{}",'}');
    }
}


#[cfg(test)]
mod tests {
    use super::dbl_linear;
    fn testing(n: u32, exp: u32) -> () {
        assert_eq!(dbl_linear(n), exp)
    }
    
    #[test]
    fn test1() {
        testing(10, 22);
    }

    #[test]
    fn test2() {
        testing(20, 57);
    }

    #[test]
    fn test3() {
        testing(30, 91);
    }

    #[test]
    fn test4() {
        testing(50, 175);
    }

    #[test]
    fn test5() {
        testing(100, 447);
    }

    #[test]
    fn test6() {
        testing(26, 81)
    }
    #[test]
    fn test7() {
        testing(27, 82)
    }
    #[test]
    fn test8() {
        testing(28, 85)
    }
    #[test]
    fn test9() {
        testing(29, 87)
    }
    #[test]
    fn test10() {
        testing(30, 91)
    }   
}
