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

open Parsing;;
let _ = parse_error;;
# 2 "htmlparse.mly"
  open Htmlast;;

# 27 "htmlparse.ml"
let yytransl_const = [|
  259 (* PLUS *);
  260 (* MOINS *);
  261 (* DIV *);
  262 (* MULT *);
  263 (* BEGH1 *);
  264 (* ENDH1 *);
  265 (* BEGH2 *);
  266 (* ENDH2 *);
  267 (* BEGP *);
  268 (* ENDP *);
  269 (* BEGSTRONG *);
  270 (* ENDSTRONG *);
  271 (* BEGDIV *);
  272 (* ENDDIV *);
  273 (* BR *);
  274 (* SEMICOLON *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\002\000\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\002\000\004\000\000\000\000\000\000\000\000\000\
\000\000\003\000\014\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\001\000\005\000\006\000\
\007\000\008\000\009\000\000\000\000\000\000\000\000\000"

let yydgoto = "\002\000\
\011\000\012\000"

let yysindex = "\008\000\
\010\255\000\000\000\000\000\000\010\255\010\255\010\255\010\255\
\010\255\000\000\000\000\002\255\077\255\069\255\065\255\029\255\
\025\255\010\255\010\255\010\255\010\255\000\000\000\000\000\000\
\000\000\000\000\000\000\083\255\083\255\083\255\083\255"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\028\255\037\255\040\255\049\255"

let yygindex = "\000\000\
\000\000\251\255"

let yytablesize = 89
let yytable = "\013\000\
\014\000\015\000\016\000\017\000\018\000\019\000\020\000\021\000\
\001\000\000\000\003\000\004\000\028\000\029\000\030\000\031\000\
\005\000\000\000\006\000\022\000\007\000\000\000\008\000\000\000\
\009\000\000\000\010\000\018\000\019\000\020\000\021\000\018\000\
\019\000\020\000\021\000\010\000\000\000\010\000\000\000\010\000\
\027\000\010\000\026\000\010\000\011\000\010\000\011\000\012\000\
\011\000\012\000\011\000\012\000\011\000\012\000\011\000\012\000\
\013\000\012\000\013\000\000\000\013\000\000\000\013\000\000\000\
\013\000\000\000\013\000\018\000\019\000\020\000\021\000\018\000\
\019\000\020\000\021\000\000\000\025\000\000\000\024\000\018\000\
\019\000\020\000\021\000\000\000\023\000\018\000\019\000\020\000\
\021\000"

let yycheck = "\005\000\
\006\000\007\000\008\000\009\000\003\001\004\001\005\001\006\001\
\001\000\255\255\001\001\002\001\018\000\019\000\020\000\021\000\
\007\001\255\255\009\001\018\001\011\001\255\255\013\001\255\255\
\015\001\255\255\017\001\003\001\004\001\005\001\006\001\003\001\
\004\001\005\001\006\001\008\001\255\255\010\001\255\255\012\001\
\016\001\014\001\014\001\016\001\008\001\018\001\010\001\008\001\
\012\001\010\001\014\001\012\001\016\001\014\001\018\001\016\001\
\008\001\018\001\010\001\255\255\012\001\255\255\014\001\255\255\
\016\001\255\255\018\001\003\001\004\001\005\001\006\001\003\001\
\004\001\005\001\006\001\255\255\012\001\255\255\010\001\003\001\
\004\001\005\001\006\001\255\255\008\001\003\001\004\001\005\001\
\006\001"

let yynames_const = "\
  PLUS\000\
  MOINS\000\
  DIV\000\
  MULT\000\
  BEGH1\000\
  ENDH1\000\
  BEGH2\000\
  ENDH2\000\
  BEGP\000\
  ENDP\000\
  BEGSTRONG\000\
  ENDSTRONG\000\
  BEGDIV\000\
  ENDDIV\000\
  BR\000\
  SEMICOLON\000\
  "

let yynames_block = "\
  INT\000\
  STRING\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 21 "htmlparse.mly"
                     ( _1 )
# 144 "htmlparse.ml"
               : Htmlast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 27 "htmlparse.mly"
          ( EInt _1)
# 151 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 28 "htmlparse.mly"
           ( Ebr)
# 157 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 29 "htmlparse.mly"
           ( Estring _1)
# 164 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "htmlparse.mly"
                    ( Eh1 _2)
# 171 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 31 "htmlparse.mly"
                    ( Eh2 _2)
# 178 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 32 "htmlparse.mly"
                  ( Ep _2)
# 185 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 33 "htmlparse.mly"
                            ( Estrong _2)
# 192 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 34 "htmlparse.mly"
                      ( Ediv _2)
# 199 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 35 "htmlparse.mly"
                  (Eplus (_1,_3))
# 207 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 36 "htmlparse.mly"
                   (Emoins (_1,_3))
# 215 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 37 "htmlparse.mly"
                 (Edivis (_1,_3))
# 223 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 38 "htmlparse.mly"
                  (Emult (_1,_3))
# 231 "htmlparse.ml"
               : 'expr))
(* Entry main *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let main (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Htmlast.expr)
