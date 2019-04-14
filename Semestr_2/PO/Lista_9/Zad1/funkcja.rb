#Kamil Michalak
#Pracownia PO, czwartek, s. 108
#L8, z1, Funkcja
#fixnum
#fixnum.rb
#2018-04-19


class Funkcja
    def initialize(f)
        @funkcja = f
    end

    def value(x)
        return @funkcja.call(x)
    end

    def zerowe(a,b,e)
        s = (a+b).to_f()/2
        p = a
        q = b

        puts s
        
        while value(s) > e or value(s) < -e
            if value(p)*value(q)>0
                puts "Brak miejsca zerowego"
                return nil
            end
            if (value(s)*value(p))<0
                q = s
            else
                #puts "b"
                p = s

            end
            s = (p+q).to_f/2
        end
        return s
    end

    def pole(a,b)
        dl = b-a
        n = (dl*20).to_int
        dl = dl.to_f/n
        pole = 0
        s = dl.to_f/2
        for i in (0...n)
            pole+=(dl*value(s)).abs
            s+=dl
        end
        return pole
    end

    def poch(x)
        h = 0.0000001
        p = (value(x.to_f+h)-value(x))/h
        return p
    end

    def rysuj(a,b)
        wys = 25
        szer = 60
        wykres = Array.new(wys+1) {Array.new(szer)}
        for i in (0..wys)
            for j in (0...szer)
                wykres[i][j]=0
            end
        end
        odc = (b-a).to_f()/szer
        start = a+odc/2
        wart = Array.new(szer)
        for i in (0...szer)
            wart[i] = value(start+odc*i)
        end

        minimum = wart[0]
        maksimum = wart[0]

        for el in wart
            if el>maksimum
                maksimum = el
            end
            if el<minimum
                minimum=el
            end
        end

        roznica = maksimum - minimum
        stopniowanie = roznica.to_f/wys

        #print wart, '\n'
    
        '''
        puts "tutaj"
        for i in (0...szer)
            puts ((wart[i]-minimum)/stopniowanie).to_int
        end
        '''
        if stopniowanie>0
            for i in (0...szer)
                wykres[((wart[i]-minimum)/stopniowanie).to_int][i]=1
            end
        else
            for i in (0...szer)
                wykres[wys/2.to_int][i]=1
            end
        end


        for i in (-wys..0)

            for j in (0...szer)
                if wykres[-i][j]==1
                    print "*"
                else
                    print " "
                end
            end
            print"\n"
        end
                  
    end
end



f = Funkcja.new(Proc.new{|x|Math.sin(x)})

puts f.value(1)


#f.rysuj(-5,5)

f.rysuj(-5,5)
