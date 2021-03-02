fn camel_case(str: &str) -> String {
    str.split_whitespace()
                .map(|word| format!("{}{}",word[0..1].to_string().to_uppercase(),
                        word[1..].to_string()))
                .collect::<Vec<String>>().join("")
}

fn main() {
    println!("Hello, world!");
}

// Rust tests
#[test]
fn test1() {
  assert_eq!(camel_case("test case"), "TestCase");
}

#[test]
fn test2() {
  assert_eq!(camel_case("test case"), "TestCase");
}

#[test]
fn test3() {
  assert_eq!(camel_case("camel case method xd abc"), "CamelCaseMethodXdAbc");
}

#[test]
fn test4() {
  assert_eq!(camel_case("camel case method"), "CamelCaseMethod");
}


#[test]
fn test5() {
  assert_eq!(camel_case("say hello "), "SayHello");
}

#[test]
fn test6() {
  assert_eq!(camel_case(" camel case word"), "CamelCaseWord");
}

#[test]
fn test7() {
  assert_eq!(camel_case(""), "");
}

#[test]
fn test8() {
  assert_eq!(camel_case("rust"), "Rust");
}

#[test]
fn test9() {
  assert_eq!(camel_case("python lepszy"), "PythonLepszy");
}

#[test]
fn test10() {
  assert_eq!(camel_case("Nawet C++ Lepszy"), "NawetC++Lepszy");
}