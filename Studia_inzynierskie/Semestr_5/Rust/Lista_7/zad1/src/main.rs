fn sum(cell: &str) -> u8 {
    let mut chars_ = cell.chars();
    let row = (chars_.next().unwrap() as u8) - ('A' as u8) + 1;
    let col = chars_.next().unwrap().to_string().parse::<u8>().unwrap();
    row+col
}

fn chessboard_cell_color(cell1: &str, cell2: &str) -> bool {
    sum(cell1) % 2 == sum(cell2) % 2
}

fn main() {
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn test1() {
        assert_eq!(chessboard_cell_color("A1", "C3"), true);
    }

    #[test]
    fn test2() {
        assert_eq!(chessboard_cell_color("A1", "H3"), false);
    }

    #[test]
    fn test3() {
        assert_eq!(chessboard_cell_color("A1", "A2"), false);
    }

    #[test]
    fn test4() {
        assert_eq!(chessboard_cell_color("A1", "C1"), true);
    }

    #[test]
    fn test5() {
        assert_eq!(chessboard_cell_color("A1", "A1"), true);
    }

    #[test]
    fn test6() {
        assert_eq!(chessboard_cell_color("A1", "H8"), true);
    }

    #[test]
    fn test7() {
        assert_eq!(chessboard_cell_color("A1", "G8"), false);
    }

    #[test]
    fn test8() {
        assert_eq!(chessboard_cell_color("A1", "G4"), false);
    }

    #[test]
    fn test9() {
        assert_eq!(chessboard_cell_color("B1", "G4"), true);
    }

    #[test]
    fn test10() {
        assert_eq!(chessboard_cell_color("D2", "E4"), false);
    }
}
