S(f,a,b) = (b-a)/6*(f(a)+4*f((a+b)/2)+f(b))
T(f,a,b) = (b-a)/2*(f(a)+f(b))

function Simpson(m)
    h = pi/(2m)
    sum = 0

    for i = 0:m-1
        a = 2*i*h
        b = 2*(i+1)*h
        sum += S(sin,a,b)
    end

    return sum
end

function Trapez(n)
    h = pi/n

    sum = 0

    for i = 0:n-1
        a = i*h
        b = (i+1)*h
        sum += T(sin,a,b)
    end

    return sum
end


using Printf
err = 10
i = 1
while err > 0.00002
    global err = abs(Simpson(i)-2.0)
    @printf("%d %.10f\n",2*i, err)
    global i=i+1
end

@printf "\n\n"
err = 10
i = 1
while err > 0.00002
    global err = abs(Trapez(i)-2.0)
    @printf("%d %.10f\n",i, err)
    global i=i+1
end