%{
  open Htmlast;;

  let rec mkfun params expr = match params with
  | [] -> expr
  | p :: prms -> EFun(p, mkfun prms expr)
  ;;
%}

/* %token <int> INT
%token <string> IDENT
%token TRUE FALSE
%token <string> STRING
%token PLUS MINUS MULT DIV EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%token LPAR RPAR SEMICOLON
%token LET REC IN FUN ARROW
%token IF THEN ELSE
%left EQUAL GREATER SMALLER GREATEREQUAL SMALLEREQUAL
%left PLUS MINUS
%left MULT DIV */

%token <int> INT
%token <string> STRING
%token PLUS
%token BEGH1 ENDH1 BEGH2 ENDH2 BEGP ENDP BEGSTRONG ENDSTRONG BEGDIV ENDDIV
%token BR
%token SEMICOLON


%start main
%type <Htmlast.expr> main

%%

main: expr SEMICOLON { $1 }
    | SEMICOLON main { $2 }
;

/* Grammaire ci-dessous a finir */

/* expr:
 INT        { EInt $1 }
 |IDENT      { EIdent $1}
 |LPAR expr RPAR { $2}
 |LET IDENT EQUAL expr IN expr { ELet ($2,$4,$6)}
 |FUN IDENT ARROW expr {EFun ($2, $4)}
; */

expr:
  INT     { EInt $1}
  |BR      { Ebr}
  |STRING  { Estring $1}
  |BEGH1 expr ENDH1 { Eh1 $1}
  |BEGH2 expr ENDH2 { Eh2 $1}
  |BEGP expr ENDP { Ep $1}
  |BEGSTRONG expr ENDSTRONG { Estrong $1}
  |BEGDIV expr ENDDIV { Ediv $1}

