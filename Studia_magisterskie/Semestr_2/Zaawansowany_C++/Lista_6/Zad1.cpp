#include <iostream>
#include <string>
#include <deque>
#include <algorithm>

class Person
{
    public:
    std::string first_name;
    std::string last_name;
    int age;
    int weight;
    int height;

    Person(std::string first_name, std::string last_name, int age, int weight, int height)
    {
        this->first_name = first_name;
        this->last_name = last_name;
        this->age = age;
        this->weight = weight;
        this->height = height;
    }

    Person()
    {
        
    }

    double BMI()
    {
        double height_in_meters = (double)height/100.0;

        return (double)weight / (height_in_meters * height_in_meters);
    }

    std::string to_string()
    {
        return first_name + " " + last_name;
    }

    bool operator==(const Person& other) const
    {
        return this->age == other.age && this->first_name == other.first_name && this->last_name == other.last_name && this->weight == other.weight && this->height == other.height;
    }
};


void print_deque(std::deque<Person> d)
{
    for (Person person: d)
    {
        std::cout << person.to_string() << "\n";
    };
}

std::deque<Person> init_deque()
{
    std::deque<Person> deque;
    deque.push_back(Person(std::string("Jan"), std::string("Kowalski"), 35, 80, 180));
    deque.push_back(Person(std::string("Andrzej"), std::string("Nowak"), 20, 65, 175));
    deque.push_back(Person(std::string("Agnieszka"), std::string("Malinowska"), 30, 50, 160));
    deque.push_back(Person(std::string("James"), std::string("Bond"), 50, 82, 180));
    deque.push_back(Person(std::string("Johny"), std::string("Cage"), 32, 106, 182));
    deque.push_back(Person(std::string("Kamil"), std::string("Michalak"), 23, 66, 175));
    deque.push_back(Person(std::string("Robert"), std::string("Lewandowski"), 33, 101, 181));
    deque.push_back(Person(std::string("Karolina"), std::string("Nowak"), 40, 60, 170));
    deque.push_back(Person(std::string("Elżbieta"), std::string("Jakubiak"), 42, 58, 166));
    deque.push_back(Person(std::string("Maria"), std::string("Skłodowska"), 80, 60, 160));
    deque.push_back(Person(std::string("Mikołaj"), std::string("Kopernik"), 60, 120, 180));

    return deque;
}


int main()
{
    // A
    auto deque = init_deque();

    auto bmi_cmp = [](Person a, Person b){
        return a.BMI() < b.BMI();
    };

    std::sort(deque.begin(), deque.end(), bmi_cmp);

    for (Person person: deque)
    {
        std::cout << person.to_string() << " " << person.BMI() << " " << person.weight << "\n";
    };

    std::cout << "\n";



    // B

    deque = init_deque();

    auto change_weight = [](Person person){
        person.weight = (0.9*person.weight);
        return person;
    };

    std::transform(deque.begin(), deque.end(), deque.begin(), change_weight);

    for (Person person: deque)
    {
        std::cout << person.to_string() << " " << person.weight << "\n";
    };

    std::cout << "\n";


    // C

    deque = init_deque();

    auto is_heavy = [](Person person){
        return person.weight > 100;
    };

    std::deque<Person> light(deque.size());

    auto light_end = std::remove_copy_if(deque.begin(), deque.end(), light.begin(), is_heavy);


    std::cout << "<= 100kg:\n";

    light.resize(light_end - light.begin());


    for (Person p: light)
    {
        std::cout << p.to_string() << " " << p.weight << "\n";
    }


    auto is_light = [](Person person){
        return person.weight <= 100;
    };



    std::deque<Person> heavy(deque.size());

    auto heavy_end = std::remove_copy_if(deque.begin(), deque.end(), heavy.begin(), is_light);


    std::cout << "> 100kg:\n";

    heavy.resize(heavy_end - heavy.begin());


    for (Person p: heavy)
    {
        std::cout << p.to_string() << " " << p.weight << "\n";
    }


    deque = init_deque();


    std::cout << "\nd)przed:\n";

    print_deque(deque);

    Person x("x", "d", 1, 2, 3);

    std::find(deque.begin(), deque.end(), x);

    auto cmp = [](Person a, Person b){
        return a.height < b.height;
    };

    std::nth_element(deque.begin(), deque.begin()+5, deque.end(), cmp);

    std::cout << "\npo:\n";

    for (Person p: deque)
    {
        std::cout << p.to_string() << " " << p.height << "\n";
    }

    std::cout << "\n";

    std::random_shuffle(deque.begin(), deque.begin()+4);
    std::random_shuffle(deque.begin()+6, deque.end());

    for (Person p: deque)
    {
        std::cout << p.to_string() << " " << p.height << "\n";
    }

    auto cmp_age = [](Person a, Person b) {
        return a.age < b.age;
    };


    auto youngest = std::min_element(deque.begin(), deque.end(), cmp_age);
    auto oldest = std::max_element(deque.begin(), deque.end(), cmp_age);

    std::cout << "\n\nNajmłodszy: ";

    std::cout << youngest->to_string() << "\nNajstarszy: ";
    std::cout << oldest->to_string() << "\n";
}