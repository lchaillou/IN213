%{
  open Htmlast;;

%}


%token <int> INT
%token <string> STRING
%token PLUS
%token BEGH1 ENDH1 BEGH2 ENDH2 BEGP ENDP BEGSTRONG ENDSTRONG BEGDIV ENDDIV
%token BR
%token SEMICOLON


%start main
%type <Htmlast.expr> main

%%

main: 
    | expr SEMICOLON { $1 }
;



expr:
  INT     { EInt $1}
  |BR      { Ebr}
  |STRING  { Estring $1}
  |BEGH1 expr ENDH1 { Eh1 $2}
  |BEGH2 expr ENDH2 { Eh2 $2}
  |BEGP expr ENDP { Ep $2}
  |BEGSTRONG expr ENDSTRONG { Estrong $2}
  |BEGDIV expr ENDDIV { Ediv $2}
  |INT PLUS INT {Eplus ($1,$3)}

