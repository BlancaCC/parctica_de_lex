/* --- Sección de declaraciones --- */

%{
#include <stdio.h>

int nc, np,nl;

void escribir_datos( int dato1, int dato2, int dato3); 
%}



let		[A-Za-z]
num		[0-9]
car	        ({let}|{num}|\.|_)


%%

{car}+@+{car}+\.{let}{2,3}	{printf("%s\n", yytext);}
.|\n
%%

/* --- Sección de Procedimientos ---*/
  //[A-Za-z]+@+[A-Za-z\.0-9]+\.[A-Za-z]{2,3}	{printf("%s\n", yytext);}

int main (int argc, char *argv[]) {
  if (argc == 2) {
    yyin = fopen (argv[1], "rt");
    if (yyin == NULL) {
      printf ("El fichero %s no se puede abrir\n", argv[1]);
      exit (-1);
    }
  }
  else yyin = stdin;
  printf("Los correos encontrados son : \n");
  yylex ();
  //escribir_datos(nc,np,nl);
  return 0;

}

void escribir_datos (int dato1, int dato2, int dato3) {
  printf ("Num_caracteres=%d\tNum_palabras=%d\tNum_líneas=%d\n", dato1,dato2,dato3);
}

/** [{caracteres}+@{caracteres}+\.{1}{caracteres}+[\t\n]] {printf("El correo encontrado es %s", yytext);} **/

