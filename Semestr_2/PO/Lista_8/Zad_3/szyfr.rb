#Kamil Michalak
#Pracownia PO, czwartek, s. 108
#L8, z3, Szyfrowanie
#szyfr
#szyfr.rb
#2018-04-19

#klasa Jawna
class Jawna

    #Konstruktor
    def initialize(x)
        @napis = x
    end

    #Metoda szyfrująca z argumentem kluczem
    def zaszyfruj(klucz)
        #napis wynikowy
        zaszyfr = ""
        for i in (0...@napis.length)
                #zamiana każdej litery według klucza
                if (klucz.member?(@napis[i]))
                    zaszyfr += klucz[@napis[i]]
                else
                    zaszyfr +=@napis[i]
                end
        end
        #zwrócenie nowego obiektu
        return Zaszfrowana.new(zaszyfr)
    end

    #metoda to_s
    def to_s()
        return @napis
    end
end


#klasa Zaszyfrowana
class Zaszfrowana
    
    #Konstruktor
    def initialize(x)
        @napis = x
    end

    #Metoda odszyfrowująca
    def odszyfruj(klucz)
        odszyfr = ""
        #odwrócenie klucza
        n_klucz = klucz.invert()
        for i in (0...@napis.length())
            #zamiana liter
            if (n_klucz.member?(@napis[i]))
                odszyfr+=n_klucz[@napis[i]]
            else
                odszyfr +=@napis[i]
            end
        end
        #Zwrócenie nowego obiektu
        return Jawna.new(odszyfr)
    end

    #metoda to_s
    def to_s()
        return @napis
    end
end

klucz = {
    'a'=>'b',
    'b'=>'c',
    'c'=>'a',
    'd'=>'f',
    'e'=>'g',
    'g'=>'z',
    'z'=>'o',
    'o'=>'d',
    'p'=>'h',
    'h'=>'l',
    'l'=>'n',
    'n'=>'m',
    'm'=>'p'
}

klucz2 = {
    'a'=>'b',
    'b'=>'c',
    'c'=>'q',
    'q'=>'m',
    'm'=>'q'
}

print klucz, "\n"

test1 = Jawna.new("konstantynopolitanczykowianeczka, jakies losowe"+
    "slowa, raz dwa trzy siedem, jakub grobelny")
zasz1 = test1.zaszyfruj(klucz)
odsz1 = zasz1.odszyfruj(klucz)
print test1," => \n",zasz1, " => \n", odsz1, "\n"

test2 = Jawna.new("przykladowy tekst numer dwa i jeszcze troche tekstu")
zasz2 = test2.zaszyfruj(klucz)
odsz2 = zasz2.odszyfruj(klucz)
print test2," => \n",zasz2, " => \n", odsz2, "\n"

test3 = Jawna.new("ala ma kota")
zasz3 = test3.zaszyfruj(klucz)
odsz3 = zasz3.odszyfruj(klucz)
print test3," => ",zasz3, " => ", odsz3, "\n"

test4 = Jawna.new("litwo, ojczyzno moja ty jestes jak zdrowie ile cie trzeba cenic\n"+
    "ten tylko sie dowie kto cie stracil \ndzis pieknosc twa w calej ozdobie widze i opisuje\n"+
    "bo tesknie po tobie")
zasz4 = test4.zaszyfruj(klucz)
odsz4 = zasz4.odszyfruj(klucz)
print test4," =>\n ",zasz4, " => \n", odsz4, "\n"

test5 = Jawna.new("Jeszcze jeden test")
zasz5 = test5.zaszyfruj(klucz)
odsz5 = zasz5.odszyfruj(klucz)
print test5," => ",zasz5, " => ", odsz5, "\n"



