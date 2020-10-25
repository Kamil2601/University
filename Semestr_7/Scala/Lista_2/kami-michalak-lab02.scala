package numbers {
  class Rational(n: Int, d: Int) {
    require(d > 0, "Denominator must be greater than 0")
    private def gcd(a: Int, b: Int): Int = if (b == 0) a else gcd(b, a % b)

    private def lcm(a: Int, b: Int): Int = (a * b) / gcd(a, b)
    private val g = gcd(n.abs, d.abs)

    val numerator = n / g
    val denominator = d / g

    def +(other: Rational): Rational = {
      val newD = lcm(denominator, other.denominator)
      val tempN = numerator * newD / denominator
      val tempNOther = other.numerator * newD / other.denominator

      new Rational(tempN + tempNOther, newD)
    }
    def -(other: Rational): Rational = {
      val newD = lcm(denominator, other.denominator)
      val tempN = numerator * newD / denominator
      val tempNOther = other.numerator * newD / other.denominator

      new Rational(tempN - tempNOther, newD)
    }
    def *(other: Rational): Rational = {
      val tempN = numerator * other.numerator
      val tempD = denominator * other.denominator

      val g = gcd(tempN.abs, tempD.abs)

      new Rational(tempN / g, tempD / g)
    }

    def /(other: Rational): Rational = {
      require(other.numerator != 0, "Divider equals 0")
      val tempN = numerator * other.denominator
      val tempD = denominator * other.numerator

      val g = gcd(tempN, tempD)

      new Rational(tempN / g, tempD / g)
    }

    def ==(other: Rational): Boolean =
      numerator == other.numerator && denominator == other.denominator

    def !=(other: Rational): Boolean = !(this == other)

    override def toString(): String = {
      if (numerator == 0) "0"

      val intPart: Int = numerator / denominator
      
      (if (intPart != 0) intPart + " " else "") +
        (if (numerator.abs % denominator != 0)
           (numerator.abs % denominator).toString() + "/" + denominator
         else "")

    }

    def toDouble(): Double = numerator.toDouble / denominator.toDouble
  }

  object Rational {
    def apply(n: Int, d: Int = 1) = {
      var rational = new Rational(n, d)
      rational
    }

    def zero = Rational(0)
    def one = Rational(1)
  }

}

package figures {
  import numbers._
  class Point(val x: Rational, val y: Rational) {}

  object Point {
    def apply(x: Rational, y: Rational) = {
      var point = new Point(x, y)
      point
    }

    def distanceSquared(a: Point, b: Point): Rational = {
      val xDif = a.x - b.x
      var yDif = a.y - b.y
      xDif * xDif + yDif * yDif
    }

    def distance(a: Point, b: Point): Double =
      scala.math.sqrt(
        distanceSquared(a, b).toDouble
      )
  }

  trait Figure {
    def area(): Double
    def description(): String
  }

  class Triangle(val a: Point, val b: Point, val c: Point) extends Figure {
    def area(): Double = {
      val rat: Rational =
        a.x * (b.y - c.y) + b.x * (c.y - a.y) + c.x * (a.y - b.y)

      rat.numerator.abs.toDouble / rat.denominator.toDouble / 2.0
    }

    def description(): String = "Triangle"
  }

  object Triangle {
    def apply(a: Point, height: Rational, width: Rational): Triangle = {
      val b = Point(a.x, a.y + height)
      val c = Point(a.x + width, a.y)
      new Triangle(a, b, c)
    }
  }

  class Rectangle(val a: Point, val b: Point, val c: Point, val d: Point)
      extends Figure {
    private def checkDistances(): Boolean = {
      Point.distanceSquared(a, b) == Point.distanceSquared(c, d) &&
      Point.distanceSquared(a, d) == Point.distanceSquared(b, c) &&
      Point.distanceSquared(a, c) == Point.distanceSquared(b, d)
    }
    require(checkDistances(), "Points do not form rectangle!")

    def area(): Double = {
      val width = Point.distance(a, b)
      val height = Point.distance(a, d)

      width * height
    }

    def description(): String = "Rectangle"
  }

  object Rectangle {
    def apply(a: Point, height: Rational, width: Rational): Rectangle = {
      val b = Point(a.x, a.y + height)
      val c = Point(b.x + width, b.y)
      val d = Point(a.x + width, a.y)

      new Rectangle(a, b, c, d)
    }
  }

  class Square(val a: Point, val c: Point) extends Figure {
    def area(): Double = {
      val d = Point.distance(a, c)
      d * d / 2
    }

    def description(): String = "Square"
  }

  object Square {
    def apply(a: Point, width: Rational): Square = {
      val c = Point(a.x + width, a.y + width)
      new Square(a, c)
    }
  }
}

object functionsOnList {
  import figures._
  def areaSum(figures: List[Figure]): Double = figures.map(f => f.area()).sum
  def printAll(figures: List[Figure]): Unit =
    figures.map(f => println(f.description()))
}

object lab02 {
  def main(args: Array[String]) = {
    import numbers._
    import figures._

    println(Rational(1, 2))
    println(Rational.zero)
    println(Rational.one)
    println(Rational(1, 2) + Rational(1, 3))
    println(Rational(1, 2) - Rational(1, 3))
    println(Rational(1, 2) * Rational(1, 3))
    println(Rational(1, 2) / Rational(1, 3))
    println(Rational(17, 3))
    println(Rational(1, 2) == Rational(1, 2))
    println(Rational(1, 2) == Rational(2, 4))
    println(Rational(1, 2) == Rational(2, 5))
    println(Rational(1, 2) != Rational(2, 5))
    println(Rational(1, 2) != Rational(2, 4))

    val t1 = new Triangle(
      Point(Rational.zero, Rational.zero),
      Point(Rational.one, Rational.zero),
      Point(Rational.one, Rational.one)
    )

    println(t1.area())

    val r1 = new Rectangle(
      Point(Rational.zero, Rational.zero),
      Point(Rational(5, 1), Rational.zero),
      Point(Rational(5, 1), Rational(3, 1)),
      Point(Rational.zero, Rational(3, 1))
    )

    println(r1.area())

    val t2 =
      Triangle(Point(Rational.zero, Rational.zero), Rational(2), Rational(3))

    println(t2.area())

    val l = List[Figure](t1, r1, t2)
    println(functionsOnList.areaSum(l))

    functionsOnList.printAll(l)
  }
}
