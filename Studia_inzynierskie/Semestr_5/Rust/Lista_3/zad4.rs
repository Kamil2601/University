fn swap(c : char) -> char{
  match c{
      '□' => return "■",
      _ => return "□".,
  }
}

fn zoom(n: i32) -> String {

    let mut top : char = if n%4==1  {'■'} else {'□'};
    let border : String = if n%4==1  {'■'.to_string()} else {'□'.to_string()};

    // let mut result : String = "".to_string();

    // println!("{}",top);
    // top = swap(top);
    // println!("{}{}",top,swap(top.clone()));
    // println!("{}",top);

    // for i in 1..n/2+2
    // {
    //     let line : String = "abcde\n".to_string();
    //     result = format!("{}{}",result,line);
    //     top = swap(top)
    // }

    print!("{}",result);
  // result.pop();

  return result;
}

fn main(){
    zoom(7);
    //println!("{}",zoom(7));
}

#[test]
fn basic_test_1() {
  assert_eq!(zoom(1), "■");
}

#[test]
fn basic_test_2() {
  assert_eq!(zoom(3), "\
□□□
□■□
□□□
"
  );
}

#[test]
fn basic_test_3() {
  assert_eq!(zoom(5), "\
■■■■■
■□□□■
■□■□■
■□□□■
■■■■■"
  );
}

#[test]
fn basic_test_4() {
  assert_eq!(zoom(7), "\
□□□□□□□
□■■■■■□
□■□□□■□
□■□■□■□
□■□□□■□
□■■■■■□
□□□□□□□"
  );
}

#[test]
fn basic_test_5() {
  assert_eq!(zoom(9), "\
■■■■■■■■■
■□□□□□□□■
■□■■■■■□■
■□■□□□■□■
■□■□■□■□■
■□■□□□■□■
■□■■■■■□■
■□□□□□□□■
■■■■■■■■■"
  );
}