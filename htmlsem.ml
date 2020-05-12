open Htmlast;;

type htmlval =
  | Intval of int
  | Stringval of string
  | Brval
  | Balval of {balise:string; body: htmlval; env: environment}

and environment = (string * htmlval) list
;;


let rec printval = function
  | Intval n -> Printf.printf "%d" n
  | Stringval s -> Printf.printf "%S" s
  | Brval -> Printf.printf "<br>"
  | Balval b -> Printf.printf "<%S>" b.balise ; printval b.body ; Printf.printf "</%S>" b.balise
;;

(* Environnement. *)
let init_env = [] ;;

let error msg = raise (Failure msg) ;;

let extend rho x v = (x, v) :: rho ;;

let lookup var_name rho =
  try List.assoc var_name rho
  with Not_found -> error (Printf.sprintf "Undefined ident '%s'" var_name)
;;


let rec eval e rho =
  match e with
  | EInt n -> Intval n
  | Estring s -> Stringval s
  | Eplus (e1,e2) -> (
      match (eval e1 rho, eval e2 rho) with
      | (Intval n1, Intval n2) -> Intval (n1 + n2)
  )
  | Emoins (e1,e2) -> (
      match (eval e1 rho, eval e2 rho) with
      | (Intval n1, Intval n2) -> Intval (n1 - n2)
  )
  | Emult (e1,e2) -> (
      match (eval e1 rho, eval e2 rho) with
      | (Intval n1, Intval n2) -> Intval (n1 * n2)
  )
  | Edivis (e1,e2) -> (
      match (eval e1 rho, eval e2 rho) with
      | (Intval n1, Intval n2) -> Intval (n1 / n2)
  )
  | Ebr -> Brval
  | Eh1 (e) -> let e_val = eval e rho in Balval { balise = "h1" ; body = e_val ; env = rho }
  | Eh2 (e) -> let e_val = eval e rho in Balval { balise = "h2" ; body = e_val ; env = rho }
  | Ep (e) -> let e_val = eval e rho in Balval { balise = "p" ; body = e_val ; env = rho }
  | Ediv (e) -> let e_val = eval e rho in Balval { balise = "div" ; body = e_val ; env = rho }
  | Estrong (e) -> let e_val = eval e rho in Balval { balise = "strong" ; body = e_val ; env = rho }

;;


let eval e = eval e init_env ;;