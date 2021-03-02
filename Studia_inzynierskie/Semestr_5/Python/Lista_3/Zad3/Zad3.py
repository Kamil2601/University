
def sudan(n,x,y):
    return sudan_mem(n,x,y,{})

def sudan_mem(n,x,y,mem):
    if (n,x,y) in mem.keys():
        return mem[(n,x,y)]
    if n==0:
        mem[(n,x,y)] = x+y
    elif y==0:
        mem[(n,x,y)] = x
    else:
        mem[(n,x,y)] = sudan_mem(n-1,sudan_mem(n,x,y-1,mem),sudan_mem(n,x,y-1,mem)+y,mem)
    return mem[(n,x,y)]


print("sudan(2,5,2) = ", sudan(2,5,2))
print("sudan(1,1,1) = ", sudan(1,1,1))
print("sudan(2,2,2) = ", sudan(2,2,2))


for x in range(11):
    for y in range(11):
        print("sudan(1,{},{}) = {}".format(x,y,sudan(1,x,y)))