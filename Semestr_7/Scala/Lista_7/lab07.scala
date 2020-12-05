package object cash {
  import scala.language.implicitConversions

  abstract class Currency {
    val usdPrice: Double = 0
  }

  case object USD extends Currency {
    override val usdPrice: Double = 1.0
  }

  case object PLN extends Currency {
    override val usdPrice: Double = 3.68
  }

  case object EUR extends Currency {
    override val usdPrice: Double = 0.82
  }

  class Money(val value: Double, val curr: Currency) {
    def +(other: Money) = {
      val sumInUsd = usdValue + other.usdValue
      new Money(sumInUsd * curr.usdPrice, curr)
    }

    def -(other: Money) = {
      val sumInUsd = usdValue - other.usdValue
      new Money(sumInUsd * curr.usdPrice, curr)
    }

    def *(n: Double) = new Money(value * n, curr)

    def as(c: Currency): Money = new Money(usdValue * c.usdPrice, c)

    def >(other: Money): Boolean = usdValue > other.usdValue
    def <(other: Money): Boolean = usdValue < other.usdValue

    override def toString(): String = value.toString() + " " + curr.toString()

    def usdValue: Double = value / curr.usdPrice
  }

  implicit def Double2Function(value: Double): Currency => Money =
    curr => new Money(value, curr)

  def $ = USD
  def `€` = EUR
  def zl = PLN
}

package money {
  import  cash._
  trait CurrencyTrait {
    val conversion: Map[(Currency, Currency), BigDecimal] = Map(
      (USD, USD) -> 1,
      (USD, PLN) -> 3.68,
      (USD, EUR) -> 0.82,
      (EUR, USD) -> 1.21,
      (EUR, PLN) -> 4.46,
      (EUR, EUR) -> 1,
      (PLN, USD) -> 0.27,
      (PLN, PLN) -> 1,
      (PLN, EUR) -> 0.22,
      )
  }

  case class CurrencyConverter(
    conversion: Map[(Currency, Currency), BigDecimal]
  ) {
    def convert(from: Currency, to: Currency): BigDecimal = conversion((from, to))
  }

  case class Money(amount: BigDecimal, currency: Currency)(implicit
    currencyConverter: CurrencyConverter
  )
}

object lab07 {
  def main(args: Array[String]): Unit = {
    import cash._

    val sum1: Money = 100.01 (USD) + 200 (EUR)
    val sum2: Money = 100.01 (zl) + 200 ($)
    val sum3: Money = 5 (zl) + 3 (PLN) + 20.5 (USD)
    println(sum1)
    println(sum2)
    println(sum3)

    val sub: Money = 300.01 (USD) - 200 (EUR)
    println(sub)

    val mult1: Money = 30 (zl) * 20
    val mult2: Money = 20 ($) * 11

    println(mult1)
    println(mult2)

    val conv1: Money = 150.01 (USD) as PLN
    val conv2: Money = 120.01 (USD) as `€`

    println(conv1)
    println(conv2)

    val compare1: Boolean = 300.30 (USD) > 200 (`€`)
    val compare2: Boolean = 300.30 ($) < 200 (EUR)

    println(compare1)
    println(compare2)
  }
}
