%{
  open Htmlast;;

%}


%token <int> INT
%token <string> STRING
%token PLUS MOINS DIV MULT
%token BEGH1 ENDH1 BEGH2 ENDH2 BEGP ENDP BEGSTRONG ENDSTRONG BEGDIV ENDDIV
%token BR IMG LINK
%token SEMICOLON
%left PLUS MINUS
%left MULT DIV


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
  |BEGDIV expr_seq ENDDIV { Ediv $2}
  |ope {$1}
  |IMG STRING STRING {Eimg ($2,$3)}
  |LINK STRING STRING {Elink ($2,$3)}
  
ope :
  |INT { EInt $1 }
  |ope PLUS ope {Eplus ($1,$3)}
  |ope MOINS ope {Emoins ($1,$3)}
  |ope DIV ope {Edivis ($1,$3)}
  |ope MULT ope {Emult ($1,$3)}

expr_seq:
  | expr expr_seq { Eseq($1,$2) }
  | expr {$1}

