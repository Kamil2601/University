package games {
  import deck._
  import cards._
  class Blackjack(val deck: Deck) {
    // Points calculation:
    // 1. Numerical cards as their numerical value = 2 - 10.
    // 2. Face cards (Jack, Queen, King) = 10
    // 3. Ace = 1 or 11 (player could choose)

    def play(n: Int): Unit = {
      var sum = 0
      var aces = 0
      for (c <- deck.cards.take(n)) {
        val v = value(c)
        sum += v
        if (v == 1)
          aces += 1
        println(c.toString + ": " + v.toString + (
          if (v == 1)
            " / 11"
          else
            ""))
      }

      print(sum)

      for (i <- 1 to aces) {
        sum += 10
        print(" / " + sum)
      }

      print("\n")
    }
    lazy val all21: List[List[Card]] = allSum(21, deck.cards)
    def first21(): Unit = {
      for (c <- all21.head) {
        println(c)
      }
    }

    private def allSum(sum: Int, cards: List[Card]): List[List[Card]] = {
      if (sum == 0) return List(List())
      else if (cards.length == 0 || sum < 0) return List()

      val c = cards.head
      val v = value(c)

      var allSmallerSum = allSum(sum - v, cards.tail)

      if (v == 1)
        allSmallerSum = allSmallerSum ++ allSum(sum - 11, cards.tail)

      return allSmallerSum.map(l => c :: l) ++ allSum(sum, cards.tail)
    }

    private def value(c: Card): Int = {
      if (c.value.isInstanceOf[Numerical])
        return c.value.asInstanceOf[Numerical].value;
      else if (c.value.isInstanceOf[Face])
        return 10
      else
        return 1
    }
  }

  object Blackjack {
    def apply(numOfDecks: Int) = new Blackjack(
      new Deck(List.fill(numOfDecks)(Deck().cards).flatten))
  }
}
