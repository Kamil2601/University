package plugins {
  abstract class Manipulation {
    def plugin(s: String): String = s
  }

  trait Reverting extends Manipulation {
    abstract override def plugin(s: String): String =
      super.plugin(
        s.length match {
          case 0 => ""
          case _ => plugin(s.tail) + s.head
        }
      )
  }

  trait LowerCasing extends Manipulation {
    abstract override def plugin(s: String): String =
      super.plugin(s.toLowerCase())
  }

  trait SingleSpacing extends Manipulation {
    abstract override def plugin(s: String): String =
      super.plugin(singleSpace(s.toList).mkString)

    private def singleSpace(s: List[Char]): List[Char] = {
      s match {
        case Nil                => Nil
        case ' ' :: ' ' :: tail => singleSpace(s.tail)
        case c :: tail          => c :: singleSpace(tail)
      }
    }
  }

  trait NoSpacing extends Manipulation {
    import scala.util.matching.Regex

    abstract override def plugin(s: String): String =
      super.plugin(removeSpaces(s.toList).mkString)

    private def removeSpaces(s: List[Char]): List[Char] = {
      s match {
        case Nil         => Nil
        case ' ' :: tail => removeSpaces(s.tail)
        case c :: tail   => c :: removeSpaces(tail)
      }
    }
  }

  trait DuplicateRemoval extends Manipulation {
    abstract override def plugin(s: String): String = {
      val letters = collection.mutable.Map[Char, Int]()

      for (c <- s) {
        if (letters.contains(c))
          letters.update(c, letters(c) + 1)
        else
          letters.update(c, 1)
      }

      val res =
        for (c <- s if (!(letters(c) > 1)))
          yield c

      return super.plugin(res)
    }
  }

  trait Rotating extends Manipulation {
    abstract override def plugin(s: String): String =
      super.plugin(s.last + s.take(s.length() - 1))
  }

  trait Doubling extends Manipulation {
    abstract override def plugin(s: String): String =
      super.plugin(double(s.toList).mkString)

    private def double(s: List[Char]): List[Char] =
      s match {
        case Nil | _ :: Nil => s
        case x :: y :: tail => x :: y :: y :: double(tail)
      }
  }

  trait Shortening extends Manipulation {
    abstract override def plugin(s: String): String =
      super.plugin(short(s.toList).mkString)

    private def short(s: List[Char]): List[Char] =
      s match {
        case Nil | _ :: Nil => s
        case x :: y :: tail => x :: short(tail)
      }
  }
}

object Actions {
  import plugins._

  val ActionA = new Manipulation with Shortening with Doubling with SingleSpacing

  val ActionB = new Mainpulation with Doubling with Shortening with NoSpacing

  val ActionC = new Mainpulation with Doubling with LowerCasing

  val ActionD = new Manipulation with Rotating with DuplicateRemoval
}

object lab05 {
  def main(args: Array[String]): Unit = {
    import plugins._

    // val manipulator = new TextManipulation()

    object RevertingObj extends Reverting {}
    object LowerCasingObj extends LowerCasing {}
    object SingleSpacingObj extends SingleSpacing {}
    object NoSpacingObj extends NoSpacing {}
    object DuplicateRemovalObj extends DuplicateRemoval {}
    object RotatingObj extends Rotating {}
    object DoublingObj extends Doubling {}
    object ShorteningObj extends Shortening {}

    println(RevertingObj.plugin("abcdefg"))
    println(LowerCasingObj.plugin("AbCDFeg"))
    println(SingleSpacingObj.plugin("a       b  c defg"))
    println(NoSpacingObj.plugin("a       b  c defg"))
    println(DuplicateRemovalObj.plugin("alzaa  cda"))
    println(RotatingObj.plugin("abc"))
    println(DoublingObj.plugin("abcdefg"))
    println(ShorteningObj.plugin("1234567890"))

    println(Actions.ActionA.plugin("123456789"))
    println(ShorteningObj.plugin("1223445667889"))
  }
}
