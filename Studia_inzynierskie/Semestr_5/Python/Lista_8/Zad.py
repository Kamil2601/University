import matplotlib.pyplot as pyplot
import matplotlib.animation as animation

import random

def onClick(event):
    global pause
    pause ^= True

class Snake:
    def __init__(self,board_size,board_color,snake_lenght,snake_color, head_color, obstacles_n, obstacles_color):
        self.board_color = board_color
        self.snake_color = snake_color
        self.head_color = head_color
        self.obstacles_color = obstacles_color
        self.board_size = board_size
        self.snake_length = 8
        self.obstacles = set()
        self.step = 0

        self.board = [[board_color for _ in range(board_size)] for _ in range(board_size)]

        self.put_obstacles(obstacles_n)

        self.snake = [(int(self.board_size/2), int(self.board_size/2))]
        self.direction = 'right'
        self.dirs = ['left','right','up','down']    

        self.ani = animation.FuncAnimation(pyplot.gcf(), self.run, interval=200)

        pyplot.imshow(self.board)
        pyplot.show()

    def put_obstacles(self, n):
        self.obstacles.add((0,0))
        while len(self.obstacles)<n:
            self.obstacles.add((random.randint(0,self.board_size-1),
                        random.randint(0,self.board_size-1)))

        for (y,x) in self.obstacles:
            self.board[y][x] = self.obstacles_color

    def oposite(self,dir):
        return {'left' : 'right', 'right' : 'left', 'up' : 'down', 'down' : 'up'}[dir]

    def collision(self):
        head = self.snake[-1]
        if len(self.snake)>2:
            tail = self.snake[:-1]
            if head in tail:
                return True
        if head in self.obstacles:
            return True
        return False

    def do_step(self, pop=True):
        (head_y, head_x) = self.snake[-1]
        new_direction = random.choice(list(
            filter(lambda x : x!=self.oposite(self.direction), self.dirs))+3*[self.direction])
        (new_y, new_x) = {'left' : (head_y, (head_x-1)%self.board_size),
                          'right' : (head_y, (head_x+1)%self.board_size),
                          'up' : ((head_y-1)%self.board_size, head_x),
                          'down' : ((head_y+1)%self.board_size, head_x)}[new_direction]
        
        self.snake.append((new_y,new_x))
        if pop:
            (old_y, old_x) = self.snake.pop(0)
            self.board[old_y][old_x] = self.board_color
        else:
            (old_y, old_x) = self.snake[0]
        
        self.board[new_y][new_x] = self.head_color
        self.direction = new_direction
        
        if len(self.snake)>1:
            (y,x) = self.snake[-2]
            self.board[y][x] = self.snake_color

    def run(self,_):
        
        if self.collision():
            self.ani.event_source.stop()
        else:
            self.do_step(self.step>self.snake_length)
            self.step+=1
        pyplot.imshow(self.board)
            


snake = Snake(20,(255,255,100),30,(0,200,00),(200,0,0),5,(0,0,255))
