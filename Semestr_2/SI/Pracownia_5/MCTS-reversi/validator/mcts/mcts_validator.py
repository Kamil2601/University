#!/usr/bin/env python
# -*- coding: UTF-8 -*-


from __future__ import absolute_import
from __future__ import print_function
from __future__ import unicode_literals


import random
from math import *
import sys
import copy


class Reversi:
    M = 8
    DIRS = [(0, 1), (1, 0), (-1, 0), (0, -1),
            (1, 1), (-1, -1), (1, -1), (-1, 1)]

    def __init__(self):
        self.board = self.initial_board()
        self.fields = set()
        self.move_list = []
        self.history = []
        self.last_player = 1
        for i in range(self.M):
            for j in range(self.M):
                if self.board[i][j] is None:
                    self.fields.add((j, i))

    def initial_board(self):
        B = [[None] * self.M for _ in range(self.M)]
        B[3][3] = 1
        B[4][4] = 1
        B[3][4] = 0
        B[4][3] = 0
        return B

    def draw(self):
        for i in range(self.M):
            res = []
            for j in range(self.M):
                b = self.board[i][j]
                if b is None:
                    res.append('.')
                elif b == 1:
                    res.append('#')
                else:
                    res.append('o')
            print(''.join(res))
        print('')

    def clone(self):
        cl = copy.deepcopy(self)
        return cl

    def moves(self):
        res = []
        player = 1-self.last_player
        for (x, y) in self.fields:
            if any(self.can_beat(x, y, direction, player)
                   for direction in self.DIRS):
                res.append((x, y))
        return res

    def can_beat(self, x, y, d, player):
        dx, dy = d
        x += dx
        y += dy
        cnt = 0
        while self.get(x, y) == 1 - player:
            x += dx
            y += dy
            cnt += 1
        return cnt > 0 and self.get(x, y) == player

    def get(self, x, y):
        if 0 <= x < self.M and 0 <= y < self.M:
            return self.board[y][x]
        return None

    def do_move(self, move):
        player = 1 - self.last_player
        #print(player,len(self.move_list))
        assert player == len(self.move_list) % 2
        self.history.append([x[:] for x in self.board])
        self.move_list.append(move)

        if move is None:
            return
        x, y = move
        x0, y0 = move
        self.board[y][x] = player
        self.fields -= set([move])
        for dx, dy in self.DIRS:
            x, y = x0, y0
            to_beat = []
            x += dx
            y += dy
            while self.get(x, y) == 1 - player:
                to_beat.append((x, y))
                x += dx
                y += dy
            if self.get(x, y) == player:
                for (nx, ny) in to_beat:
                    self.board[ny][nx] = player

        self.last_player = 1-self.last_player

    def result(self):
        res = 0
        for y in range(self.M):
            for x in range(self.M):
                b = self.board[y][x]
                if b == 0:
                    res -= 1
                elif b == 1:
                    res += 1
        return res

    def get_result(self, playerjm):
        jmcount = len([(x,y) for x in range(8) for y in range(8) if self.board[x][y] == playerjm])
        notjmcount = len([(x,y) for x in range(8) for y in range(8) if self.board[x][y] == 3 - playerjm])
        if jmcount > notjmcount: return 1.0
        elif notjmcount > jmcount: return 0.0
        else: return 0.5

    def terminal(self):
        if not self.fields:
            return True
        if len(self.move_list) < 2:
            return False
        return self.move_list[-1] is None and self.move_list[-2] is None



class Node:

    def __init__(self, move = None, parent = None, state = None):
        self.move = move # the move that got us to this node - "None" for the root node
        self.parent_node = parent # "None" for the root node
        self.child_nodes = []
        self.wins = 0
        self.visits = 0
        self.untried_moves = state.moves() # future child nodes
        self.last_player = state.last_player # the only part of the state that the Node needs later
        
    def select_child(self):
        s = sorted(self.child_nodes, key = lambda c: c.wins/c.visits + sqrt(2*log(self.visits)/c.visits))[-1]
        return s
    
    def add_child(self, m, s):
        """ Remove m from untriedMoves and add a new child node for this move.
            Return the added child node
        """
        n = Node(move = m, parent = self, state = s)
        self.untried_moves.remove(m)
        self.child_nodes.append(n)
        return n
    
    def update(self, result):
        """ Update this node - one additional visit and result additional wins. result must be from the viewpoint of playerJustmoved.
        """
        self.visits += 1
        self.wins += result

    def __repr__(self):
        return "[M:" + str(self.move) + " W/V:" + str(self.wins) + "/" + str(self.visits) + " U:" + str(self.untried_moves) + "]"

    def TreeToString(self, indent):
        s = self.IndentString(indent) + str(self)
        for c in self.child_nodes:
             s += c.TreeToString(indent+1)
        return s

    def IndentString(self,indent):
        s = "\n"
        for i in range (1,indent+1):
            s += "| "
        return s

    def ChildrenToString(self):
        s = ""
        for c in self.child_nodes:
             s += str(c) + "\n"
        return s


def UCT(rootstate, itermax, verbose = False):
    rootnode = Node(state = rootstate)

    for i in range(itermax):
        node = rootnode
        state = rootstate.clone()

        # Selection
        while node.untried_moves == [] and node.child_nodes != []:
            node = node.select_child()
            state.do_move(node.move)

        # Expand
        if node.untried_moves != []:
            m = random.choice(node.untried_moves) 
            state.do_move(m)
            node = node.add_child(m,state)

        # Playout 
        while state.moves() != []:
            state.do_move(random.choice(state.moves()))

        # Backpropagate
        while node != None:
            node.update(state.get_result(node.last_player))
            node = node.parent_node
    '''
    if (verbose): print(rootnode.TreeToString(0))
    else: print(rootnode.ChildrenToString())
    '''

    return sorted(rootnode.child_nodes, key = lambda c: c.visits)[-1].move # return the move that was most visited


class Player(object):
    def __init__(self):
        self.reset()

    def reset(self):
        self.game = Reversi()
        self.my_player = 1
        self.say('RDY')

    def say(self, what):
        sys.stdout.write(what)
        sys.stdout.write('\n')
        sys.stdout.flush()


    def hear(self):
        line = sys.stdin.readline().split()
        return line[0], line[1:]

    def loop(self):
        state = Reversi()
        while True:
            cmd, args = self.hear()
            if cmd == 'HEDID':
                unused_move_timeout, unused_game_timeout = args[:2]
                move = tuple((int(m) for m in args[2:]))
                if move == (-1, -1):
                    move = None
                self.game.do_move(move)
            elif cmd == 'ONEMORE':
                self.reset()
                continue
            elif cmd == 'BYE':
                break
            else:
                assert cmd == 'UGO'
                assert not self.game.move_list
                self.my_player = 0

            moves = self.game.moves()
            if moves:
                move = UCT(rootstate = state, itermax = 100, verbose = False)
                self.game.do_move(move)
            else:
                self.game.do_move(None)
                move = (-1, -1)
            self.say('IDO %d %d' % move)


if __name__ == '__main__':
    player = Player()
    player.loop()