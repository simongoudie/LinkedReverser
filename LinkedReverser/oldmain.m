/*
// enter string
// print, reverse, print

#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct node
{
    char n;
    struct node *next;
}
node;

int
main (void)
{
//creates the first node, ie, the list
    node *first = NULL;

//SETUP THE STRING IN THE LIST
//receive the string
    char thestring[81];
    printf("Enter a string: ");
    scanf("%s", (char *)&thestring);

//set the string in nodes
    int i;
    for (i = 0; i<strlen(thestring); i++){
        
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


//print off each node
    node *ptr = first;
    printf("Received string: ");
    while (ptr != NULL) {
        printf("%c", ptr->n);
        ptr = ptr->next;
    }
    printf("\n");

//REVERSE THE STRING
    printf("Now reversing the string...\n");
    
//set last
    node *predpnt = first;
    while (predpnt->next != NULL)
           predpnt = predpnt->next;
    node *last = predpnt;
    
//reverse strings    
    while (first->next != NULL){
        ptr = NULL;
        node *predpnt = first;
        while (predpnt->next != NULL){
            ptr = predpnt;
            predpnt = predpnt->next;
        }
        predpnt->next = ptr;
        ptr->next = NULL;    
    }
    
//fix first and last (hack)
    ptr=last;
    last=first;
    first=ptr;

//print off each node
    ptr = first;
    printf("Reversed string is: ");
    while (ptr != NULL) {
        printf("%c", ptr->n);
        ptr = ptr->next;
    }
//    printf("%c", last->n);
    printf("\n");    
    
//free all the nodes
    ptr = first;
    while (ptr != NULL)
    {
        node *predptr = ptr;
        ptr = ptr->next;
        free(predptr);
    }
    free (ptr);
    return 0;
}
*/