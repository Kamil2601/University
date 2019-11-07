fn row_sum_odd_numbers(n:i64) -> i64 {
    n*n*n
}

fn main(){
    
}

mod tests {

    use super::*;

    #[test]
    fn test1(){
        assert_eq!(row_sum_odd_numbers(1),1);
    }

    #[test]
    fn test2(){
        assert_eq!(row_sum_odd_numbers(2),2*2*2);
    }
    #[test]
    fn test3(){
        assert_eq!(row_sum_odd_numbers(3),3*3*3);
    }
    #[test]
    fn test4(){
        assert_eq!(row_sum_odd_numbers(4),4*4*4);
    }
    #[test]
    fn test5(){
        assert_eq!(row_sum_odd_numbers(5),5*5*5);
    }
    #[test]
    fn test6(){
        assert_eq!(row_sum_odd_numbers(6),6*6*6);
    }

    #[test]
    fn test7(){
        assert_eq!(row_sum_odd_numbers(7),7*7*7);
    }
    #[test]
    fn test8(){
        assert_eq!(row_sum_odd_numbers(8),8*8*8);
    }
    #[test]
    fn test9(){
        assert_eq!(row_sum_odd_numbers(9),9*9*9);
    }
    #[test]
    fn test10(){
        assert_eq!(row_sum_odd_numbers(10),1000);
    }

}