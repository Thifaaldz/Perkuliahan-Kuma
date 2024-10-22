#include <iostream>
using namespace std;

struct Gerbong {
  int data;
  Gerbong* next; 
};
Gerbong* head = NULL;
Gerbong* tail = NULL;
void masukkanGerbongDepan(int dataBaru) {
  Gerbong* newNode = new Gerbong;
  newNode->data = dataBaru;
  newNode->next = head;

  if (tail == NULL) {
    tail = newNode; 
  }

  head = newNode;
}
void masukkanGerbongBelakang(int dataBaru) { 
  Gerbong* newNode = new Gerbong;
  newNode->data = dataBaru;
  newNode->next = NULL; 
  
  if (tail == NULL) {
    head = newNode;
  } else {
    tail->next = newNode;
  }

  tail = newNode;
}
void hapusGerbongDepan() {
  if (head == NULL) {
    return;
  }
  Gerbong* temp = head;
  head = head->next;

  if (head == NULL) {
    tail = NULL;
  }
  delete temp;
}


void hapusGerbongBelakang() { 
  if (tail == NULL) {
    return; 
  }

  Gerbong* temp = head; 
  while (temp->next != tail) { 
    temp = temp->next;
  }

  temp->next = NULL; 
  tail = temp; 

  delete tail->next; 
}

void bantuGerbong(int data1, int data2) { 
  Gerbong* temp = head; 

  while (temp != NULL) { 
    if (temp->data == data1) { 
      temp->data = data2; 
    } else if (temp->data == data2) { 
      temp->data = data1; 
    }

    temp = temp->next; 
  }
} 
Gerbong* cariGerbong(int dataDicari) { 
  Gerbong* temp = head; 
  while (temp != NULL) {
    if (temp->data == dataDicari) {
      return temp; 
    }
    temp = temp->next;
  }
  return NULL; 
}