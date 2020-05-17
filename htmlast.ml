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
  | Emoins of ( expr * expr )
  | Emult of ( expr * expr )
  | Edivis of ( expr * expr )
  | Eimg of ( string * string )
  | Elink of ( string * string )
  | Eseq of (expr * expr )
;;


let rec print oc = function
  | EInt n -> Printf.fprintf oc "%d" n
  | Estring s -> Printf.fprintf oc "\"%s\"" s
  | Eh1 (e) -> Printf.fprintf oc "BEGTITRE %a ENDTITRE" print e
  | Eh2 (e) -> Printf.fprintf oc "BEGSTITRE %a ENDSTITRE" print e
  | Ep (e) -> Printf.fprintf oc "BEGP %a ENDP" print e
  | Ediv (e) -> Printf.fprintf oc "BEGDIV %a ENDDIV" print e
  | Estrong (e) -> Printf.fprintf oc "BEGSTRONG %a ENDSTRONG" print e
  | Ebr -> Printf.fprintf oc "BR"
  | Eplus (e1,e2) -> Printf.fprintf oc "(%a + %a)" print e1 print e2
  | Emoins (e1,e2) -> Printf.fprintf oc "(%a - %a)" print e1 print e2
  | Edivis (e1,e2) -> Printf.fprintf oc "(%a / %a)" print e1 print e2
  | Emult (e1,e2) -> Printf.fprintf oc "(%a * %a)" print e1 print e2
  | Eimg (s1,s2) -> Printf.fprintf oc "IMG %s %s" s1 s2
  | Elink (s1,s2) -> Printf.fprintf oc "LINK %s %s" s1 s2
  | Eseq (e1,e2) -> Printf.fprintf oc "%a  %a" print e1 print e2

  
;;
