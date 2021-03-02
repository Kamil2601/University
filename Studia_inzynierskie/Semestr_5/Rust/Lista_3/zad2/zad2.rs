fn number(bus_stops:&[(i32,i32)]) -> i32 {
    bus_stops.iter().map(|(x,y) : &(i32, i32) | {x-y}).sum()
}

fn main(){

}

mod tests {

    use super::*;

    #[test]
    fn test1() {
    assert_eq!(number(&[(10,0),(3,5),(5,8)]), 5);
    }

    #[test]
    fn test2() {
    assert_eq!(number(&[(3,0),(9,1),(4,10),(12,2),(6,1),(7,10)]), 17);
    }

    #[test]
    fn test3() {
    assert_eq!(number(&[(3,0),(9,1),(4,8),(12,2),(6,1),(7,8)]), 21);
    }

    #[test]
    fn test4() {
    assert_eq!(number(&[(0,0),(0,0),(1,0),(0,1)]), 0);
    }

    #[test]
    fn test5() {
    assert_eq!(number(&[(5,0),(5,1)]), 9);
    }

    #[test]
    fn test6() {
    assert_eq!(number(&[(5,0),(5,2)]), 8);
    }

    #[test]
    fn test7() {
    assert_eq!(number(&[(1,0),(1,0),(1,0)]), 3);
    }

    #[test]
    fn test8() {
    assert_eq!(number(&[(10,0),(0,5)]), 5);
    }

    #[test]
    fn test9() {
    assert_eq!(number(&[(10,0),(0,10),(10,0)]), 10);
    }

    #[test]
    fn test10() {
    assert_eq!(number(&[(2,1),(1,2)]), 0);
    }

}