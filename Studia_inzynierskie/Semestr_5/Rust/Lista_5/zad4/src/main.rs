pub fn execute(code: &str) -> String {
    let mut min_x = 0;
    let mut max_x = 0;
    let mut min_y = 0;
    let mut max_y = 0;
    let mut x = 0;
    let mut y = 0;
    let mut dir = 0;
    let step : Vec<(i32,i32)> = vec![(1,0),(0,1),(-1,0),(0,-1)];
    let mut code2 = String::new();
    let mut number = "".to_string();
    let mut last : char = ' ';

    for c in format!("{}.",code).chars(){
        if c.is_numeric(){
            number = format!("{}{}",number,c);
        }
        else{
            if number != ""{
                code2 = format!("{}{}",code2,
                std::iter::repeat(last).take(number.parse::<usize>().unwrap()).collect::<String>());
            }
            else
            {
                code2 = format!("{}{}",code2,last);
            }
            number = String::new();
            last = c;
        }
        
    }
    
    for c in code2.chars(){
        match c{
            ' ' => (),
            'R' => dir = (dir+1)%4,
            'L' => dir = (dir+3)%4,
            _ => {
                let (x_,y_) = step[dir];
                x+=x_;
                y+=y_;
                if x>max_x {max_x = x};
                if x<min_x {min_x = x};
                if y>max_y {max_y = y};
                if y<min_y {min_y = y};
            }
        }
    }

    let width = max_x-min_x+1;
    let height = max_y-min_y+1;
    let mut board = vec![vec![' '; width as usize]; height as usize];
    
    x = -min_x;
    y = -min_y;

    board[y as usize][x as usize] = '*';
    dir = 0;

    for c in code2.chars(){
        match c{
            ' ' => (),
            'R' => dir = (dir+1)%4,
            'L' => dir = (dir+3)%4,
            _ => {
                let (x_,y_) = step[dir];
                x+=x_;
                y+=y_;
                board[y as usize][x as usize] = '*';
            },
        }
    }

    let mut result = String::new();

    for line in board{
        result = format!("{}{}\r\n",result,line.clone().into_iter().collect::<String>());
    }

    result.pop();
    result.pop();
    result

}

fn main() {
    println!("{}",execute("FRFRFRF"));
}


#[cfg(test)]
mod tests {
    use super::execute;
    #[test]
    fn test1() {
        assert_eq!(execute(""), "*");
    }

    #[test]
    fn test2() {
        assert_eq!(execute("FFFFF"), "******");
    }

    #[test]
    fn test3() {
        assert_eq!(
            execute("FFFFFLFFFFFLFFFFFLFFFFFL"),
            "******\r\n*    *\r\n*    *\r\n*    *\r\n*    *\r\n******",
        );
    }

    #[test]
    fn test4() {
        assert_eq!(
            execute("LFFFFFRFFFRFFFRFFFFFFF"),
            "    ****\r\n    *  *\r\n    *  *\r\n********\r\n    *   \r\n    *   ",
        );
    }

    #[test]
    fn test5() {
        assert_eq!(
            execute("LF5RF3RF3RF7"),
            "    ****\r\n    *  *\r\n    *  *\r\n********\r\n    *   \r\n    *   ",
        );
    }

    #[test]
    fn test6() {
        assert_eq!(
            execute("F5RF5RF5R"),
            "******\r\n     *\r\n     *\r\n     *\r\n     *\r\n******",
        );
    }

    #[test]
    fn test7() {
        assert_eq!(
            execute("F5RF5LF5RF3LF8"),
            "******             \r\n     *             \r\n     *             \r\n     *             \r\n     *             \r\n     ******        \r\n          *        \r\n          *        \r\n          *********",
        );
    }

    #[test]
    fn test8() {
        assert_eq!(
            execute("R4F10"),
            "***********",
        );
    }

    #[test]
    fn test9() {
        assert_eq!(
            execute("R4F10L3F5L2R4F10"),
            "          *\r\n          *\r\n          *\r\n          *\r\n          *\r\n***********\r\n          *\r\n          *\r\n          *\r\n          *\r\n          *",
        );
    }

    #[test]
    fn test10() {
        assert_eq!(
            execute("FRFRFRF"),
            "**\r\n**",
        );
    }
}