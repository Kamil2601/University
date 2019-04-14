function Newton(f,fp,n,x0)
        x = x0
        for i = 1:n
            x = x - f(x)/fp(x)
        end

        return x
end

using Printf
function sieczne(f,n,a,b)
    x0 = a
    x1 = b
    x2 = 0    
    for i = 1:n
        x2 = x1-f(x1)*((x1-x0)/(f(x1)-f(x0)))
        x0 = x1
        x1 = x2
        if isnan(x2)
            return (x0,i)
        end
    end

    return (x0,n)
end

function sieczne2(f,n,a,b)
    x0 = a
    x1 = b
    x2 = 0
    for i = 1:n
        x2 = (f(x1)*x0-f(x0)*x1)/(f(x1)-f(x0))
        x0 = x1
        x1 = x2
        if isnan(x2)
            return (x0,i)
        end
    end

    return (x0,n)
end


setprecision(1024)

f(x) = x^2-612
g(x) = x^3-612
h(x) = sin(x)*x

a = BigFloat(2.0)
b = BigFloat(3.0)

w1 = sieczne(h,100,a,b)
w2 = sieczne2(h,100,a,b)

@printf "%0.100e %d\n" w1[1] w1[2]
@printf "%0.100e %d\n" w2[1] w2[2]

println(w1[1]-w2[1])
println(abs(w1[1]-pi))
println(abs(w2[1]-pi))