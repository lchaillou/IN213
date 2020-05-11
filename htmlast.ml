(* Ce fichier contient la d�finition du type OCaml des arbres de
 * syntaxe abstraite du langage, ainsi qu'un imprimeur des phrases
 * du langage.
*)

type expr =
  | EInt of int                                 (* 1, 2, 3 *)
  | Estring of string                           (* "hello" *)
  | Ebr 
  | Eh1 of expr
  | Eh2 of expr
  | Ep of expr
  | Estrong of expr
  | Ediv of expr
  | Eplus of ( expr * expr )
;;


let rec print oc = function
  | EInt n -> Printf.fprintf oc "%d" n
  | Estring s -> Printf.fprintf oc "\"%s\"" s
  | Eh1 (e) -> Printf.fprintf oc "<h1> %a </h1>" print e
  | Eh2 (e) -> Printf.fprintf oc "<h2> %a </h2>" print e
  | Ep (e) -> Printf.fprintf oc "<p> %a </p>" print e
  | Ediv (e) -> Printf.fprintf oc "<div> %a </div>" print e
  | Estrong (e) -> Printf.fprintf oc "<strong> %a </strong>" print e
  | Ebr -> Printf.fprintf oc "<br>"
  | Eplus (e1,e2) -> Printf.fprintf oc "(%a + %a)" print e1 print e2

  
;;
