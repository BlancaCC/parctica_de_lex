/**
Find comments in a text
Granada 
 */

/* --- Sección de declaraciones --- */

%{
#include <stdio.h>
int cntlinea = 0;
int cntmulti = 0; 

%}

finComentario \*\/
linea        \/\/[^\n]*\n
multilinea   "/*"([^\*]|"*"[^/])*{finComentario}

%%

{linea}	              {printf("Cometario %d linea: %s",(++cntlinea),yytext+2); }
{multilinea}           {printf("Cometario %d multilínea: %s\n",(++cntmulti),yytext); }
.|\n                  {;}
%%

// // \/\*[^{finComentario}]+{finComentario}
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
