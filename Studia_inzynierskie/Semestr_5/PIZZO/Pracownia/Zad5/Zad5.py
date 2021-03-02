import json

def nonempty(s):
    return len(s) > 0

def empty(s):
    return len(s) == 0

class Automata:
    def __init__(self, json_dict):
        self.alphabet = json_dict["alphabet"]
        self.states = set(json_dict["states"])
        self.initial = json_dict["initial"]
        self.accepting = set(json_dict["accepting"])
        self.transitions = {(t['letter'],t['from']) : t['to'] for t in json_dict['transitions']}
        self.nondistinguishable_states = set()

    def delete_unreachable_states(self):
        reachable_states = {self.initial}
        new_states = {self.initial}

        while True:
            temp = set()
            for q in new_states:
                for c in self.alphabet:
                    temp.add(self.transitions[(c,q)])
            
            new_states = temp - reachable_states
            reachable_states |= new_states

            if empty(new_states):
                break

        self.states = reachable_states

    def find_nondistinguishable_states(self):
        P = {frozenset(self.accepting.copy()), frozenset(self.states - self.accepting)}
        W = {frozenset(self.accepting.copy()), frozenset(self.states - self.accepting)}

        while nonempty(W):
            A = W.pop()
            for c in self.alphabet:
                X = frozenset(filter(lambda q: self.transitions[(c,q)] in A, self.states))
                new_P = set()
                for Y in P:
                    intersection = X & Y
                    difference = Y - X
                    if nonempty(intersection) and nonempty(difference):
                        new_P.add(intersection)
                        new_P.add(difference)
                        if Y in W:
                            W.remove(Y)
                            W.add(intersection)
                            W.add(difference)
                        else:
                            if len(intersection) <= len(difference):
                                W.add(intersection)
                            else:
                                W.add(difference)
                    else:
                        new_P.add(frozenset(Y))
                P = new_P
        
        self.nondistinguishable_states = P
        return len(P)

def main():
    path = input()
    f = open(path, "r")
    json_dict = json.loads(f.read())
    automata = Automata(json_dict)
    automata.delete_unreachable_states()
    result = automata.find_nondistinguishable_states()
    print(result)

if __name__=="__main__":
    main()
