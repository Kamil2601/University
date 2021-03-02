pub fn highlight(code: &str) -> String {
    let mut span : String = String::new();
    let mut last : char = '.';
    let mut result : String = String::new();
    for c in format!("{}.",code).chars(){
        if c == last || (last.is_numeric() && c.is_numeric()){
            span = format!("{}{}",span,c.to_string());
        }
        else
        {
            match last{
                'F' => result = format!("{}<span style=\"color: pink\">{}</span>",result,span),
                'L' => result = format!("{}<span style=\"color: red\">{}</span>",result,span),
                'R' => result = format!("{}<span style=\"color: green\">{}</span>",result,span),
                '0'|'1'|'2'|'3'|'4'|'5'|'6'|'7'|'8'|'9' => result = format!("{}<span style=\"color: orange\">{}</span>",result,span),
                _ => result = format!("{}{}",result,span)
            }
            span = c.to_string();
        }
        last = c;
    }
    return result;
}

fn main() {
    println!("{}",highlight("F000112345(FL"));
}


#[cfg(test)]
mod tests {
    use super::*;

    #[cfg(test)]
    macro_rules! assert_highlight {
        ($code:expr , $expected:expr $(,)*) => {{
            let actual = highlight($code);
            let expected = $expected;
            println!("Code without syntax highlighting: {}", $code);
            println!("Your code with syntax highlighting: {}", actual);
            println!("Expected syntax highlighting: {}", expected);
            assert_eq!(actual, expected);
        }};
    }

    #[test]
    fn test1() {
        assert_highlight!(
            "F3RF5LF7",
            r#"<span style="color: pink">F</span><span style="color: orange">3</span><span style="color: green">R</span><span style="color: pink">F</span><span style="color: orange">5</span><span style="color: red">L</span><span style="color: pink">F</span><span style="color: orange">7</span>"#,
        );
    }
    
    #[test]
    fn test2(){
        assert_highlight!(
            "FFFR345F2LL",
            r#"<span style="color: pink">FFF</span><span style="color: green">R</span><span style="color: orange">345</span><span style="color: pink">F</span><span style="color: orange">2</span><span style="color: red">LL</span>"#,
        );
    }

    #[test]
    fn test3() {
        assert_highlight!(
            "F3RF5LF7)))))",
            r#"<span style="color: pink">F</span><span style="color: orange">3</span><span style="color: green">R</span><span style="color: pink">F</span><span style="color: orange">5</span><span style="color: red">L</span><span style="color: pink">F</span><span style="color: orange">7</span>)))))"#,
        );
    }
    
    #[test]
    fn test4() {
        assert_highlight!(
            "FFFR345F2LL()()()()()()()()",
            r#"<span style="color: pink">FFF</span><span style="color: green">R</span><span style="color: orange">345</span><span style="color: pink">F</span><span style="color: orange">2</span><span style="color: red">LL</span>()()()()()()()()"#,
        );
    }

    #[test]
    fn test5() {
        assert_highlight!(
            "123456F3RF5LF7",
            r#"<span style="color: orange">123456</span><span style="color: pink">F</span><span style="color: orange">3</span><span style="color: green">R</span><span style="color: pink">F</span><span style="color: orange">5</span><span style="color: red">L</span><span style="color: pink">F</span><span style="color: orange">7</span>"#,
        );
    }
    
    #[test]
    fn test6() {
        assert_highlight!(
            "123456(())F3RF5LF7",
            r#"<span style="color: orange">123456</span>(())<span style="color: pink">F</span><span style="color: orange">3</span><span style="color: green">R</span><span style="color: pink">F</span><span style="color: orange">5</span><span style="color: red">L</span><span style="color: pink">F</span><span style="color: orange">7</span>"#,
        );
    }

    #[test]
    fn test7() {
        assert_highlight!(
            "()()FFF3RF5LF7",
            r#"()()<span style="color: pink">FFF</span><span style="color: orange">3</span><span style="color: green">R</span><span style="color: pink">F</span><span style="color: orange">5</span><span style="color: red">L</span><span style="color: pink">F</span><span style="color: orange">7</span>"#,
        );
    }
    
    #[test]
    fn test8() {
        assert_highlight!(
            "F1F1",
            r#"<span style="color: pink">F</span><span style="color: orange">1</span><span style="color: pink">F</span><span style="color: orange">1</span>"#,
        );
    }

    #[test]
    fn test9() {
        assert_highlight!(
            "123",
            r#"<span style="color: orange">123</span>"#,
        );
    }
    
    #[test]
    fn test10() {
        assert_highlight!(
            "FFFR345F2LL",
            r#"<span style="color: pink">FFF</span><span style="color: green">R</span><span style="color: orange">345</span><span style="color: pink">F</span><span style="color: orange">2</span><span style="color: red">LL</span>"#,
        );
    }
}