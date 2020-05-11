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
  | Ebr -> Brval
  | Eh1 (e) -> let e_val = eval e rho in Balval { balise = "h1" ; body = e_val ; env = rho }
      


  (* | EIdent v -> lookup v rho
  | EApp (e1, e2) -> (
      match (eval e1 rho, eval e2 rho) with
      | (Funval { param; body; env }, v2) ->
          let rho1 = extend env param v2 in
          eval body rho1
      | (Funrecval { fname; param; body; env } as fval, v2) ->
          let rho1 = extend env fname fval in
          let rho2 = extend rho1 param v2 in
          eval body rho2
      | (_, _) -> error "Apply a non-function"
     )
  | EMonop ("-", e) -> (
      match eval e rho with
      | Intval n -> Intval (-n)
      | _ -> error "Opposite of a non-integer"
     )
  | EMonop (op, _) -> error (Printf.sprintf "Unknown unary op: %s" op)
  | EBinop (op, e1, e2) -> (
      match (op, eval e1 rho, eval e2 rho) with
      | ("+", Intval n1, Intval n2) -> Intval (n1 + n2)
      | ("-", Intval n1, Intval n2) -> Intval (n1 - n2)
      | ("*", Intval n1, Intval n2) -> Intval (n1 * n2)
      | ("/", Intval n1, Intval n2) -> Intval (n1 / n2)
      | (("+"|"-"|"*"|"/"), _, _) ->
          error "Arithmetic on non-integers"
      | ("<",  Intval n1, Intval n2) -> Boolval (n1 < n2)
      | (">",  Intval n1, Intval n2) -> Boolval (n1 > n2)
      | ("=",  Intval n1, Intval n2) -> Boolval (n1 = n2)
      | ("<=", Intval n1, Intval n2) -> Boolval (n1 <= n2)
      | (">=", Intval n1, Intval n2) -> Boolval (n1 >= n2)
      | (("<"|">"|"="|"<="|">="), _, _) ->
          error "Comparison of non-integers"
      | _ -> error (Printf.sprintf "Unknown binary op: %s" op)
     )
  | EIf (e, e1, e2) -> (
      match eval e rho with
      | Boolval b -> eval (if b then e1 else e2) rho
      | _ -> error "Test on a non-boolean"
     )
  | EFun (a, e) -> Funval { param = a; body = e; env = rho }
  | ELet (x, e1, e2) ->
      let v1 = eval e1 rho in
      let rho1 = extend rho x v1 in
      eval e2 rho1
  | ELetrec (f, x, e1, e2) ->
      let fval = Funrecval { fname = f; param = x; body = e1; env = rho } in
      let rho1 = extend rho f fval in
      eval e2 rho1 *)
;;


let eval e = eval e init_env ;;