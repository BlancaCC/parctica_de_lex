/**
   Find telephone number, dates, car number plate, NIF
Blanca Cano Camarero 

pattern: 
NIF: 8 digit and a letter of control {RESTO = NUMBER %RESTO}

23 	0 	1 	2 	3 	4 	5 	6 	7 	8 	9 	10 	11
LETRA 	T 	R 	W 	A 	G 	M 	Y 	F 	P 	D 	X 	B

 
RESTO 	12 	13 	14 	15 	16 	17 	18 	19 	20 	21 	22
LETRA 	N 	J 	Z 	S 	Q 	V 	H 	L 	C 	K 	E 
Grananda 2/XI/19
 */

/* --- Sección de declaraciones --- */

%{
#include <stdio.h>

  int  isNIF ( char s[9]);  // 1 if is NIF else 0
  void posibleNIF(char s[9]);  //printf nif

%}


letrasDni       [TRWAGMYFPDXBNJZSQVHLCKE]
let		[A-Za-z]
num		[0-9]
car	        ({let}|{num}|\.|_)
car2            ({car}|[@#~¡'¿?=&%$!])


  

%%

{num}{8}{letrasDni}	{posibleNIF(yytext);}  //DNI
.|\n                     {;}
%%

/* --- Sección de Procedimientos ---*/

int main (int argc, char *argv[]) {
  if (argc == 2) {
    yyin = fopen (argv[1], "rt");
    if (yyin == NULL) {
      printf ("El fichero %s no se puede abrir\n", argv[1]);
      exit (-1);
    }
  }
  else yyin = stdin;
  printf("Los nif encontrados son : \n");
  yylex ();
  return 0;

}



int isNIF(char s[9]) {

  int ret = 0;
  
char letter [] ={ 'T','R','W','A','G','M','Y','F','P','D','X','B','N','J','Z','S','Q','V','H','L','C','K','E'}; 
  int n=0;
  int aux;
  for(int i=0; i<8; i++) {
    aux = s[i]-'0'; 
    n = n*10+aux; 
  }
  if(s[8] == letter[n%23]) 
    ret = 1;

    return ret; 
}


void posibleNIF(char  s [9]) {
  
  if( isNIF(s) == 1)
    printf(" DNI %s ", s);
}



/// posibleNIF(&yytext);}//{printf("DNi: %s\n", yytext);} //imprime correo/
