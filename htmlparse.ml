type token =
  | INT of (int)
  | STRING of (string)
  | PLUS
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

# 24 "htmlparse.ml"
let yytransl_const = [|
  259 (* PLUS *);
  260 (* BEGH1 *);
  261 (* ENDH1 *);
  262 (* BEGH2 *);
  263 (* ENDH2 *);
  264 (* BEGP *);
  265 (* ENDP *);
  266 (* BEGSTRONG *);
  267 (* ENDSTRONG *);
  268 (* BEGDIV *);
  269 (* ENDDIV *);
  270 (* BR *);
  271 (* SEMICOLON *);
    0|]

let yytransl_block = [|
  257 (* INT *);
  258 (* STRING *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\002\000\002\000\002\000\
\002\000\002\000\000\000"

let yylen = "\002\000\
\002\000\001\000\001\000\001\000\003\000\003\000\003\000\003\000\
\003\000\003\000\002\000"

let yydefred = "\000\000\
\000\000\000\000\000\000\004\000\000\000\000\000\000\000\000\000\
\000\000\003\000\011\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\001\000\010\000\005\000\006\000\007\000\008\000\
\009\000"

let yydgoto = "\002\000\
\011\000\012\000"

let yysindex = "\018\000\
\255\254\000\000\017\255\000\000\255\254\255\254\255\254\255\254\
\255\254\000\000\000\000\006\255\021\255\018\255\019\255\015\255\
\014\255\016\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yyrindex = "\000\000\
\000\000\000\000\253\254\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000"

let yygindex = "\000\000\
\000\000\009\000"

let yytablesize = 29
let yytable = "\003\000\
\004\000\002\000\005\000\002\000\006\000\002\000\007\000\002\000\
\008\000\002\000\009\000\002\000\010\000\014\000\015\000\016\000\
\017\000\018\000\001\000\013\000\019\000\020\000\021\000\023\000\
\024\000\022\000\000\000\000\000\025\000"

let yycheck = "\001\001\
\002\001\005\001\004\001\007\001\006\001\009\001\008\001\011\001\
\010\001\013\001\012\001\015\001\014\001\005\000\006\000\007\000\
\008\000\009\000\001\000\003\001\015\001\001\001\005\001\009\001\
\011\001\007\001\255\255\255\255\013\001"

let yynames_const = "\
  PLUS\000\
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
# 119 "htmlparse.ml"
               : Htmlast.expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 27 "htmlparse.mly"
          ( EInt _1)
# 126 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 28 "htmlparse.mly"
           ( Ebr)
# 132 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 29 "htmlparse.mly"
           ( Estring _1)
# 139 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 30 "htmlparse.mly"
                    ( Eh1 _2)
# 146 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 31 "htmlparse.mly"
                    ( Eh2 _2)
# 153 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 32 "htmlparse.mly"
                  ( Ep _2)
# 160 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 33 "htmlparse.mly"
                            ( Estrong _2)
# 167 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 34 "htmlparse.mly"
                      ( Ediv _2)
# 174 "htmlparse.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : int) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 35 "htmlparse.mly"
                (Eplus (_1,_3))
# 182 "htmlparse.ml"
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
