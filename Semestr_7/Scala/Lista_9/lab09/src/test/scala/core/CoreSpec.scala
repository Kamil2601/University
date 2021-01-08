package example

import org.scalatest.flatspec.AnyFlatSpec
import org.scalatest.matchers.should.Matchers

class CoreSpec extends AnyFlatSpec with Matchers {
  import cards._
  import deck._

  "Methods" should "return correct values" in {
    val cs: List[Card] = List(
      Card(Cubs, Ace),
      Card(Cubs, 7),
      Card(Hearts, 4),
      Card(Diamonds, King),
      Card(Diamonds, Jack))

    val d = new Deck(cs)

    d.isStandard shouldEqual false
    d.duplicatesOfCard(Card(Diamonds, King)) shouldEqual 1
    d.amountOfColor(Cubs) shouldEqual 2
    d.amountOfNumerical(Numerical(7)) shouldEqual 1
    d.amountWithNumerical shouldEqual 2
    d.amountOfFace(King) shouldEqual 1
    d.amountWithFace shouldEqual 2
  }
}
