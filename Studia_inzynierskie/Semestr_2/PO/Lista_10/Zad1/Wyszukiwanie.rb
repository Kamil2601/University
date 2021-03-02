#Kamil Michalak
#Pracownia PO, czwartek, s. 108
#L10, z1, Wyszukiwanie
#Wyszukiwanie
#Wyszukiwanie.rb
#2018-05-16

class Sortowanie
    def sort1(kol)
        for i in (kol.length()-2).downto(0)
            for j in (0..i)
                if kol.get(j)>kol.get(j+1)
                    kol.swap(j,j+1)
                end
            end
        end
    end

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


class Kolekcja
    def initialize(t)
        @tab = t
        Sortowanie.new.sort2(self)
    end

    def push(x)
        @tab.push(x)
        i = tab.length-1
        while (tab[i]>tab[i-1])
            swap(i,i-1)
            i-=1
        end    
    end

    def delete(x)
        @tab.delete(x)
    end

    def pop()
        @tab.pop()
    end

    def swap(i,j)
        @tab[i],@tab[j] = @tab[j],@tab[i]
    end

    def get(i)
        return @tab[i]
    end

    def length()
        return @tab.length
    end
    def write()
        print @tab, "\n"
    end
end


class Wyszukiwanie
    def liniowe(kol, x)
        for i in (0...kol.length)
            if kol.get(i)==x
                return true
            end
        end
        return false
    end

    def binarne(kol, x)
        p = 0
        q = kol.length-1
        s = p+q/2
        if kol.get(p)==x || kol.get(q)==x || kol.get(s)==x
            return true
        end

        while p<q
            s = (p+q)/2
            if kol.get(s)==x
                return true
            elsif kol.get(s)<x
                p = s+1
            else
                q = s
            end
        end
        return false
    end
end



kol = Kolekcja.new([3,5,1,8,3,12,56,23,67,23,34,12,67,4,2,1,67,23,45,12,53,23,67,2,1,3,5,67,23,234,54])
kol.write
puts Wyszukiwanie.new.binarne(kol,250)

kol2 = Kolekcja.new([23,234,1,4,2,56,56,26,48,12,3,64,9,56,458,642,486,45,6,86,626,98,64,213,6,49,453])
kol2.write
puts

