%option noyywrap
%{
  int i = 0;
  int chars = 1;
  int lines = 1;
%}

%%
[\n] { lines++; chars = 1; } 

  /*tab e white*/
[ \t]     { chars += strlen(yytext); } 

[0-9]+                   { }

[a-zA-Z_][a-zA-Z0-9_]*   { printf("%s\n",yytext); }

.  { }
%%

int main(int argc, char **argv){
  yylex();
  return 0;
}
