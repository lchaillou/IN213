type token =
  | INT of (int)
  | STRING of (string)
  | PLUS
  | MOINS
  | DIV
  | MULT
  | BEGH1
  | ENDH1
  | BEGH2
  | ENDH2
  | BEGP
  | ENDP
  | BEGSTRONG
  | ENDSTRONG
  | BEGDIV
  | ENDDIV
  | BR
  | SEMICOLON

val main :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Htmlast.expr
