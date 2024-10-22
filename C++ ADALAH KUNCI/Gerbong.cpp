#include <iostream>
#include <vector>

using namespace std;
struct Node {
  int data; 
  Node* next; 
};
Node* head = NULL; 

Node* insertNode(int data) {
  Node* newNode = new Node; 
  newNode->data = data; 
  newNode->next = head; 
  head = newNode; 
  return head;
}


void printList() {
  Node* temp = head; 
    while (temp != NULL) { 
    cout << temp->data << " "; 
    temp = temp->next; 
  }
  cout << endl;
}

int main() {
  
  head = insertNode(10);
  head = insertNode(20);
  head = insertNode(30);

  printList();

  return 0;
}
