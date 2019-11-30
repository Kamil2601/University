import json
import sys

def check_word(automata):
    

    sign = sys.stdin.read(1)
    while (sign != ''):
        state = automata['initial']
        while (sign != '\n' and sign != ''):
            state = automata['transitions'][(sign,state)]
            sign = sys.stdin.read(1)

        if state in automata['accepting']:
            print("yes")
        else:
            print("no")
        sign = sys.stdin.read(1)
        

def main():
    path = input()
    f = open(path, "r")
    automata = json.loads(f.read())
    automata['transitions'] = {(t['letter'],t['from']) : t['to'] for t in automata['transitions']}
    check_word(automata)

if __name__ == "__main__":
    main()
