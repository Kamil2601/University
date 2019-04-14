function convert(iee)
    if iee[1]=='0'
        sign=1 
    else 
        sign=-1
    end
    exp_str = iee[2:12]
    global exp
    exp = -1023
    for i in 1:1:11
        if exp_str[i]=='1'
            exp+=2^(11-i)
        end
    end
    global mant_str
    mant_str = iee[13:64]
    global mant
    mant = 1.0
    for i in 1:1:52
        if mant_str[i]=='1'
            mant += (1/2.0^i)
        end
    end
    return sign*mant*2.0^exp
end

println(convert(bitstring(1234.478)))
println(convert(bitstring(123.3453)))
println(convert(bitstring(23.00)))
println(convert(bitstring(2344.444)))
println(convert(bitstring(1234.123)))
println(convert(bitstring(674.5)))
println(convert(bitstring(0.9)))
