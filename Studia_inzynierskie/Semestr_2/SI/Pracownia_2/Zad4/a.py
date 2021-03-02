import sys
import random
import copy
from heapq import heappush, heappop, heapify



class State:
    def __init__(self):
        self.moves = ""
        self.states = set()
        self.h = 0

    def __lt__(self, other):
        return (self.h+len(self.moves)) < (other.h+len(other.moves))
    
    def oblicz_h(self,goals):
        '''
        maks = 0
        wierszy = 0
        kolumn = 0
        for s in self.states:
            if s[0]>kolumn:
                kolumn = s[0]
            if s[1]>wierszy:
                wierszy = s[1]
            minim = -1
            for g in goals:
                dist = abs(s[0]-g[0]) + abs(s[1]-g[1])
                if dist<minim or minim == -1:
                    minim = dist
            if minim>maks:
                maks = minim
        self.h = maks
        #niedopuszczalna heurystyka
        '''
        suma = 0
        for a in self.states:
            for b in self.states:
                dist = abs(a[0]-b[0]) + abs(a[1]-b[1])
                suma+=dist
        self.h = suma

    
class Maze:
    #_dirs = {'N' : (0,-1), 'S' : (0,1), 'E' : (1,0), 'W' : (-1,0) }
    _dirs = {'U' : (0,-1), 'D' : (0,1), 'R' : (1,0), 'L' : (-1,0) }
    def __init__(self, maze_str):  
        self.m = []
        self.goals = set()
        self.starts = set()
        self.states = set()
        
        for x in maze_str.split('\n'):
            x = x.strip()
            if x:
                self.m.append(list(x))
                #for el in self.m:
                 #   print(el)
            
        for y in range(len(self.m)):
          raw = self.m[y]
          for x in range(len(raw)):
            if self.m[y][x] == 'S':
                self.start = (x,y)
                self.starts.add( (x,y) )
            if self.m[y][x] == 'G':
                self.goals.add( (x,y) )
            if self.m[y][x] == 'B':
                self.start = (x,y)
                self.starts.add( (x,y) )
                self.goals.add( (x,y) )                
            if self.m[y][x] != '#':
                self.states.add( (x,y) ) 
    
    def do(self, state, action):
        dx, dy =  Maze._dirs[action]
        x, y = state
        if self.m[y+dy][x+dx] != '#':
            return (x+dx, y+dy)
        else:
            return state
            
        
    def do_belief(self, states, action):
        return {self.do(s, action) for s in states}
    
def end(states, goals):
    if (len(states)>len(goals)):
        return False
    for x in states:
        if not x in goals:
            return False
    return True

def add_to_queue(pos, q, visited, c, goals):
    t = tuple(pos.states)
    if not t in visited:
        pos.moves+=c
        pos.oblicz_h(goals)
        heappush(q,pos)
        visited[t] = True

f = open("zad_input.txt")
        

maze_str = f.read()

print(maze_str)
  
maze = Maze(maze_str)

goals = maze.goals

pos = State()

pos.states = maze.starts



q = []

heapify(q)

pos.oblicz_h(goals)
heappush(q,copy.deepcopy(pos))



visited = {}

visited[tuple(pos.states)] = True
#print(len(pos.states))

#print(visited)

#print(end(pos.states,maze.goals))

i = 1

while end(pos.states, maze.goals)==False:
    #print(len(q))
    #print (i,len(q), len(pos.states), pos.states)
    i+=1
    pos = heappop(q)
    #print(len(pos.states))
    #print(pos.moves)
    up = State()
    down = State()
    left = State()
    right = State()
    up.states = maze.do_belief(pos.states, 'U')
    down.states = maze.do_belief(pos.states, 'D')
    left.states = maze.do_belief(pos.states, 'L')
    right.states = maze.do_belief(pos.states, 'R')
    up.moves = pos.moves = down.moves = left.moves = right.moves = pos.moves
    add_to_queue(up,q, visited, 'U', goals)
    add_to_queue(down,q, visited, 'D', goals)
    add_to_queue(left,q, visited, 'L', goals)
    add_to_queue(right,q, visited, 'R', goals)


output = open("zad_output.txt", "w")
output.write(pos.moves)
print(pos.moves, len(pos.moves))
#print(pos.states)