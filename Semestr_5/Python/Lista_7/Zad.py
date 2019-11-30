import requests
import os
from bs4 import BeautifulSoup
from urllib.parse import *
from html.parser import HTMLParser
import re

from threading import Thread
from queue import Queue

import time

def is_absolute(url):
    return bool(urlparse(url).netloc)

def is_html_file(url):
    return re.search(r"html|htm|[/]\Z",url)


class Crawl:
    def __init__(self):
        self.urls = set()
        self.result = []
        self.queue = Queue()
        self.get_links_is_running = False
        self.next_urls = []
        self.action = None

    def get_links(self,url):
        try:
            self.get_links_is_running = True

            html = requests.get(url).content
            soup = BeautifulSoup(html, 'html.parser')

            for link in soup.find_all('a'):
                href = link.get('href')
                if not is_absolute(href):
                    href = urljoin(url,href)
                self.queue.put_nowait(href)
            
            self.get_links_is_running = False
        except:
            pass

    def process_links(self):
        while not self.queue.empty() or self.get_links_is_running:
            link = self.queue.get()
            if not link in self.urls:
                html = requests.get(url).content
                self.result.append((link, self.action(html)))
                self.urls.add(link)
                self.next_urls.append(link)
            self.queue.task_done()

    def crawl_aux(self, url, distance):
        #print(url,distance)
        try:
            #print(is_html_file(url))
            if is_html_file(url):
                # print("crawl_aux, ", distance)
                if distance > 0:
                    #--------------------------------------
                    link_getter = Thread(target=(self.get_links), args=[url])
                    link_processor = Thread(target=self.process_links)
                    link_getter.start()
                    link_processor.start()
                    self.queue.join()
                    link_getter.join()
                    link_processor.join()
                    #--------------------------------------
                    links = self.next_urls.copy()
                    self.next_urls = []
                    for link in links:
                        self.crawl_aux(link, distance-1)
        except:
            pass

    def crawl(self, url, distance, action):
        self.action = action
        try:
            if is_html_file(url):
                html = requests.get(url).content
                self.urls.add(url)
                self.result.append((url, action(html)))
                print(self.result)
                self.crawl_aux(url,distance)
        except:
            pass

def find_phrase_with_word(html,word):
    soup = BeautifulSoup(html, 'html.parser')
    result = []
    for element in soup.find_all():
        text = element.get_text()
        text = re.sub("\n"," ",text)
        text = re.sub(r"[!?]",".",text)
        text = text.split(".")
        for phrase in text:
            if re.search(word,phrase):
                result.append(phrase)

    return result


crawl = Crawl()



url = "http://www.ii.uni.wroc.pl/~marcinm/dyd/python/"

t1 = time.perf_counter()

crawl.crawl(url,2,lambda x : find_phrase_with_word(x,r"[Pp]ython"))

t2 = time.perf_counter()

print(f'Time: {round(t2 - t1,5)}')

# print(len(crawl.urls))

for x in crawl.result:
    print(x)