fn printer_error(s: &str) -> String {
    let n = s.chars().count();
    let mut errors = 0;
    for c in s.chars()
    {
        if c > 'm'
        {
           errors+=1; 
        }
    }
    return format!("{}/{}",errors.to_string(),n.to_string());
}

fn main(){

}

mod tests {
    use super::printer_error;

    #[test]
    fn test1() {
        assert_eq!(&printer_error("aaaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"), "3/56");
    }

    #[test]
    fn test2() {
        assert_eq!(&printer_error("kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyz"), "6/60");
    }

    #[test]
    fn test3() {
        assert_eq!(&printer_error("kkkwwwaaaaaaaaaaaaaabbbbbbbbbbbbbbbbbbmmmmmmmmmmmmmmmmmmmxyzuuuuu"), "11/65");
    }

    #[test]
    fn test4()
    {
        assert_eq!(&printer_error("axamx"), "2/5");
    }

    #[test]
    fn test5()
    {
        assert_eq!(&printer_error("xzmax"), "3/5");
    }
}