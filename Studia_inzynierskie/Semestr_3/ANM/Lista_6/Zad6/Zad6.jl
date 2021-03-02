f(x) = exp(atan(x))

function lambda(k,vals)
    res(x) = 1
    for i = 1:length(values)
        if i!= k
            f(x) = (x-values[i][1])/(values[k][1]-values[i][1])
            res(x) = res(x) * f(x)
        end
    end

    return res(x)
end

function pol_int(n, f)
    start = -5.0
    stop = 5.0
    step = 10.0/n
    L(x) = 0
    values = []
    
    for i = start:step:stop
        push!(values,(i,f(i)))
    end


    for i = 1:(n+1)
        L(x)=L(x) + lambda(k,values)(x)
    end

    return L(x)
end

