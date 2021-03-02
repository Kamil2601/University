from queue import Queue
from threading import Thread

class Queing:
    def __init__(self):
        self.filler_is_running = True
        self.q = Queue()
        self.result = []

    def fill_queue(self):
        for i in range(100):
            print("put: ",i)
            self.q.put_nowait(i)
        self.filler_is_running = False

    def drain_queue(self):
        i=0
        print("test")
        while not self.q.empty() or self.filler_is_running:
            i+=1
            x = self.q.get()
            print("drain: ",x)
            self.result.append(x)
            self.q.task_done()
        print("i = ",i)

    def run(self):
        t1 = Thread(target=self.fill_queue)
        t2 = Thread(target=self.drain_queue)
        t1.start()
        t2.start()
        self.q.join()
        t1.join()
        t2.join()
        print(self.q.qsize(),len(self.result))




xd = Queing()
xd.run()




