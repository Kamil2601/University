fn has_five(n: isize) -> bool {
    let mut m = n.abs();
    while m > 0 {
        if m % 10 == 5 {
            return true;
        }
        m /= 10;
    }
    return false;
}

fn dont_give_me_five(start: isize, end: isize) -> isize {
    (start..end + 1)
        .filter(|x| !has_five(*x))
        .collect::<Vec<isize>>()
        .len() as isize
}
