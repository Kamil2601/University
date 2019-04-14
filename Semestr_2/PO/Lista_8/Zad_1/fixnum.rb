#Kamil Michalak
#Pracownia PO, czwartek, s. 108
#L8, z1, Fixnum
#fixnum
#fixnum.rb
#2018-04-19

#Rozszerzona klasa Fixnum

class Fixnum
    #Rozkład na czynnik
    def czynniki
        tab = Array.new()
        for i in (1..self)
            if self % i == 0
                tab.push(i)
            end
        end
        return tab
    end

    #Obliczanie funkcji Ackermana
    def ack(y)
        if self == 0
            return y+1
        elsif y == 0
            return (self-1).ack(1)
        else
            return (self-1).ack(self.ack(y-1))
        end
    end

    #Sprawdzenie, czy liczba jest doskonała
    def doskonala()
        tab = self.czynniki()
        suma = 0
        tab.pop(1)
        for el in tab
            suma+=el
        end
        if suma == self
            return true
        else
            return false
        end
    end

    #Zamiana liczby na wersję słowną
    def slownie()
        if self==0
            return "zero"
        end
        wynik = ""
        liczba = self
        while liczba>0
            x = liczba % 10
            case x
            when 1
                wynik="jeden " + wynik
            when 2
                wynik="dwa " + wynik
            when 3
                wynik="trzy " + wynik
            when 4
                wynik="cztery " + wynik
            when 5
                wynik="piec " + wynik
            when 6
                wynik="szesc " + wynik
            when 7
                wynik="siedem " + wynik
            when 8
                wynik="osiem " + wynik
            when 9
                wynik="dziewiec " + wynik
            else
                wynik="zero " + wynik
            end
            liczba/=10
        end
        return wynik
    end
end


#testy funkcji Ackermana

puts "Wyniki funkcji Ackermana"

print 0.ack(0)," ", 0.ack(1)," ", 0.ack(2), " ", 0.ack(3)," ", 0.ack(4)
puts

print 1.ack(0)," ", 1.ack(1)," ", 1.ack(2), " ", 1.ack(3)," ", 1.ack(4)
puts

print 2.ack(0)," ", 2.ack(1)," ", 2.ack(2), " ", 2.ack(3)," ", 2.ack(4)
puts

print 3.ack(0)," ", 3.ack(1)," ", 3.ack(2), " ", 3.ack(3)," ", 3.ack(4)
puts

print 4.ack(0)
puts

puts

#testy metody czynniki

puts "Dzielniki"
print "0: ", 0.czynniki,"\n"
print "1: ", 1.czynniki,"\n"
print "2: ", 2.czynniki,"\n"
print 12.czynniki,"\n"
print 1024.czynniki,"\n"
print 33.czynniki,"\n"

#testy metody doskonala
puts
puts "Doskonala"
print 1," - ",1.doskonala,"\n"
print 6," - ",6.doskonala,"\n"
print 10," - ",10.doskonala,"\n"
print 28," - ", 28.doskonala,"\n"
print 1024," - ", 1024.doskonala,"\n"

#testy metody slownie

puts
puts "Zapis slowny"
print 1," - ", 1.slownie,"\n"
print 234," - ", 234.slownie,"\n"
print 98723411, " - ", 98723411.slownie,"\n"
print 000, " - ", 000.slownie,"\n"