// Kamil Michalak
// Pracownia PO, czwartek, s. 108
// L1, z1, Pojazdy
// Edytor tramwaju
// Edytor_t.java
// 2018-04-12

import javax.swing.*;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.FileInputStream;
import java.io.ObjectInputStream;
import java.io.Serializable;

//Klasa edytora
class Edytor_t extends JPanel implements ActionListener, Serializable
{
    private static final long serialVersionUID = 1L;

    //Pola edytora
    JButton zapisz;
    JButton wyjdz;
    JTextField marka, kolor, rocznik, linia, nr, miejsc;
    Tramwaj tram;


    //Konstruktor
    Edytor_t()
    {
        tram = new Tramwaj("", "", 0, 0, 0, 0);
        tram.odczyt("plik");
        marka = new JTextField(tram.marka, 80);
        kolor = new JTextField(tram.kolor, 80);
        rocznik = new JTextField(Integer.toString(tram.rocznik), 80);
        linia = new JTextField(Integer.toString(tram.linia), 80);
        nr = new JTextField(Integer.toString(tram.nr_tramwaju), 80);
        miejsc = new JTextField(Integer.toString(tram.miejsc), 80);
        zapisz = new JButton("Zapisz");

        //Siatka pól
        setLayout(new GridLayout(7,3));

        add(new JLabel("marka", SwingConstants.CENTER));
        add(marka);
        add(new JLabel("kolor", SwingConstants.CENTER));
        add(kolor);
        add(new JLabel("rocznik", SwingConstants.CENTER));
        add(rocznik);
        add(new JLabel("linia", SwingConstants.CENTER));
        add(linia);
        add(new JLabel("nr tramwaju",SwingConstants.CENTER));
        add(nr);
        add(new JLabel("miejsc", SwingConstants.CENTER));
        add(miejsc);
        add(new JLabel(""));
        add(zapisz);
        zapisz.addActionListener(this);
    }

    public void actionPerfored(ActionEvent e)
    {

    }

    public void actionPerformed(ActionEvent e)
    {
        
        //Pobranie wartości pól teskstowych
        String t_kolor = kolor.getText();
        String t_marka = marka.getText();
        String t_rocznik = rocznik.getText();
        String t_linia = linia.getText();
        String t_nr = nr.getText();
        String t_miejsc = miejsc.getText();

        //Zmiany w obiekcie
        if (t_kolor.length() != 0)
        {
            tram.kolor = t_kolor;
        }
        if (t_marka.length() != 0)
        {
            tram.marka = t_marka;
        }
        if (t_rocznik.length() != 0)
        {
            tram.rocznik = Integer.parseInt(t_rocznik);
        }
        if (t_linia.length() != 0)
        {
            tram.linia = Integer.parseInt(t_linia);
        }
        if (t_nr.length() != 0)
        {
            tram.nr_tramwaju = Integer.parseInt(t_nr);
        }
        if (t_miejsc.length() != 0)
        {
            tram.miejsc = Integer.parseInt(t_miejsc);
        }

        //zapis do pliku
        tram.zapis("plik");
    }

    
}