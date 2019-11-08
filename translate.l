/**
   Translate (good write)
   Pseudo relational data base to latex formula 

   Example: 
   - s(condition; set) => $$\sigma_(condition){set}$$
*/

%{
#include <stdio.h>
int leyendo_select = 0;
void laTex( char * s []); 
%}

selectInit    s\([^;\n]*\;
%%
{selectInit}   {
	       printf( "!!!%s!!!", yytext);}
.|n            {printf("%s",yytext);}
%%

int main(int argc, char *argv[]) {
  if (argc == 2) {
    yyin = fopen (argv[1], "rt");
    if (yyin == NULL) {
      printf ("El fichero %s no se puede abrir\n", argv[1]);
      exit (-1);
    }
  }
  else yyin = stdin;
  printf("El fichero cambiado es: \n");
  yylex ();
  return 0;

}


void laTex( char* s[])
