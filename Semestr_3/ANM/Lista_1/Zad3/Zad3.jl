using Printf
w(x) = x^3 - 6*x^2 + 3*x - 0.149
@printf "Wielomian w formie x^3 - 6*x^2 + 3*x - 0.149\n\n"
val=-14.636489
println("float64")
res=w(4.71)
@printf "wynik: %f\n" res
@printf "Blad wzgledny: %f\n\n" abs((res-val)/val)

println("float32")
res=w(Float32(4.71))
@printf "wynik: %f\n" res
@printf "Blad wzgledny: %f\n\n" abs((res-val)/val)

println("float16")
res=w(Float16(4.71))
@printf "wynik: %f\n" res
@printf "Blad wzgledny: %f\n\n\n" abs((res-val)/val)


w(x) = ((x-6)*x+3)*x-0.149
@printf "Wielomian w formie ((x − 6)x + 3)x − 0.149\n\n"
val=-14.636489
println("float64")
res=w(4.71)
@printf "wynik: %f\n" res
@printf "Blad wzgledny: %f\n\n" abs((res-val)/val)

println("float32")
res=w(Float32(4.71))
@printf "wynik: %f\n" res
@printf "Blad wzgledny: %f\n\n" abs((res-val)/val)

println("float16")
res=w(Float16(4.71))
@printf "wynik: %f\n" res
@printf "Blad wzgledny: %f\n" abs((res-val)/val)