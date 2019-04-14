using Printf
t = 1024
setprecision(t)
@printf "%d\n" t

function c(k)
    if k==2
        return BigFloat(0.0)
    else
        return sqrt(BigFloat(0.5) * (BigFloat(1.0) + c(k-1)))
    end
end

function s(k)
    if k==2
        return BigFloat(1.0)
    else
        return sqrt(BigFloat(0.5) * (BigFloat(1.0) - c(k-1)))
    end
end


function P(k)
    return BigFloat(2.0)^(k-1)*s(k)
end


for i in 2:1:t
    @printf "%d %.100f\n" i abs(P(i)-pi)/pi
end