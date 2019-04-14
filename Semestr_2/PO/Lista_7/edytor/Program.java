// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L1, z1, Pojazdy
// Program
// Program.java
// 2018-04-12

import javax.swing.JFrame;

public class Program
{
    public static void main(String[] args)
    {
        //Utworzenie edytora tramwaju
        Edytor_t e = new Edytor_t();
        JFrame ramka = new JFrame();
        ramka.setSize(300, 300);
        ramka.setTitle("Tramwaj");
        ramka.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        ramka.add(e);
        ramka.setVisible(true);
    } 
}