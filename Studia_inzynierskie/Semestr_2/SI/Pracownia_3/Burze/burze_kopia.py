def V(i,j):
    return 'V%d_%d' % (i,j)

def domains(Vs):
    return [ q + ' in 0..1' for q in Vs ]

def rzedy(rows,cols):
    res = []
    for i in range(len(rows)):
        suma = ""
        for j in range(len(cols)-1):
            suma += V(i,j) + ' + '
        suma += V(i,len(cols)-1) + ' #= ' + str(rows[i])
        res.append(suma)
    return res

def kolumny(rows,cols):
    res = []
    for i in range(len(cols)):
        suma = ""
        for j in range(len(rows)-1):
            suma += V(j,i) + ' + '
        suma += V(len(rows)-1,i) + ' #= ' + str(cols[i])
        res.append(suma)
    return res

def startowe(triples):
    res = []
    for x in triples:
        res.append(V(x[0],x[1]) + ' #= ' + str(x[2]))
    return res
'''
def brzegi(wys,szer):
    res = []
    for i in range(szer):
        res.append(V(0,i) + ' #= ' + V(1,i))
    for i in range(szer):
        res.append(V(wys-1,i) + ' #= ' + V(wys-2,i))
    for i in range(wys):
        res.append(V(i,0) + ' #= ' + V(i,1))
    for i in range(wys):
        res.append(V(szer-1,i) + ' #= ' + V(szer-2, i))
    
    return res'''

def trojki(ay,ax,by,bx,cy,cx):
    return  V(ay,ax) + ' #= 1, ' + V(by,bx) + ' #= 1, ' + V(cy,cx) + ' #= 1'  
    
def reguly(wys,szer):
    res = []
    
    res.append('(' + V(0,0) + ' #= 1' + ', ' + V(0,1) + ' #= 1' + ', ' + V(1,0) + ' #= 1' + ', ' + V(1,1) + ' #= 1' + '; ' + V(0,0) + ' #= 0)')
    res.append('(' + V(0,szer-1) + ' #= 1' + ', ' + V(0,szer-2) + ' #= 1' + ', ' + V(1,szer-1) + ' #= 1' + ', ' + V(1,szer-2) + ' #= 1' + '; ' + V(0,szer-1) + ' #= 0)')
    res.append('(' + V(wys-1,0) + ' #= 1' + ', ' + V(wys-1,1) + ' #= 1' + ', ' + V(wys-2,0) + ' #= 1' + ', ' + V(wys-2,1) + ' #= 1' + '; ' + V(wys-1,0) + ' #= 0)')
    res.append('(' + V(wys-1,szer-1) + ' #= 1' + ', ' + V(wys-1,szer-2) + ' #= 1' + ', ' + V(wys-2,szer-1) + ' #= 1' + ', ' + V(wys-2,szer-2) + ' #= 1' + '; ' + V(wys-1,szer-1) + ' #= 0)')

    for i in range(1,szer-1):
        reg = '(' +  V(0,i) + ' #= 0; ' + V(0,i) + ' #= 1, ' + V(1,i) + ' #= 1, (' + V(0,i-1) + ' #= 1, ' + V(1, i-1) + ' #= 1; ' + V(0, i+1) + ' #= 1, ' + V(1, i+1) + ' #= 1))'
        res.append(reg)
        n = wys-1
        reg = '(' +  V(n,i) + ' #= 0; ' + V(n,i) + ' #= 1, ' + V(n-1,i) + ' #= 1, (' + V(n,i-1) + ' #= 1, ' + V(n-1, i-1) + ' #= 1; ' + V(n, i+1) + ' #= 1, ' + V(n-1, i+1) + ' #= 1))'
        res.append(reg)

    for i in range(1, wys-1):
        reg = '(' +  V(i,0) + ' #= 0; ' + V(i,0) + ' #= 1, ' + V(i,1) + ' #= 1, (' + V(i-1,0) + ' #= 1, ' + V(i-1, 1) + ' #= 1; ' + V(i+1, 0) + ' #= 1, ' + V(i+1, 1) + ' #= 1))'
        res.append(reg)
        n = szer-1
        reg = '(' +  V(i,n) + ' #= 0; ' + V(i,n) + ' #= 1, ' + V(i,n-1) + ' #= 1, (' + V(i-1,n) + ' #= 1, ' + V(i-1, n-1) + ' #= 1; ' + V(i+1, n) + ' #= 1, ' + V(i+1, n-1) + ' #= 1))'
        res.append(reg)
    
    for i in range(1,wys-1):
        for j in range(1,szer-1):
            reg = '(' + V(i,j) + ' #= 0; ' + V(i,j) + ' #= 1, (' + trojki(i,j-1,i-1,j-1,i-1,j) + '; ' + trojki(i-1,j,i-1,j+1,i,j+1) + '; ' + trojki(i,j+1,i+1,j+1,i+1,j) + '; ' + trojki(i+1,j,i+1,j-1,i,j-1) + '))'
            res.append(reg)

    return res



def print_constraints(Cs, indent, d, out):
    position = indent
    #print (indent - 1) * ' ',
    out.write((indent - 1) * ' ')
    for c in Cs:
        #print c + ',',
        out.write (c+', ')
        position += len(c)
        if position > d:
            position = indent
            #print
            #print (indent - 1) * ' ',
            out.write ('\n'+(indent - 1) * ' ')

def wnioskowanie(tab,rows,cols, triples):
    for x in triples:
        tab[x[0]][x[1]] = x[2]
    for i in range(len(tab)):
        for j in range(len(tab[0])):
            if i==0:
                if j==0 and tab[i][j]==1:
                    tab[i][j+1]=1
                    tab[i+1][j]=1
                    tab[i+1][j+1]=1
                elif j==len(cols)-1 and tab[i][j]==1:
                    tab[i][j-1]=1
                    tab[i+1][j]=1
                    tab[i+1][j-1]=1
                

def storms(rows, cols, triples):
    tab = [0 for i in range(len(rows))]
    for i in range(len(rows)):
        tab[i] = [-1 for j in range(len(cols))]
    wnioskowanie(tab,rows,cols, triples)
    for x in tab:
        print(x)
    variables = [ V(i,j) for i in range(len(rows)) for j in range(len(cols))]
    out = open("zad_output.txt", "w")
    
    #print ':- use_module(library(clpfd)).'
    out.write (':- use_module(library(clpfd)).\n')
    #print 'solve([' + ', '.join(variables) + ']) :-'
    out.write ('solve([' + ', '.join(variables) + ']) :-\n')

    cs =  domains(variables)+ startowe(triples) +rzedy(rows,cols)+kolumny(rows,cols) + reguly(len(rows), len(cols))


    print_constraints(cs, 4, 70, out),
    #print
    #print '    labeling([ff], [' +  ', '.join(variables) + ']).' 
    out.write ('\n   labeling([ff], [' +  ', '.join(variables) + ']).')
    #print 
    #print ':- solve(X), write(X), nl.'
    out.write ("\n:- tell('prolog_result.txt'), solve(X), write(X), nl.\n")



txt = open('zad_input.txt').readlines()
output = open('zad_output.txt', 'w')

rows = map(int, txt[0].split())
cols = map(int, txt[1].split())
triples = []

for i in range(2, len(txt)):
    if txt[i].strip():
        triples.append(map(int, txt[i].split()))

storms(rows, cols, triples)            