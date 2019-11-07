

fn dbl_linear(n: u32) -> u32{
    use std::collections::BinaryHeap;
    use std::cmp::Reverse;

    let mut heap = BinaryHeap::new();
    heap.push(Reverse(1));
    let mut x : Reverse<u32>;
    let mut result : u32 = 0;

    for _i in 0..(n+1){
        x = heap.pop().unwrap();
        match x{
            Reverse(k) => {
                result = k;
                heap.push(Reverse(2*k+1));
                heap.push(Reverse(3*k+1));
            },
        }
    }

    result
}

fn main() {
    println!("Hello, world!");
}
