t = 1024
setprecision(t)

using Printf

function arctg_taylor(x,k)
    x = BigFloat(x)
    sum = 0
    for i = 0:k
        if i % 2 == 0
            sum += x^(2*i+1)/(2*i+1)
        else
            sum -= x^(2*i+1)/(2*i+1)
        end
    end
    return sum
end


function arcctg_taylor(x,k)
    return  BigFloat(pi/2)-arctg_taylor(x,k)
 end

#liczenie błędu arctg
function avg_error(k)
    iterations = 0
    error_sum = BigFloat(0.0)
    for i = -0.99:0.01:0.99
        if i!=0
            x = arctg_taylor(BigFloat(i), k)
            y = atan(BigFloat(i))
            if y!=0
                error_sum += BigFloat(abs((x-y)/y))
                iterations+=1
            end
        end
    end
    error_avg = error_sum/BigFloat(iterations)
    return error_avg
end


#liczenie błędu arcctg
function avg_error2(k)
    iterations = 0
    error_sum = BigFloat(0.0)
    for i = -0.99:0.01:0.99
        if i!=0
            x = arcctg_taylor(BigFloat(i), k)
            y = arccot(BigFloat(i))
            if y!=0
                error_sum += BigFloat(abs((x-y)/y))
                iterations+=1
            end
        end
    end
    error_avg = error_sum/BigFloat(iterations)
    return error_avg
end


function sin_taylor(x,k)
    x = BigFloat(x)
    sum = 0
    power = x
    fact = 1
    for i = 0:k
        if i % 2 == 0
            sum += BigFloat(power/fact)
        else
            sum -= BigFloat(power/fact)
        end
        power = BigFloat(power*x^2)
        fact = BigFloat(fact*(2*(i+1))*(2*(i+1)+1))
    end
    return sum
end

function cos_taylor(x,k)
    x = BigFloat(x)
    sum = 0
    power = 1
    fact = 1
    for i = 0:k
        if i % 2 == 0
            sum += BigFloat(power/fact)
        else
            sum -= BigFloat(power/fact)
        end
        power = BigFloat(power*x^2)
        fact = BigFloat(fact*(2*(i+1)-1)*(2*(i+1)))
    end
    return sum
end

function tg_taylor(x,k)
    return sin_taylor(x,k)/cos_taylor(x,k)
end

function ctg_taylor(x,k)
    return cos_taylor(x,k)/sin_taylor(x,k)
end




#funkcja znajdująca x z przedziału (a,b) taki, że f(x)=y
function bisect(f,y,a,b, epsilon)
    p = BigFloat(a)
    q = BigFloat(b)
    while (abs(p-q)>epsilon)
        s = (p+q)/2.0
        if abs(f(s)-y) <= epsilon
            break
        elseif (f(s)-y) * (f(p)-y) < 0
            q = s 
        else
            p = s
        end
    end

    return (p+q)/2
end

tg(x)=tg_taylor(x,200)
arctg(x) = bisect(ctg,x,-pi/2,pi/2,10^(-16))

ctg(x) = ctg_taylor(x,100)
arcctg(x) = bisect(ctg,x,0,pi,10^(-16))