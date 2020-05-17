open Htmlast;;

type htmlval =
  | Intval of int
  | Stringval of string
  | Brval
  | Balval of {balise:string; body: htmlval; env: environment}
  | Imgval of {src:string; alt:string; env: environment}
  | Linkval of {href:string; txt:string; env: environment}
  | Seqval of (htmlval * htmlval)

and environment = (string * htmlval) list
;;


let rec printval = function
  | Intval n -> Printf.printf "%d" n
  | Stringval s -> Printf.printf "%s" s
  | Brval -> Printf.printf "<br>"
  | Balval b -> Printf.printf "<%s>" b.balise ; printval b.body ; Printf.printf "</%s>" b.balise
  | Imgval i -> Printf.printf "<img src=%S alt=%S >" i.src i.alt
  | Linkval i -> Printf.printf "<a href=%S> %s </a>" i.href i.txt
  | Seqval (e1, e2) -> printval e1; printval e2
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
  | Eimg (s1, s2) -> Imgval { src = s1; alt = s2 ; env = rho }
  | Elink (s1, s2) -> Linkval { href = s1; txt = s2 ; env = rho }
  | Eseq (e1, e2) -> let e1_val = eval e1 rho in let e2_val = eval e2 rho in Seqval (e1_val, e2_val)

;;


let eval e = eval e init_env ;;