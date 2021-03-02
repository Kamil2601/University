import sys


def V(i,j):
    return 'V%d_%d' % (i,j)
    
def domains(Vs):
    return [ q + ' in 1..9' for q in Vs ]
    
    
def all_different(Qs):
    return 'all_distinct([' + ', '.join(Qs) + '])'
    
def get_column(j):
    return [V(i,j) for i in range(9)] 
            
def get_raw(i):
    return [V(i,j) for j in range(9)] 
                        
def horizontal():   
    return [ all_different(get_raw(i)) for i in range(9)]

def vertical():
    return [all_different(get_column(j)) for j in range(9)]

def make_square(i,j):
    fields = []
    for k in range(3):
        for l in range(3):
            fields.append(V(3*i+k, 3*j+l))
    return all_different(fields)

def squares():
    res = []
    for i in range(3):
        for j in range(3):
            res.append(make_square(i,j))
    return res

def print_constraints(Cs, indent, d, out):
    position = indent
    print (indent - 1) * ' ',
    out.write((indent - 1) * ' ')
    for c in Cs:
        print c + ',',
        out.write (c+', ')
        position += len(c)
        if position > d:
            position = indent
            print
            print (indent - 1) * ' ',
            out.write ('\n'+(indent - 1) * ' ')
      
def sudoku(assigments):
    variables = [ V(i,j) for i in range(9) for j in range(9)]
    out = open("zad_output.txt", "w")
    
    print ':- use_module(library(clpfd)).'
    out.write (':- use_module(library(clpfd)).\n')
    print 'solve([' + ', '.join(variables) + ']) :-'
    out.write ('solve([' + ', '.join(variables) + ']) :-\n')
    
    
    cs = domains(variables) + vertical() + horizontal() + squares() #TODO: too weak contraints, add something!
    for i,j,val in assigments:
        cs.append( '%s #= %d' % (V(i,j), val) )
    
    print_constraints(cs, 4, 70, out),
    print
    print '    labeling([ff], [' +  ', '.join(variables) + ']).' 
    out.write ('\n   labeling([ff], [' +  ', '.join(variables) + ']).')
    print 
    print ':- solve(X), write(X), nl.'
    out.write ('\n:- solve(X), write(X), nl.\n')    

if __name__ == "__main__":
    raw = 0
    triples = []
    wejscie = open("zad_input.txt")

    for i in range(9):
        linia = wejscie.readline()
        for j in range(9):
            if linia[j]!='.':
                triples.append( (i,j,int(linia[j])))        
    
    sudoku(triples)
    
"""
89.356.1.
3...1.49.
....2985.
9.7.6432.
.........
.6389.1.4
.3298....
.78.4....
.5.637.48

53..7....
6..195...
.98....6.
8...6...3
4..8.3..1
7...2...6
.6....28.
...419..5
....8..79

3.......1
4..386...
.....1.4.
6.924..3.
..3......
......719
........6
2.7...3..
"""    
