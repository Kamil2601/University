struct Sudoku{
    data: Vec<Vec<u32>>,
}

impl Sudoku{

    fn valid_row(&self,i : usize) -> bool{
        let n = self.data.len();
        let mut check = vec![false; n];
        for j in &self.data[i]{
            if *j>0 && *j<=(n as u32){
                check[(*j-1) as usize] = true;
            }
        }
        check.iter().fold(true, |acc, &x| acc&&x)
    }

    fn valid_rows(&self) -> bool{
        (0..self.data.len()).fold(true, |acc, i| acc && self.valid_row(i))
    }

    fn valid_column(&self,i : usize) -> bool{
        let n = self.data.len();
        let mut check = vec![false; n];
        for j in 0..n{
             if self.data[j][i]>0 && self.data[j][i]<=(n as u32){
                 check[self.data[j][i] as usize -1] = true;
             }
        }
        check.iter().fold(true, |acc, &x| acc&&x)
    }

    fn valid_columns(&self) -> bool{
        (0..self.data.len()).fold(true, |acc, i| acc && self.valid_column(i))
    }

    fn valid_square(&self, y : usize, x : usize) -> bool{
        let n = self.data.len();
        let mut check = vec![false; n];
        let m = (n as f32).sqrt() as usize;

        for i in y..y+m{
            for j in x..x+m{
                if self.data[i][j]>0 && self.data[i][j]<=(n as u32){
                    check[self.data[i][j] as usize -1] = true;
                }
            }
        }

        check.iter().fold(true, |acc, &x| acc&&x)
    }

    fn valid_squares(&self) -> bool{
        let n = self.data.len();
        let m = (n as f32).sqrt() as usize;
        let mut result = true;
        for y in (0..n).step_by(m){
            for x in (0..n).step_by(m)
            {
                result = result && self.valid_square(y,x);
            }
        }

        return result;
    }

    fn is_valid(&self) -> bool {
        self.valid_rows() && self.valid_squares() && self.valid_columns()
    }
}

fn main() {
}

#[test]
fn test1() {
    let sudoku = Sudoku{
        data: vec![
                vec![7,8,4, 1,5,9, 3,2,6],
                vec![5,3,9, 6,7,2, 8,4,1],
                vec![6,1,2, 4,3,8, 7,5,9],

                vec![9,2,8, 7,1,5, 4,6,3],
                vec![3,5,7, 8,4,6, 1,9,2],
                vec![4,6,1, 9,2,3, 5,8,7],
                
                vec![8,7,6, 3,9,4, 2,1,5],
                vec![2,4,3, 5,6,1, 9,7,8],
                vec![1,9,5, 2,8,7, 6,3,4]
            ]
    };

    assert!(sudoku.is_valid());
}

#[test]
fn test2() {
    let sudoku = Sudoku{
        data: vec![
                vec![7,8,4, 1,5,9, 3,2,6],
                vec![5,3,9, 6,7,2, 8,4,1],
                vec![6,1,2, 4,3,8, 7,5,9],

                vec![9,2,8, 7,1,5, 4,6,3],
                vec![3,5,7, 8,4,6, 1,9,2],
                vec![4,6,1, 9,2,3, 5,8,7],
                
                vec![8,7,6, 3,9,4, 2,1,5],
                vec![2,4,3, 5,6,1, 9,7,8],
                vec![1,9,5, 2,8,7, 6,3,4]
            ]
    };

    assert!(sudoku.is_valid());
}

#[test]
fn test3() {
    let sudoku = Sudoku{
        data: vec![
                vec![1,2,3, 4,5,6, 7,8,9],
                vec![1,2,3, 4,5,6, 7,8,9],
                vec![1,2,3, 4,5,6, 7,8,9],

                vec![1,2,3, 4,5,6, 7,8,9],
                vec![1,2,3, 4,5,6, 7,8,9],
                vec![1,2,3, 4,5,6, 7,8,9],
                
                vec![1,2,3, 4,5,6, 7,8,9],
                vec![1,2,3, 4,5,6, 7,8,9],
                vec![1,2,3, 4,5,6, 7,8,9],
            ]
    };
    
    assert!(!sudoku.is_valid());
}

#[test]
fn test4() {    
    let sudoku = Sudoku{
        data: vec![
                vec![1,2,3,4,5],
                vec![1,2,3,4],
                vec![1,2,3,4],
                vec![1],
            ]
    };
    assert!(!sudoku.is_valid());
}

#[test]
fn test5() {    
    let sudoku = Sudoku{
        data: vec![
                vec![1,2,3,4],
                vec![4,3,2,1],
                vec![2,1,4,3],
                vec![3,4,1,2],
            ]
    };
    assert!(sudoku.is_valid());
}

#[test]
fn test6() {    
    let sudoku = Sudoku{
        data: vec![
                vec![9,7,6, 4,8,1, 3,2,5],
                vec![1,4,3, 2,5,9, 7,8,6],
                vec![5,2,8, 3,7,6, 1,9,4],

                vec![6,9,4, 5,1,8, 2,3,7],
                vec![8,1,2, 7,3,4, 5,6,9],
                vec![7,3,5, 9,6,2, 4,1,8],
                
                vec![4,6,7, 8,2,3, 9,5,1],
                vec![2,5,1, 6,9,7, 8,4,3],
                vec![3,8,9, 1,4,5, 6,7,2],
            ]
    };
    
    assert!(sudoku.is_valid());
}

#[test]
fn test7() {    
    let sudoku = Sudoku{
        data: vec![
                vec![9,7,6, 4,8,1, 3,2,5],
                vec![1,4,3, 2,5,9, 7,8,6],
                vec![5,2,8, 3,7,6, 1,9,4],

                vec![6,9,4, 5,1,8, 2,3,7],
                vec![8,1,2, 7,3,4, 5,6,9],
                vec![7,3,5, 9,6,3, 4,1,8],
                
                vec![4,6,7, 8,2,2, 9,5,1],
                vec![2,5,1, 6,9,7, 8,4,3],
                vec![3,8,9, 1,4,5, 6,7,2],
            ]
    };
    
    assert!(!sudoku.is_valid());
}


#[test]
fn test8() {    
    let sudoku = Sudoku{
        data: vec![
                vec![9,7,6, 4,8,1, 3,2,5],
                vec![1,4,3, 2,5,9, 7,8,6],
                vec![5,2,8, 3,7,6, 1,9,4],

                vec![6,9,4, 5,1,8, 2,3,7],
                vec![8,1,2, 7,3,4, 5,6,9],
                vec![7,3,5, 9,6,3, 4,1,8],
                
                vec![4,6,7, 8,2,2, 9,5,1],
                vec![2,6,1, 6,9,7, 8,4,3],
                vec![3,8,9, 1,4,5, 6,7,2],
            ]
    };
    
    assert!(!sudoku.is_valid());
}

#[test]
fn test9() {    
    let sudoku = Sudoku{
        data: vec![
                vec![1],
            ]
    };
    assert!(sudoku.is_valid());
}

#[test]
fn test10() {    
    let sudoku = Sudoku{
        data: vec![
                vec![5],
            ]
    };
    assert!(!sudoku.is_valid());
}