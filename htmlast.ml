(* Ce fichier contient la d�finition du type OCaml des arbres de
 * syntaxe abstraite du langage, ainsi qu'un imprimeur des phrases
 * du langage.
*)

type expr =
  | EInt of int                                 (* 1, 2, 3 *)
  | EString of string                           (* "hello" *)
  | Ebr 
  | Eh1 of expr
  | Eh2 of expr
  | Ep of expr
  | Estrong of expr
  | Ediv of expr
;;


(* Extrait les parametres d'une fonction anonyme
          (fun x1 -> fun x2 -> ... -> e)
   et produit
          ([x1; x2; ...], e)
 *)
(* let params_body e =
  let rec un_body params expr = match expr with
  | EFun( p, e) -> un_body (p::params) e
  | e -> (List.rev params, e) in
  un_body [] e
;; *)


(* Note : dans le printf d'OCaml, le format %a
   correspond a 2 arguments consecutifs :
        - une fonction d'impression de type (out_channel -> 'a -> unit)
        - un argument a imprimer, de type 'a
   Voir le cas EApp ci-dessous.
 *)
let rec print oc = function
  | EInt n -> Printf.fprintf oc "%d" n
  | EString s -> Printf.fprintf oc "\"%s\"" s
  | EApp (e1, e2) -> Printf.fprintf oc "(%a %a)" print e1 print e2
  | ELet (f, e1, e2) ->
      let (params, e) = params_body e1 in
      Printf.fprintf oc "(let %s %a= %a in %a)"
        f
        (fun oc -> List.iter (fun s -> Printf.fprintf oc "%s " s)) params
        print e
        print e2
  | ELetrec (f, x, e1, e2) ->
      let (params, e) = params_body e1 in
      Printf.fprintf oc "(let rec %s %s %a= %a in %a)"
        f x
        (fun oc -> List.iter (fun s -> Printf.fprintf oc "%s " s)) params
        print e
        print e2
  | EFun (x, e) -> Printf.fprintf oc "(fun %s -> %a)"  x print e
  | EIf (test, e1, e2) ->
      Printf.fprintf oc "(if %a then %a else %a)" print test print e1 print e2
  | EBinop (op,e1,e2) ->
      Printf.fprintf oc "(%a %s %a)" print e1 op print e2
  | EMonop (op,e) -> Printf.fprintf oc "%s%a" op print e
;;
