/* --- Sección de declaraciones --- */

%{
#include <stdio.h>

%}



let		[A-Za-z]
num		[0-9]
car	        ({let}|{num}|\.|_)
car2            ({car}|[@#~¡'¿?=&%$!])


  

%%

{car}+@+{car}+\.{let}{2,3}	{printf("correo: %s\n", yytext);} //imprime correo
(http(s)?:\/\/)?((w){3}|{car}+)\.{car2}*(\/{car2}+)*           {printf("\t\t\t\t\turl: %s\n" , yytext);} //imprime url
.|\n
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
  printf("Los correos  y urls encontrados son : \n");
  yylex ();
  return 0;

}


