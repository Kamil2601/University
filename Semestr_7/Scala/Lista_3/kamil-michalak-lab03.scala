object utils {
  def isSorted(xs: List[Int], ordering: (Int, Int) => Boolean): Boolean =
    xs match {
      case Nil      => true
      case x :: Nil => true
      case y :: ys  => ordering(y, ys.head) && isSorted(ys, ordering)
    }

  def isAscSorted(xs: List[Int]) = isSorted(xs, (x: Int, y: Int) => x <= y)

  def isDescSorted(xs: List[Int]) = isSorted(xs, (x: Int, y: Int) => x >= y)

  def foldLeft[A, B](xs: List[A], z: B)(f: (B, A) => B): B =
    xs match {
      case Nil     => z
      case y :: ys => foldLeft(ys, f(z, y))(f)
    }

  def sum(xs: List[Int]) = foldLeft(xs, 0)((x, y) => x + y)

  def length[A](xs: List[A]): Int = foldLeft(xs, 0)((x: Int, _) => x + 1)

  def compose[A, B, C](f: B => C, g: A => B): A => C = (x: A) => f(g(x))

  def repeated[A](f: A => A, n: Int): A => A = {
    require(n >= 0)
    n match {
      case 0 => identity[A]
      case n => compose(f, repeated(f, n - 1))
    }
  }

  def curry[A, B, C](f: (A, B) => C): A => B => C =
    (x: A) => (y: B) => f(x, y)

  def uncurry[A, B, C](f: A => B => C) = (x: A, y: B) => f(x)(y)
}

object lab03 {
  def unSafe[T](exception: Exception)(expression: => T): T = {
    try {
      expression
    } catch {
      case _ => throw exception
    }
  }

  def main(args: Array[String]): Unit = {
    import utils._
    println(isSorted(List(1, 6, 3, 4, 5), (x: Int, y: Int) => x < y))
    println(isAscSorted(List(1, 2, 3, 4)))
    println(foldLeft(List(1, 2, 3, 4), 0)((x, y) => x + y))
    println(length(List(1, 2, 3)))
    println(repeated((x: Int) => x + 1, 10)(0))
    println(curry((x: Int, y: Int) => x + y)(1)(2))
    println(uncurry((x: Int) => (y: Int) => x + y)(1,2))

    unSafe(new Exception("Some exception")) {
      1/0
    }

    unSafe(new Exception("Exception A")) {
      throw new Exception("Exception B")
    }
  }
}
