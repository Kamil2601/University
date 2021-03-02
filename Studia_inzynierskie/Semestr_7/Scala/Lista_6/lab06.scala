package pizzeria {

  abstract class WithPrice {
    val price: Double = 0;
  }

  abstract class PizzaType extends WithPrice {}

  case object Margarita extends PizzaType {
    override val price: Double = 5
  }

  case object Pepperoni extends PizzaType {
    override val price: Double = 6.5
  }

  case object Funghi extends PizzaType {
    override val price: Double = 7
  }

  abstract class PizzaSize {
    val coefficient: Double = 0;
  }

  case object Small extends PizzaSize {
    override val coefficient: Double = 0.9
  }

  case object Regular extends PizzaSize {
    override val coefficient: Double = 1
  }

  case object Large extends PizzaSize {
    override val coefficient: Double = 1.5
  }

  abstract class Crust {}

  case object Thin extends Crust {}

  case object Thick extends Crust {}

  abstract class Meat extends WithPrice {}

  case object Salami extends Meat {
    override val price: Double = 1;
  }

  abstract class Topping extends WithPrice {
    override val price: Double = 0.5
  }

  case object Ketchup extends Topping {}

  case object Garlic extends Topping {}

  abstract class Drink {
    val price: Double = 2
  }

  case object Lemonade extends Drink {}

  case class Pizza(
      pizzaType: PizzaType,
      size: PizzaSize,
      crust: Crust,
      extraMeat: Option[Meat],
      extraTopping: Option[Topping]
  ) {

    override def toString() = {
      val meatStr = extraMeat match {
        case Some(value) => " + " + value.toString()
        case None        => ""
      }

      val toppingStr = extraTopping match {
        case Some(value) => " + " + value.toString()
        case None        => ""
      }

      pizzaType.toString() + ": " + size.toString() + ", " + crust
        .toString() + meatStr + toppingStr + " - " + price.toString() + "$"
    }

    val price: Double =
      pizzaType.price * size.coefficient + price(extraMeat) + price(
        extraTopping
      )

    private def price(product: Option[WithPrice]) =
      product match {
        case None        => 0
        case Some(value) => value.price
      }
  }
}

package orders {
  import pizzeria._

  abstract class Discount {
    val value: Double = 0
  }

  case object Student extends Discount {
    override val value: Double = 0.05
  }

  case object Senior extends Discount {
    override val value: Double = 0.07
  }

  class Order(
      name: String,
      address: String,
      phone: String,
      pizzas: List[Pizza],
      drinks: List[Drink],
      discount: Discount,
      specialInfo: String
  ) {
    require(validatePhone())

    override def toString() = {
      var res = name + "\n" + specialInfo + "\n"

      if (pizzas != null)
        for (p <- pizzas) {
          res += p.toString() + "\n"
        }

      if (drinks != null)
        for (d <- drinks) {
          res += d.toString() + "\n"
        }

      res += "Total: " + price + "$"

      res
    }

    def extraMeatPrice: Option[Double] = {
      if (pizzas == null)
        None

      val pizzasWithMeat = pizzas.filter(pizza => pizza.extraMeat != None)

      if (pizzasWithMeat.length == 0)
        None
      else
        Some(pizzasWithMeat.map(pizza => pizza.extraMeat.get.price).sum)
    }
    
    def pizzasPrice: Option[Double] = {
      if (pizzas == null || pizzas.length == 0)
        None

      Some(pizzas.map(p => p.price).sum)
    }
    
    def drinksPrice: Option[Double] = {
      if (drinks == null || drinks.length == 0)
        None

      Some(pizzas.map(p => p.price).sum)
    }
    
    def priceByType(pizzaType: PizzaType): Option[Double] = {
      if (pizzas == null)
        None

      val pizzasOfType = pizzas.filter(p => p.pizzaType == pizzaType)

      if (pizzasOfType.length == 0)
        None
      
      Some(pizzasOfType.map(p => p.price).sum)
    }
    
    val price: Double = {
      val pPrice = pizzasPrice match {
        case None => 0
        case Some(value) => value
      }
      val dPrice = drinksPrice match {
        case None => 0
        case Some(value) => value
      }

      if (discount == Senior)
        (pPrice + dPrice) * (1-discount.value)
      else if (discount == Student)
        pPrice * (1-discount.value) + dPrice
      else
        pPrice + dPrice
    }

    private def validatePhone(): Boolean =  {
      val regex = raw"\d{9}".r;

      phone match {
        case regex(_*) => true
        case _ => false
      }
    }
  }
}

object lab06 {
  import pizzeria._
  import orders._
  def main(args: Array[String]): Unit = {
    val p = Pizza(Margarita, Regular, Thick, Some(Salami), None)
    println(p)
    println(p.price)
    val p2 = Pizza(Funghi, Large, Thin, None, Some(Garlic))
    println(p2)
    println(p2.price)

    val order = new Order("Jan Kowalski", "Plac Grunwaldzki 1/2", "123123123", List(p, p2), null, Student, "Hello World")
  
    println(order)
  }
}
