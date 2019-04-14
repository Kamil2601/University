
from numpy import argmax
from copy import deepcopy as dc
import random

def load_board(path):
    f = open(path)
    print(f)
    res = []
    for line in f:
        print(line)
        l = list(line)
        if l[-1]=='\n':
            l.pop(-1)
        print(l)
        res.append(dc(l))
    return res

def load_states(height, width):
    res = []

    #print(height,width)
    
    for i in range(height):
        for j in range(width):
            for vy in range(-3,4):
                for vx in range(-3,4):
                    res.append((j,i,vx,vy))

    return res

def save_policy(pol,width,height, path):
    output = open(path,'w')

    for s in pol.keys():
        x,y,vx,vy = s
        if pol[s]:
            dx,dy = pol[s]
            if x >= 0 and x < width and y>=0 and y<height:
                line = str(x)+' '+' '+str(y)+' '+str(vx)+' '+str(vy)+'     '+str(dx)+' '+str(dy)+'\n'
                output.write(line)

        




class MDP:

    def __init__(self,path):
        self.board = load_board(path)
        print (self.board[-1])
        if self.board[-1]==[]:
            self.board.pop()
        #print self.board
        self.gamma = 0.99
        print("1")
        self.actlist = [(x,y) for x in range(-1,2) for y in range(-1,2)]
        print("2")
        self.actlist_0_speed = [(0,-1),(0,1),(-1,0),(-1,-1),(-1,1),(1,0),(1,-1),(1,1)]
        print("3")
        self.states = load_states(len(self.board),len(self.board[0]))
        print("4")
        self.terminals = self.make_terminals()
        print("5")
        #print self.terminals.keys()
        self.transitions = self.make_transitions()
        print("6")
        #print self.transitions[(12,2,0,1)]

    def make_terminals(self):
        h = len(self.board)
        w = len(self.board[0])

        res = {}

        

        for s in self.states:
            x,y,vx,vy = s
            #print(y,x)
            #print (len(self.board[21]))
            if x<0 or y<0 or x>=w or y>=h:
                res[s] = True
            elif self.board[y][x]=='.':
                res[s] = True
            elif self.board[y][x]=='e':
                res[s] = True
        return res

    def actions(self,state):
        if state in self.terminals:
            return [None]
        if state[2]==0 and state[3]==0:
            return self.actlist_0_speed
        else:
            return self.actlist

    def out_of_bounds(self,x,y):
        return x<-3 or y<-3 or x>len(self.board[0])+2 or y>len(self.board)+2

    def calculate_action(self,state,action):
        x,y,vx,vy = state
        if action:
            dx,dy = action
            if self.oil(x,y):
                res = []
                for ry in [-1,0,1]:
                    for rx in [-1,0,1]:
                        new_dx = dx+rx
                        new_dy = dy+ry
                        new_vx = self.repair(vx+new_dx)
                        new_vy = self.repair(vy+new_dy)
                        new_x = x+new_vx
                        new_y = y+new_vy
                        new_state = (new_x,new_y,new_vx,new_vy)
                        res.append((1.0/9.0,self.go(new_state,state)))
                return res
            else:
                new_vx = self.repair(vx+dx)
                new_vy = self.repair(vy+dy)
                new_x = x+new_vx
                new_y = y+new_vy
                new_state = (new_x,new_y,new_vx,new_vy)
                return [(1.0,self.go(new_state,state))]
        else:
            return [(0.0,state)]

    def go(self, new_state,state):
        return new_state if new_state in self.states else state

    def repair(self,val):
        if val > 3:
            return 3
        elif val < -3:
            return -3
        else:
            return val

    def oil(self,x,y):
        if x<0 or y<0 or x >= len(self.board[0]) or y >= len(self.board):
            return False
        else:
            return self.board[y][x]=='o'

    def end(self,x,y):
        if x<0 or y<0 or x >= len(self.board[0]) or y >= len(self.board):
            return False
        else:
            return self.board[y][x]=='e'

    def crash(self,x,y):
        if x<0 or y<0 or x >= len(self.board[0]) or y >= len(self.board):
            return True
        else:
            return self.board[y][x]=='.'



    def make_transitions(self):
        res = {}
        print(len(self.states))
        i = 1
        for s in self.states:
            state_dict = {}
            print(i)
            i+=1
            for a in self.actions(s):
                state_dict[a] = self.calculate_action(s,a)
            res[s] = state_dict
        return res

    def R(self,state):
        x,y,vx,vy = state
        if self.end(x,y):
            return 100-0.1
        elif self.crash(x,y):
            return -100.1
        else:
            return -0.1

    def T(self, state, action):
        """Transition model. From a state and an action, return a list
        of (probability, result-state) pairs."""
        if not self.transitions:
            raise ValueError("Transition model is missing")
        else:
            return self.transitions[state][action]

def arg_max(s,actions, U, mdp):
    best_action = 0
    max_val = -float("inf")
    for a in actions:
        val = expected_utility(a, s, U, mdp)
        if val > max_val:
            max_val = val
            best_action = a

    return best_action


def policy_iteration(mdp):
    U = {s: 0 for s in mdp.states}
    pi = {s: random.choice(mdp.actions(s)) for s in mdp.states}
    while True:
        old_U = dc(U)
        U = policy_evaluation(pi, U, mdp)
        unchanged = True
        for s in mdp.states:
            print(s, pi[s], U[s])
            #a = argmax(mdp.actions(s), key=lambda a: expected_utility(a, s, U, mdp))
            a = arg_max(s,mdp.actions(s), U, mdp)
            if a != pi[s]:
                unchanged = False
                pi[s] = a
                
        if unchanged:#or abs(sum(old_U.values())-sum(U.values()))<1:
            return pi


def policy_evaluation(pi, U, mdp, k=20):

    R, T, gamma = mdp.R, mdp.T, mdp.gamma
    for i in range(k):
        for s in mdp.states:
            U[s] = R(s) + gamma*sum(p*U[s1] for (p, s1) in T(s, pi[s]))
    return U

def expected_utility(a, s, U, mdp):
    return sum(p*U[s1] for (p, s1) in mdp.T(s, a))





mdp = MDP("results/task11.txt")
print("koniec")

pol = policy_iteration(mdp)

save_policy(pol,len(mdp.board[0]),len(mdp.board), "results/policy_for_task11.txt")
