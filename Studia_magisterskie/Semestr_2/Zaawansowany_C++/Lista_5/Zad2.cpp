#include <iostream>
#include <vector>
#include <map>
#include <string>
#include <set>
#include <list>

struct Transition
{
    int from;
    int to;
    char symbol;

    Transition(int from, char symbol, int to)
    {
        this->from = from;
        this->to = to;
        this->symbol = symbol;
    }
};


class Automata
{
    private:
    int start_state;
    std::set<int> accepting_states;
    std::vector<std::map<char, int>> states;

    public:
    Automata(int states_count, std::set<int> accepting, std::list<Transition> transition_function, int start = 0)
    {
        states.resize(states_count);
        start_state = start;
        accepting_states = accepting;

        for (Transition trans: transition_function)
        {
            states[trans.from][trans.symbol] = trans.to;
        }
    }


    bool test_word(std::string word)
    {
        int current_state = start_state;

        for (char symbol: word)
        {
            auto state = states[current_state];
            if (state.find(symbol) != state.end())
            {
                current_state = state[symbol];
            }
            else
            {
                return false;
            }
        }

        return accepting_states.find(current_state) != accepting_states.end();
    }

};


int main()
{
    std::list<Transition> trans1 = {Transition(0, '0', 0), Transition(0, '1', 1), Transition(1, '0', 1), Transition(1, '1', 0)};
    Automata odd_one(2, {0}, trans1);

    std::cout << odd_one.test_word("11") << "\n";
    std::cout << odd_one.test_word("100011") << "\n";


    std::cout << "\n";

    std::list<Transition> trans2 = {
        Transition(0, '0', 0), Transition(1, '0', 1), Transition(2, '0', 2),
        Transition(0, '1', 1), Transition(1, '1', 2), Transition(2, '1', 0),
        Transition(0, '2', 2), Transition(1, '2', 0), Transition(2, '2', 1),
        Transition(0, '3', 0), Transition(1, '3', 1), Transition(2, '3', 2),
        Transition(0, '4', 1), Transition(1, '4', 2), Transition(2, '4', 0),
        Transition(0, '5', 1), Transition(1, '5', 0), Transition(2, '5', 1),
        Transition(0, '6', 0), Transition(1, '6', 1), Transition(2, '6', 2),
        Transition(0, '7', 1), Transition(1, '7', 2), Transition(2, '7', 0),
        Transition(0, '8', 2), Transition(1, '8', 0), Transition(2, '8', 1),
        Transition(0, '9', 0), Transition(1, '9', 1), Transition(2, '9', 2),
    };

    Automata div_by_3(3, {0}, trans2);

    std::cout << div_by_3.test_word("111") << "\n";
    std::cout << div_by_3.test_word("112") << "\n";
    std::cout << div_by_3.test_word("1112130") << "\n";
    std::cout << div_by_3.test_word("1022221") << "\n";
}