#include <iostream>
#include <list>
#include <variant>
#include <stack>
#include <utility>
#include <string>

enum class Operator : char
{
    plus = '+',
    minus = '-',
    div = '/',
    mult = '*',
    power = '^'
};

enum class Bracket : char
{
    left = '(',
    right = ')'
};

using token = std::variant<Operator, Bracket, int>;

void print_operation(std::list<token> operation)
{
    for (token t : operation)
    {
        if (std::holds_alternative<int>(t))
        {
            std::cout << std::get<int>(t) << " ";
        }
        else if (std::holds_alternative<Operator>(t))
        {
            std::cout << (char)std::get<Operator>(t) << " ";
        }
        else if (std::holds_alternative<Bracket>(t))
        {
            std::cout << (char)std::get<Bracket>(t) << " ";
        }
    }

    std::cout << "\n";
}

int priority(Operator op)
{
    switch (op)
    {
    case Operator::plus:
        return 1;
    case Operator::minus:
        return 1;
    case Operator::div:
        return 2;
    case Operator::mult:
        return 2;
    case Operator::power:
        return 3;
    }

    return 0;
}

class Lexer
{
private:
    static bool is_digit(char c)
    {
        return c >= '0' && c <= '9';
    }

public:
    static std::list<token> tokenize_string(std::string str)
    {
        std::list<token> res;
        std::string current_num = "";

        for (char c : str)
        {
            if (is_digit(c))
            {
                current_num += c;
            }
            else
            {
                if (current_num != "")
                {
                    int num = std::stoi(current_num);
                    res.push_back(num);

                    current_num = "";
                }

                switch (c)
                {
                case '(':
                    res.push_back(Bracket::left);
                    break;
                case ')':
                    res.push_back(Bracket::right);
                    break;
                case '+':
                    res.push_back(Operator::plus);
                    break;
                case '-':
                    res.push_back(Operator::minus);
                    break;
                case '*':
                    res.push_back(Operator::mult);
                    break;
                case '/':
                    res.push_back(Operator::div);
                    break;
                case '^':
                    res.push_back(Operator::power);
                    break;

                default:
                    break;
                }
            }
        }

        if (current_num != "")
        {
            int num = std::stoi(current_num);
            res.push_back(num);

            current_num = "";
        }

        return res;
    }
};

class Parser
{
private:
    static bool pop_operator(token t, std::stack<token> stck)
    {
        if (stck.empty())
            return false;

        if (std::holds_alternative<Operator>(stck.top()))
        {
            Operator in_op = std::get<Operator>(t);
            Operator stack_op = std::get<Operator>(stck.top());

            return priority(in_op) <= priority(stack_op);
        }

        return false;
    }

    static bool is_left_bracket(token t)
    {
        if (std::holds_alternative<Bracket>(t))
        {
            return std::get<Bracket>(t) == Bracket::left;
        }

        return false;
    }

public:
    static std::list<token> parse_to_rpn(std::list<token> operation)
    {
        std::stack<token> stck;
        std::list<token> res;

        for (token t : operation)
        {
            if (std::holds_alternative<int>(t))
            {
                res.push_back(t);
            }
            else if (std::holds_alternative<Operator>(t))
            {
                while (pop_operator(t, stck))
                {
                    res.push_back(stck.top());
                    stck.pop();
                }

                stck.push(t);
            }
            else if (std::holds_alternative<Bracket>(t))
            {
                Bracket bracket = std::get<Bracket>(t);

                if (bracket == Bracket::left)
                {
                    stck.push(t);
                }
                else
                {
                    while (!is_left_bracket(stck.top()))
                    {
                        res.push_back(stck.top());
                        stck.pop();
                    }
                    stck.pop();
                }
            }
        }

        while (!stck.empty())
        {
            res.push_back(stck.top());
            stck.pop();
        }

        return res;
    }
};

int main()
{

    std::list<token> operation = {3, Operator::plus, Bracket::left, 8, Operator::minus, 2, Operator::mult, 1, Bracket::right};

    auto rpn = Parser::parse_to_rpn(operation);

    print_operation(rpn);


    std::string str = "1+3*(2+2+1)-7/2";

    auto operation2 = Lexer::tokenize_string(str);

    print_operation(operation2);

    auto rpn2 = Parser::parse_to_rpn(operation2);

    print_operation(rpn2);

    return 0;
}