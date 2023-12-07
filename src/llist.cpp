#include "llist.hpp"

Llist::Llist(): head(nullptr)
{

}

Llist::~Llist()
{
    
}

void Llist::insert(int value)
{
    Node* newNode = new Node(value);

    newNode->next = head;
    head = newNode;
}

void Llist::display()
{
    Node* current = head;
    while (current != nullptr) {
        std::cout << current->data << " ";
        current = current->next;
    }
    std::cout << std::endl;
}