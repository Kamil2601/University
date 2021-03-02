// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L1, z1, Pojazdy
// Edytor samochodu
// Edytor_s.java
// 2018-04-12


import javax.swing.*;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;


//Klasa edytora
class Edytor_s extends JPanel implements ActionListener
{
    private static final long serialVersionUID = 1L;

    //Pola edytora
    JButton zapisz;
    JButton wyjdz;
    JTextField marka, kolor, rocznik, vmax, spal, poj;
    Samochod sam;

    //Konstruktor
    Edytor_s()
    {
        sam = new Samochod("Toyota", "niebieski", 2000, 200, 6.5, 2.5);
        sam.odczyt("plik");
        marka = new JTextField("", 80);
        kolor = new JTextField("", 80);
        rocznik = new JTextField("", 80);
        vmax = new JTextField("", 80);
        spal = new JTextField("", 80);
        poj = new JTextField("", 80);
        zapisz = new JButton("Zapisz");

        //Siatka pól
        setLayout(new GridLayout(7,3));

        add(new JLabel("marka", SwingConstants.CENTER));
        add(marka);
        add(new JLabel("kolor", SwingConstants.CENTER));
        add(kolor);
        add(new JLabel("rocznik", SwingConstants.CENTER));
        add(rocznik);
        add(new JLabel("vmax", SwingConstants.CENTER));
        add(vmax);
        add(new JLabel("spalanie",SwingConstants.CENTER));
        add(spal);
        add(new JLabel("pojemnosc", SwingConstants.CENTER));
        add(poj);
        add(new JLabel(""));
        add(zapisz);
        zapisz.addActionListener(this);
    }

    public void actionPerfored(ActionEvent e)
    {

    }

    //Metoda uruchamiana wciśnięciem przycisku
    public void actionPerformed(ActionEvent e)
    {
        //Pobranie wartości pól teskstowych
        String s_kolor = kolor.getText();
        String s_marka = marka.getText();
        String s_rocznik = rocznik.getText();
        String s_vmax = vmax.getText();
        String spal = vmax.getText();
        String s_poj = poj.getText();


        //Zmiany w obiekcie
        if (s_kolor.length() != 0)
        {
            sam.kolor = s_kolor;
        }
        if (s_marka.length() != 0)
        {
            sam.marka = s_marka;
        }
        if (s_rocznik.length() != 0)
        {
            sam.rocznik = Integer.parseInt(s_rocznik);
        }
        if (s_vmax.length() != 0)
        {
            sam.vmax = Integer.parseInt(s_vmax);
        }
        if (s_spal.length() != 0)
        {
            sam.spal = Double.parseDouble(spal);
        }
        if (s_poj.length() != 0)
        {
            sam.poj = Double.parseDouble(s_poj);
        }

        //zapis do pliku
        sam.zapis("plik");
    }
}