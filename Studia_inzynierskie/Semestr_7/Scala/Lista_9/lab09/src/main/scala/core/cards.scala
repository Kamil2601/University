package cards {
  abstract class Color {
    val index = 0
  }
  case object Cubs extends Color {
    override val index = 1
  }
  case object Diamonds extends Color {
    override val index = 2
  }
  case object Hearts extends Color {
    override val index = 3
  }
  case object Spades extends Color {
    override val index = 4
  }

  abstract class Value {
    val index = 0
  }

  abstract class Face extends Value {}

  case object Ace extends Value {
    override val index = 1
  }
  case object Jack extends Face {
    override val index = 11
  }
  case object Queen extends Face {
    override val index = 12
  }
  case object King extends Face {
    override val index = 13
  }

  case class Numerical(val value: Int) extends Value {
    require(value >= 2 && value <= 10, "Card value must be beetween 2 and 10");

    override val index = value

    def ==(other: Numerical) = value == other.value

    override def toString(): String = value.toString()
  }

  class Card(val color: Color, val value: Value) {
    def this(color: Color, value: Int) = {
      this(color, Numerical(value))
    }

    val index = (value.index - 1) * 4 + (color.index - 1)

    def ==(other: Card): Boolean = color == other.color && value == other.value

    override def toString(): String =
      "(" + color.toString() + "," + value.toString() + ")"
  }

  object Card {
    def apply(color: Color, value: Value) = new Card(color, value)

    def apply(color: Color, value: Int) = new Card(color, value)
  }
}

package deck {
  import cards._

  class Deck(val cards: List[Card]) {
    def pull() = new Deck(cards.tail)
    def push(c: Card) = new Deck(c :: cards)

    val isStandard: Boolean = {
      if (cards.length != 52)
        false

      var isCardInDeck = Array.fill(52)(false)

      for (c <- cards) {
        isCardInDeck(c.index) = true
      }

      isCardInDeck.foldLeft(true)(_ && _)
    }

    def duplicatesOfCard(card: Card) =
      cards.foldLeft(0)((s, c) => {
        if (c == card)
          s + 1
        else
          s
      })

    def amountOfColor(color: Color): Int =
      cards.foldLeft(0)((s, c) => {
        if (c.color == color)
          s + 1
        else
          s
      })

    def amountOfNumerical(numerical: Numerical): Int =
      cards.foldLeft(0)((s, c) => {
        if (c.value == numerical)
          s + 1
        else
          s
      })

    val amountWithNumerical: Int =
      cards.foldLeft(0)((s, c) => {
        if (c.value.isInstanceOf[Numerical])
          s + 1
        else
          s
      })

    def amountOfFace(face: Face): Int =
      cards.foldLeft(0)((s, c) => {
        if (c.value == face)
          s + 1
        else
          s
      })

    val amountWithFace: Int =
      cards.foldLeft(0)((s, c) => {
        if (c.value.isInstanceOf[Face])
          s + 1
        else
          s
      })
  }

  object Deck {
    def apply(): Deck = {
      var cards: List[Card] = List()

      for (color <- List(Cubs, Diamonds, Hearts, Spades)) {
        for (face <- List(Ace, Jack, Queen, King)) {
          cards = Card(color, face) :: cards
        }

        for (i <- 2 to 10) {
          cards = Card(color, i) :: cards
        }
      }

      import scala.util.Random._
      return new Deck(shuffle(cards))
    }
  }
}
