fn print_data(data : Vec<Vec<u8>>){
    for y in data.iter(){
        for x in y.iter(){
            match x{
                0 => print!("-"),
                _ => print!("#"),
            }
        }
        print!("\n");
    }
}

fn connect_brackets(code : &Vec<char>) -> Vec<usize>{
    let length = code.len();
    let mut result : Vec<usize> = vec![length; length];
    let mut stack : Vec<usize> = Vec::new();

    for p in 0..length{
        match code[p]{
            '[' => stack.push(p),
            ']' => {
                let q = stack.pop().unwrap();
                result[p] = q;
                result[q] = p;
            },
            _ => (),
        }
    }
    return result;
}

fn interpreter(code: &str, iterations: usize, width: usize, height: usize) -> String {
    let mut data : Vec<Vec<u8>> = vec![vec![0; width]; height];

    let mut i : usize = 0;
    let mut inc = true;
    let mut y : usize = 0;
    let mut x : usize = 0;
    let mut p : usize = 0;

    let code_ = code.chars().collect::<Vec<char>>();
    let length = code_.len();

    let brackets : Vec<usize> = connect_brackets(&code_);

    while p<length && i<iterations{
        match code_[p]{
            'n' => y = (y+height-1)%height,
            's' => y = (y+1)%height,
            'e' => x = (x+1)%width,
            'w' => x = (x+width-1)%width,
            '*' => data[y][x] = 1-data[y][x],
            '[' => {
                if data[y][x]==0{
                    p = brackets[p];
                }
            },
            ']' => {
                if data[y][x]==1{
                    p = brackets[p];
                }
            }
            _ => inc = false,
        }
        if inc {i+=1}
        else {inc = true}
        p+=1;
    }
    
    return data.iter().map(|row| row.iter().map(|x| x.to_string()).collect::<String>())
                .collect::<Vec<String>>().join("\r\n");
}

fn main() {
    let x : u8 = 12;
    println!("{}",x.to_string());
    println!("{}",interpreter("*[s[e]*]", 9, 5, 5));
}

#[test]
fn test1() {
    assert_eq!(&interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 0, 6, 9), "000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000");
}

#[test]
fn test2() {
    assert_eq!(&interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 7, 6, 9), "111100\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000\r\n000000");
}

#[test]
fn test3() {
    assert_eq!(&interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 19, 6, 9), "111100\r\n000010\r\n000001\r\n000010\r\n000100\r\n000000\r\n000000\r\n000000\r\n000000");
}

#[test]
fn test4() {
    assert_eq!(&interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 42, 6, 9), "111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000");
}

#[test]
fn test5() {
    assert_eq!(&interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 100, 6, 9), "111100\r\n100010\r\n100001\r\n100010\r\n111100\r\n100000\r\n100000\r\n100000\r\n100000");
}

#[test]
fn test6() {
    assert_eq!(&interpreter("*e*e*e*es*es*ws*ws*w*w*w*n*n*n*ssss*s*s*s*", 19, 6, 9), "111100\r\n000010\r\n000001\r\n000010\r\n000100\r\n000000\r\n000000\r\n000000\r\n000000");
}

#[test]
fn test7() {
    assert_eq!(&interpreter("*[es*]", 5, 5, 6), "10000\r\n01000\r\n00000\r\n00000\r\n00000\r\n00000");
}

#[test]
fn test8() {
    assert_eq!(&interpreter("*[es*]", 9, 5, 6), "10000\r\n01000\r\n00100\r\n00000\r\n00000\r\n00000");
}

#[test]
fn test9() {
    assert_eq!(&interpreter("*", 1, 1, 1), "1");
}


#[test]
fn test10() {
    assert_eq!(&interpreter("*e[]", 1, 1, 1), "1");
}
