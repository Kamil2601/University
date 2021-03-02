let x = 1.0
    n = 0
    while  x<1.000001
        if x * (1.0 / x) != 1.0
            println(x, " ", bitstring(x))
            n+=1
        end
        x = nextfloat(x)    
    end
   println(n) 
end