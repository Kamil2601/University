fn square_area_to_circle(size:f64) -> f64 {
    return core::f64::consts::PI*size/4.0;
}

fn main(){

}

fn assert_close(a:f64, b:f64, epsilon:f64) {
    assert!( (a-b).abs() < epsilon, format!("Expected: {}, got: {}",b,a) );
}

mod tests {
    use super::square_area_to_circle;
    use super::assert_close;
    
    #[test]
    fn test1() {
        assert_close(square_area_to_circle(9.0), 7.0685834705770345, 1e-8);
    }

    #[test]
    fn test2() {
        assert_close(square_area_to_circle(20.0), 15.70796326794897, 1e-8);
    }

    #[test]
    fn test3() {
        assert_close(square_area_to_circle(4.0), 3.141592653589793, 1e-8);
    }

    #[test]
    fn test4() {
        assert_close(square_area_to_circle(8.0), 2.0*3.141592653589793, 1e-8);
    }

    #[test]
    fn test5() {
        assert_close(square_area_to_circle(12.0), 3.0*3.141592653589793, 1e-8);
    }
}
