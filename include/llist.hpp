#include <iostream>

struct Node
{
    int data;
    Node* next;

    Node(int value) : data(value), next(nullptr) {}
};

class Llist
{
    private:
        Node* head;

    public:
        Llist();
        ~Llist();
        
        void insert(int);
        void display();
};
