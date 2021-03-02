import sys
import random
import copy
import queue


class State:
    def __init__(self):
        self.moves = ""
        self.states = set()

    
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
            
    def draw(self, colors):
        draw(self.m, colors)
        
    def draw_set(self, S, c):
        self.draw(dict( (s, c) for s in S))
        
    def do_belief(self, states, action):
        return {self.do(s, action) for s in states}
    
def end(states, goals):
    if (len(states)>len(goals)):
        return False
    for x in states:
        if not x in goals:
            return False
    return True

def add_to_queue(pos, queue, visited, c):
    t = tuple(pos.states)
    if not t in visited:
        pos.moves+=c
        queue.put(pos)
        visited[t]=True

f = open("zad_input.txt")
        

maze_str = f.read()

print(maze_str)
  
maze = Maze(maze_str)

pos = State()

pos.states = maze.starts
#print(pos.states)
#print(maze.goals)
#print(len(pos.states))

random_moves = []

h = len(maze.m)
w = len(maze.m[0])

#print(h)
#print(w)

kierunki = "UDLR"
naj_stan = set()
stan = set()
n = len(maze.starts)
naj_ruchy = []

wys = len(maze.m)
szer = len(maze.m[0])

obw = 2*wys+2*szer

#print(obw)

while n>(len(maze.goals)+1):
    for i in range(4):
        start = kierunki[i]
        ruchy = start
        stan = maze.do_belief(maze.states, start)
        poprz = start
        for j in range(min(obw+40,110)):
            nowy = maze.do_belief(stan, poprz)
            ruch = poprz
            for k in range(4):
                nowy2 = maze.do_belief(stan, kierunki[k])
                if len(nowy2)<len(nowy):
                    nowy = copy.deepcopy(nowy2)
                    ruch = kierunki[k]
            while nowy==stan:
                ruch = random.choice('UDLR')
                nowy = maze.do_belief(stan, ruch)
            ruchy+=ruch
            stan = copy.deepcopy(nowy)
        #print(stan)
        #print(ruchy)
        if i==0 or len(stan)<len(naj_stan):
            naj_stan = copy.deepcopy(stan)
            naj_ruchy = copy.deepcopy(ruchy)

    #pos.moves = naj_ruchy
    #pos.states = copy.deepcopy(naj_stan)
    n = len(naj_stan)


pos.moves = naj_ruchy
pos.states = copy.deepcopy(naj_stan)

#print(len(pos.states))
#print(len(maze.goals))

#print(len(pos.states))
#print(pos.states)
#print(len(maze.goals))
#print(naj_ruchy)



queue = queue.Queue()

queue.put(copy.deepcopy(pos))

visited = {}



visited[tuple(pos.states)] = True

#print(len(pos.states))


i = 1


while end(pos.states, maze.goals)==False:
    #print(len(queue))
    
    pos = queue.get_nowait()
    #print(pos.moves)
    up = State()
    down = State()
    left = State()
    right = State()
    up.states = maze.do_belief(pos.states, 'U')
    down.states = maze.do_belief(pos.states, 'D')
    left.states = maze.do_belief(pos.states, 'L')
    right.states = maze.do_belief(pos.states, 'R')
    up.moves = pos.moves = down.moves = left.moves = right.moves =pos.moves
    add_to_queue(up,queue, visited, 'U')
    add_to_queue(down,queue, visited, 'D')
    add_to_queue(left,queue, visited, 'L')
    add_to_queue(right,queue, visited, 'R')


output = open("zad_output.txt", "w")
output.write(pos.moves)
print(pos.moves)