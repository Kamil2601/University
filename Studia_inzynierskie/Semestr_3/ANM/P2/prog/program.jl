setprecision(1024)

function halley(f,f1,f2,n,x0)
    x = BigFloat(x0)
    for i = 1:n
        f_val = f(x)
        f1_val = f1(x)
        f2_val = f2(x)
        x = x - f_val / (f1_val - f2_val/(2*f1_val)*f_val)
    end
    return x
end
using Printf

function quasi_halley(f,f1,n,x0,x1)
    x2 = BigFloat(0.0)
    x0 = BigFloat(x0)
    x1 = BigFloat(x1)
    #@printf("%f\n",f1(0.0))
    for i = 1:n
        f0_val = f(x0)
        f1_val = f(x1)
        g0 = f1(x0)
        g1 = f1(x1)
        x2 = x1 - f1_val / (g1 - (g1 - g0)/(2*(x1-x0)*g1)*f1_val)
        #@printf("%.10e ", x2)
        x0 = x1
        x1 = x2
    end
    #@printf("\n")
    return x2
end
using Printf;
function  rf_quasi_halley(f,f1,n,x0,x1)
    x2 = BigFloat(0.0)
    x0 = BigFloat(x0)
    x1 = BigFloat(x1)
    #@printf("%f\n",f1(0.0))
    for i = 1:n
        f0_val = f(x0)
        f1_val = f(x1)
        g0 = f1(x0)
        g1 = f1(x1)
        x2 = x1 - f1_val / (g1 - (g1 - g0)/(2*(x1-x0)*g1)*f1_val)
        if f1_val*f(x2)<0
            x0 = x1
        end
        x1 = x2
    end

    return x2
end

function newton(f,f1,n,x0)
    x = BigFloat(x0)
    for i = 1:n
        x = x - f(x)/f1(x)
    end
    return x
end

function secant(f,n,x0,x1)
    x2 = 0
    x0 = BigFloat(x0)
    x1 = BigFloat(x1)
    for i = 1:n
        f0 = f(x0)
        f1 = f(x1)
        x2 = x1 - f1*(x1-x0)/(f1-f0)
        x0 = x1
        x1 = x2
    end

    return x2
end
using Printf
function regula_falsi(f,n,x0,x1)
    x2 = 0
    x0 = BigFloat(x0)
    x1 = BigFloat(x1)
    for i = 1:n
        if x1 == x0
            break
        end
        f0 = f(x0)
        f1 = f(x1)
        x2 = x1 - f1*(x1-x0)/(f1-f0)
        
        if f(x1)*f(x2) < 0
            x0 = x1
        end
        x1 = x2
    end

    return x2
end


using Printf

function test1(f,f1,f2,x0,n_max,root)
    for i = 1:n_max
        newton_res = newton(f,f1,i,x0)
        halley_res = halley(f,f1,f2,i,x0)
        
        newton_err = abs((newton_res-root)/root)
        halley_err = abs((halley_res-root)/root)
        
        @printf("%0.5e %0.5e", halley_err, newton_err)
    end
end

function test2(f,f1,x0,x1,n_max,root)
    @printf("%.300f\n",root)
    for i = 1:n_max
        secant_res = secant(f,i,x0,x1)
        falsi_res = regula_falsi(f,i,x0,x1)
        halley_res = quasi_halley(f,f1,i,x0,x1)
        #rf_halley_res = rf_quasi_halley(f,f1,i,x0,x1)
        secant_err = abs((secant_res-root)/root)
        halley_err = abs((halley_res-root)/root)
        falsi_err = abs((falsi_res-root)/root)
        #rf_halley_err = abs((rf_halley_res-root)/root)
        
        @printf("%0.5e %0.5e\n", halley_err, secant_err)
    end
end

f(x) = x^2-2
f1(x) = 2*x
x0 = BigFloat(1.0)
x1 = newton(f,f1,1,x0)

@printf("%.300f\n", sqrt(BigFloat(2.0)))

@printf("%.5e\n", regula_falsi(f,10,x0,x1))

#quasi_halley(f,f1,3,1.0,3.0)
x0 = BigFloat(1.0)
x1 = BigFloat(2.0)
test2(f,f1,x0,x1,20,sqrt(BigFloat(2.0)))



s(x) = -sin(x)

#=
for i = 1:10
    h_sin = halley(sin,cos,s,i,2.0)
    n_sin = newton(sin,cos,i,2.0)
    @printf("%.5e %.5e\n", abs(h_sin-BigFloat(pi))/BigFloat(pi), abs(n_sin-BigFloat(pi))/BigFloat(pi))
end
=#