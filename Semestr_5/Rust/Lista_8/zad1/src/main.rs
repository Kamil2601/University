fn dna_strand(dna: &str) -> String {
    dna.chars().map(|c| match c{
        'A' => 'T',
        'T' => 'A',
        'C' => 'G',
        _ => 'C'

    }).collect::<String>()
}

fn main() {
    println!("Hello, world!");
}

#[cfg(test)]
mod tests {
    use super::dna_strand;

    #[test]
    fn test1() {
      assert_eq!(dna_strand("AAAA"),"TTTT");
    }

    #[test]
    fn test2() {
      assert_eq!(dna_strand("ATTGC"),"TAACG");
    }

    #[test]
    fn test3() {
      assert_eq!(dna_strand("GTAT"),"CATA");
    }

    #[test]
    fn test4() {
      assert_eq!(dna_strand("ATATATATAT"),"TATATATATA");
    }

    #[test]
    fn test5() {
      assert_eq!(dna_strand("CGCGCGCG"),"GCGCGCGC");
    }

    #[test]
    fn test6() {
      assert_eq!(dna_strand("ATCGCGAT"),"TAGCGCTA");
    }

    #[test]
    fn test7() {
      assert_eq!(dna_strand("CGCGCGCGAAAAAA"),"GCGCGCGCTTTTTT");
    }

    #[test]
    fn test8() {
      assert_eq!(dna_strand(""),"");
    }

    #[test]
    fn test9() {
      assert_eq!(dna_strand("A"),"T");
    }

    #[test]
    fn test10() {
      assert_eq!(dna_strand("C"),"G");
    }
}
