#Kamil Michalak
#Pracownia PO, czwartek, s. 108
#L10, z1, Kolekcja
#Kolekcja
#Kolekcja.rb
#2018-05-16

#klasa Kolekcja
class Kolekcja

    #inicjowanie tablicą
    def initialize(t)
        @tab = t
    end

    #dodanie elementu
    def push(x)
        @tab.push(x)
    end

    #usunięcie elementu
    def delete(x)
        @tab.delete(x)
    end

    #usunięcie ostatniego elementus
    def pop()
        @tab.pop()
    end

    #zamiana 2 elementów miejscami
    def swap(i,j)
        @tab[i],@tab[j] = @tab[j],@tab[i]
    end

    #zwrócenie i-tego elementu z kolekcji
    def get(i)
        return @tab[i]
    end

    #zwrócenie liczby elementów kolekcji
    def length()
        return @tab.length
    end
    
    #wypisanie kolekcji
    def write()
        print @tab,"\n"
    end

end

class Sortowanie
    #sortowanie bąbelkowe
    def sort1(kol)
        for i in (kol.length()-2).downto(0)
            for j in (0..i)
                if kol.get(j)>kol.get(j+1)
                    kol.swap(j,j+1)
                end
            end
        end
    end

    #sortowanie szybkie
    def sort2(kol)
        quicksort(kol,0,kol.length-1)
    end 

    def quicksort(kol, first, last)
        if first < last
          p_index = partition(kol, first, last)
          quicksort(kol, first, p_index - 1)
          quicksort(kol, p_index + 1, last)
        end
    end
      
    def partition(kol, first, last)
    pivot = kol.get(last)
    p_index = first
    i = first
    while i < last
        if kol.get(i) <= pivot
        kol.swap(i, p_index)
        p_index += 1
        end
        i += 1
    end
    kol.swap(p_index,last)

    return p_index
    end

end


k = Kolekcja.new([])

for i in (0...10000)
    k.push(Random.new.rand(10000))
end

k.write

Sortowanie.new.sort1(k)

k.write
