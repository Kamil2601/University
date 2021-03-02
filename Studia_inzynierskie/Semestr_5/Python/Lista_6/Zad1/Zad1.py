import requests
import os
from bs4 import BeautifulSoup
from urllib.parse import *
from html.parser import HTMLParser
import re

import time

def is_absolute(url):
    return bool(urlparse(url).netloc)

def is_html_file(url):
    return re.search(r"html|htm|[/]\Z",url)

def get_links(url):
    try:
        html = requests.get(url).content
        soup = BeautifulSoup(html, 'html.parser')
        result = set()
        for link in soup.find_all('a'):
            href = link.get('href')
            if not is_absolute(href):
                href = urljoin(url,href)
            result.add(href)
        
        return result
    except:
        return set()
            

class Crawl:
    def __init__(self):
        self.urls = set()
        self.result = []

    def get_links(self,url):
        try:
            html = requests.get(url).content
            soup = BeautifulSoup(html, 'html.parser')
            result = set()
            for link in soup.find_all('a'):
                href = link.get('href')
                if not is_absolute(href):
                    href = urljoin(url,href)
                result.add(href)
            
            return result
        except:
            return set()

    def crawl(self, url, distance, action):
        if not url in self.urls:
            try:
                if is_html_file(url):
                    print(url,distance)
                    html = requests.get(url).content
                    self.urls.add(url)
                    self.result.append((url, action(html)))
                    if distance > 0:
                        self.urls.add(url)
                        links = self.get_links(url)
                        for link in links:
                            self.crawl(link, distance-1, action)
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

print(len(crawl.result))