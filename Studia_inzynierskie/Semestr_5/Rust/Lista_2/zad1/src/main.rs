fn get_count(string: &str) -> usize {
  let mut vowels_count: usize = 0;

  for c in string.chars()
  {
      match c
      {
          'a' | 'e' | 'i' | 'o' | 'u' =>  vowels_count+=1,
          _ => ()
      }
  }
  
  vowels_count
}

fn main() {
}

#[test]
fn test1() {
  assert_eq!(get_count("abracadabra"), 5);
}

#[test]
fn test2() {
  assert_eq!(get_count("abracadabr"), 4);
}

#[test]
fn test3() {
  assert_eq!(get_count("abababab"), 4);
}

#[test]
fn test4() {
  assert_eq!(get_count("aaee"), 4);
}

#[test]
fn test5() {
  assert_eq!(get_count("qwdfghjkl"), 0);
}

#[test]
fn test6() {
  assert_eq!(get_count("qaqaqaw"), 3);
}

#[test]
fn test7() {
  assert_eq!(get_count("xdxdaeuxdu"), 4);
}

#[test]
fn test8() {
  assert_eq!(get_count("qwerttu"), 2);
}

#[test]
fn test9() {
  assert_eq!(get_count("a"), 1);
}

#[test]
fn test10() {
  assert_eq!(get_count("b"), 0);
}

