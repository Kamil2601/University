fn dont_give_me_five(start: isize, end: isize) -> isize {
    (start..end + 1)
        .filter(|x| !x.to_string().contains('5'))
        .count() as isize
}


fn main() {
    println!("{}", dont_give_me_five(1, 9));
}

#[cfg(test)]
mod tests {
    use super::dont_give_me_five;

    #[test]
    fn test1() {
        assert_eq!(dont_give_me_five(1, 9), 8);
    }

    #[test]
    fn test2() {
        assert_eq!(dont_give_me_five(4, 17), 12);
    }

    #[test]
    fn test3() {
        assert_eq!(dont_give_me_five(1, 1), 1);
    }

    #[test]
    fn test4() {
        assert_eq!(dont_give_me_five(5, 5), 0);
    }

    #[test]
    fn test5() {
        assert_eq!(dont_give_me_five(5, 6), 1);
    }

    #[test]
    fn test6() {
        assert_eq!(dont_give_me_five(1, 10), 9);
    }

    #[test]
    fn test7() {
        assert_eq!(dont_give_me_five(10, 30), 19);
    }

    #[test]
    fn test8() {
        assert_eq!(dont_give_me_five(40, 60), 10);
    }

    #[test]
    fn test9() {
        assert_eq!(dont_give_me_five(1, 2), 2);
    }

    #[test]
    fn test10() {
        assert_eq!(dont_give_me_five(3, 7), 4);
    }
}
