global i = Float64(1)
println(i)
while i < 10
    global i
    println(i)
    i+=1.0
end
