struct Cipher {
  from : String,
  to : String,
}

impl Cipher {
  fn new(map1: &str, map2: &str) -> Cipher {
    let result = Cipher{from : map1.to_string(), to : map2.to_string()};
    return result;
  }
  
   fn code(string: &str, from : String, to : String) -> String {
      string.to_string().chars().map(| c : char|
      {
          from.find(c).unwrap_or(c as usize)
        //   match from.find(c)
        //   {
        //       Some(i) => {to.chars().nth(i).unwrap()}
        //       _ => {c}
        //   }
      }).collect::<Vec<char>>().collect::<String>()   
  }

  fn main(){

  }
  
  fn encode(&self, string: &str) -> String {
    Self::code(string,self.from.clone(),self.to.clone())   
  }
  
  fn decode(&self, string: &str) -> String {
    Self::code(string,self.to.clone(),self.from.clone())
  }
}

#[test]
fn test1() {
  let map1 = "abcdefghijklmnopqrstuvwxyz";
  let map2 = "etaoinshrdlucmfwypvbgkjqxz";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.encode("abc"), "eta");
}

#[test]
fn test2() {
  let map1 = "abcdefghijklmnopqrstuvwxyz";
  let map2 = "etaoinshrdlucmfwypvbgkjqxz";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.encode("xyz"), "qxz");
}

#[test]
fn test3() {
  let map1 = "abcdefghijklmnopqrstuvwxyz";
  let map2 = "etaoinshrdlucmfwypvbgkjqxz";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.decode("erlang"), "aikcfu");
}


#[test]
fn test4() {
  let map1 = "abc";
  let map2 = "xyz";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.encode("abc"), "xyz");
}

#[test]
fn test5() {
  let map1 = "abc";
  let map2 = "xyz";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.encode("alamakota"), "xlxmxkotx");
}

#[test]
fn test6() {
  let map1 = "a";
  let map2 = "b";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.decode("bbb"), "aaa");
}

#[test]
fn test7() {
  let map1 = "qwertyui";
  let map2 = "asdfghjk";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.decode("asdfghjk"), "qwertyui");
}

#[test]
fn test8() {
  let map1 = "qwertyui";
  let map2 = "asdfghjk";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.encode("qwertyui"), "asdfghjk");
}


#[test]
fn test9() {
  let map1 = "asdf";
  let map2 = "zxcv";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.encode("asdh"), "zxch");
}

#[test]
fn test10() {
  let map1 = "asdf";
  let map2 = "zxcv";

  let cipher = Cipher::new(map1, map2);
  
  assert_eq!(cipher.decode("zxch"), "asdh");
}