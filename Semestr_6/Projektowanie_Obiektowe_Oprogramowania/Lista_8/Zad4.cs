using System;
using System.IO;
using System.Collections.Generic;

public class Product
{
    public string name;
    public float prize;
    public int count;

    public Product(string name, float prize, int count)
    {
        this.name = name;
        this.prize = prize;
        this.count = count;
    }
}

namespace Zad4
{
    public class VendingMachine
    {
        private IVendingMachineState state;
        public List<Product> products;
        public int chosenProduct;

        public VendingMachine(List<Product> products)
        {
            this.products = products;
        }

        public void SetState(IVendingMachineState state)
        {
            this.state = state;
        }

        public void ChooseProduct(int productNumber)
        {
            state.ChooseProduct(productNumber);
        }
    }

    public interface IVendingMachineState
    {
        void ChooseProduct(int productNumber);
        void Pay(float cash);
        void Resign();
    }

    public class WaitForClientVendingMachineState : IVendingMachineState
    {   
        private VendingMachine machine;

        public WaitForClientVendingMachineState(VendingMachine machine)
        {
            this.machine = machine;
        }

        public void ChooseProduct(int productNumber)
        {
            if (productNumber >= machine.products.Count)
            {
                throw new ArgumentException();
            }
            else if (machine.products[productNumber].count == 0)
            {
                throw new ArgumentException();
            }
            else
            {
                machine.chosenProduct = productNumber;
                machine.SetState(new WaitForMoneyVendingMachineState(machine));
                Console.WriteLine("Chosen product: {0}", machine.products[productNumber].name);
                Console.WriteLine("To pay: {0}", machine.products[productNumber].prize);
            }
        }

        public void Pay(float cash)
        {
            throw new Exception();
        }

        public void Resign()
        {
            return;
        }
    }

    public class WaitForMoneyVendingMachineState : IVendingMachineState
    {
        VendingMachine machine;
        float paid;
        

        public WaitForMoneyVendingMachineState(VendingMachine machine)
        {
            this.paid = 0f;
            this.machine = machine;
        }

        public void ChooseProduct(int productNumber)
        {
            throw new Exception();
        }

        public void Pay(float cash)
        {
            float productPrize = machine.products[machine.chosenProduct].prize;
            paid += cash;
            if (paid > productPrize)
            {
                float change = paid - productPrize;
                Console.WriteLine("Take your change: {0}", change);
            }
            if (paid >= productPrize)
            {
                Console.WriteLine("Take your product");
                machine.products[machine.chosenProduct].count--;
                machine.SetState(new WaitForClientVendingMachineState(machine));
            }
            else
            {
                Console.WriteLine("To pay: {0}",productPrize - paid);
            }
        }

        public void Resign()
        {
            if (paid > 0)
            {
                Console.WriteLine("Take back your money: {0}", paid);
            }
            machine.SetState(new WaitForClientVendingMachineState(machine));
        }
    }

    public class Program
    {
        public static void Main()
        {
            
        }
    }
}