%{
  open Htmlast;;

%}


%token <int> INT
%token <string> STRING
%token PLUS MOINS DIV MULT
%token BEGH1 ENDH1 BEGH2 ENDH2 BEGP ENDP BEGSTRONG ENDSTRONG BEGDIV ENDDIV
%token BR IMG LINK
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
  |expr PLUS expr {Eplus ($1,$3)}
  |expr MOINS expr {Emoins ($1,$3)}
  |expr DIV expr {Edivis ($1,$3)}
  |expr MULT expr {Emult ($1,$3)}
  |IMG STRING STRING {Eimg ($2,$3)}
  |LINK STRING STRING {Elink ($2,$3)}

