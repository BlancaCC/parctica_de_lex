#include <stdio.h>


int isNIF(char s[9]) {

  int ret = 0;
  
  char letter [] ={'T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E'}; 
 
  int n=0;
  int aux;
  for(int i=0; i<8; i++) {
    aux = s[i]-'0'; 
    n = n*10+aux; 
  }
  

  printf("(%d )%c == %c \n",n%28, s[8],letter[n%23]);
  if(s[8] == letter[n%23]) 
    ret = 1;

    return ret; 
}


void posibleNIF(char  s [9]) {
  printf("ha sobrevivido aquí ");
  if( isNIF(s) == 1)
    printf(" DNI %s ", s);
}


int main() {
  char * dni = "12345678Z";

  posibleNIF(dni);
}
