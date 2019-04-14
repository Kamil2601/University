
def kwadraty(wys,szer):
    res = []
    for i in range(wys):
        for j in range(szer):
            pola = [V(i+k,j+l) for k in range(2) for l in range(2)]
            reg1 = "{0} + {1} + {2} + {3} #= 1".format(*pola)
            reg2 = "{0} + {3} #= {1} + {2}".format(*pola)
            res.append(reg1 + " #\\/ " + reg2)

    return res


def sasiednie(wys,szer):
    sasiednie_x = []
    for i in range(wys):
        for j in range(szer-2):
            reg = V(i,j+1) + " #= 0 #\/ " + V(i,j) + " #= 1 #\/ " + V(i,j+2) + " #= 1"
            sasiednie_x.append(reg)
    sasiednie_y = []
    for i in range(wys-2):
        for j in range(szer):
            reg = V(i+1,j) + " #= 0 #\/ " + V(i,j) + " #= 1 #\/ " + V(i+2,j) + " #= 1"
            sasiednie_y.append(reg)
    
    return sasiednie_x+sasiednie_y

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

def startowe(tab):
    res = []
    for x in tab:
        res.append(V(x[0],x[1]) + ' #= ' + str(x[2]))
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
                                               
                

def storms(rows, cols, triples):
    tab = [0 for i in range(len(rows))]

    variables = [ V(i,j) for i in range(len(rows)) for j in range(len(cols))]
    out = open("zad_output.txt", "w")
    #print ':- use_module(library(clpfd)).'
    out.write (':- use_module(library(clpfd)).\n')
    #print 'solve([' + ', '.join(variables) + ']) :-'
    out.write ('solve([' + ', '.join(variables) + ']) :-\n')

    cs =  domains(variables) + startowe(triples) +rzedy(rows,cols)+kolumny(rows,cols) + kwadraty(len(rows),len(cols)) + sasiednie(len(rows),len(cols))

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
