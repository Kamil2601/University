import time

class Timer:
    def __init__(self):
        self.start_tick = 0
        self.stop_tick = 0
        self.is_started = False
    
    #wystartowanie stopera
    def start(self):
        self.is_started = True
        self.start_tick = time.time()

    #zatrzymanie stopera
    def stop(self):
        self.is_started = False
        self.stop_tick = time.time()

    #zwrócenie czasu
    def time(self):
        return round(time.time() - self.start_tick,0) if self.is_started else 0

    #zwrócenie czasu w formie napisu mm:ss
    def to_string(self):
        t = int(self.time())
        minutes = int(t/60)
        seconds = round(t%60,0)
        sec = str(seconds)
        if seconds < 10:
            sec = '0'+sec
        minu = str(minutes)
        if minutes < 10:
            minu = '0'+minu 
        return " " + minu + ":" + sec