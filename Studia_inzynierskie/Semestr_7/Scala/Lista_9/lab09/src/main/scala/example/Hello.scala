package example

object Hello extends Greeting with App {
  // println(greeting)
  import cards._
  import deck._

  // val cs: List[Card] = List(
  //   Card(Cubs, Ace),
  //   Card(Cubs, 7),
  //   Card(Hearts, 4),
  //   Card(Diamonds, King),
  //   Card(Diamonds, Jack))

  // val d = new Deck(cs)

  // println(d.isStandard)

  // println(d.duplicatesOfCard(Card(Diamonds, King)))
  // println(d.amountOfColor(Cubs))
  // println(d.amountOfNumerical(Numerical(7)))
  // println(d.amountWithNumerical)
  // println(d.amountOfFace(King))
  // println(d.amountWithFace)

  val standard = Deck()

  println(standard.cards.length)
  println(standard.isStandard)

  import games._

  new Blackjack(standard).play(52)

  new Blackjack(standard).first21()
}

trait Greeting {
  lazy val greeting: String = "hello"
}
