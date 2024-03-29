// reverse string, by simongoudie
// get string, print, reverse, print, free

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct node{
    char n;
    struct node *next;
} node;

void getString (void);
int setStringNodes (void);
void printNodes (void);
void reverseString (void);
void freeNodes (void);

node *first = NULL;
char thestring[81];

int main (void){
    getString();
    setStringNodes();
    printf("Received string: ");
    printNodes();
    printf("Now reversing the string...\n");
    reverseString();
    printf("Reversed string is: ");
    printNodes();  
    freeNodes();
    return 0;
}

void getString (void){
//request and get a string
    printf("\nEnter a string: ");
    fgets(thestring, 81, stdin);
}

int setStringNodes (void){
//set the string in nodes
    int i;
    for (i = 0; i<(strlen(thestring))-1; i++){
//fill newptr with next char and NULL, confirm
        node *newptr = malloc(sizeof(node));
        if (newptr == NULL)
            return 1;
        newptr->n = thestring[i];
        newptr->next = NULL;
//check for empty list
        if (first == NULL)
            first = newptr;
//create predpnt and make sure it is the last node in the list
        else {
            node *predpnt = first;
            while (predpnt->next != NULL)
                predpnt = predpnt->next;
            predpnt->next = newptr;
        }
    }
return 0;
}

void printNodes (void){
//print off each node
    node *ptr = first;
    while (ptr != NULL) {
        printf("%c", ptr->n);
        ptr = ptr->next;
    }
    printf("\n");
}

void reverseString (void){
//set last
    node *predpnt = first;
    while (predpnt->next != NULL)
        predpnt = predpnt->next;
    node *last = predpnt;
//reverse strings    
    while (first->next != NULL){
        node *ptr = NULL;
        predpnt = first;
        while (predpnt->next != NULL){
            ptr = predpnt;
            predpnt = predpnt->next;
        }
        predpnt->next = ptr;
        ptr->next = NULL;    
    }
//fix first and last (hack)
    node *ptr;
    ptr=last;
    last=first;
    first=ptr;
}

void freeNodes (void){
//free all the nodes
    node *ptr;
    ptr = first;
    while (ptr != NULL)
    {
        node *predptr = ptr;
        ptr = ptr->next;
        free(predptr);
    }
    free (ptr);
}