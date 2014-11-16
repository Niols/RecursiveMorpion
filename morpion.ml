(******************************************************************************)
(*                                                                            *)
(*                              Recursive Morpion                             *)
(*                                   Morpion                                  *)
(*                                                                            *)
(*   THE BEER-WARE LICENSE (Revision 42): Niols wrote this file.              *)
(*   As long as you retain this notice you can do whatever you want with      *)
(*   this stuff. If we meet some day, and you think this stuff is worth it,   *)
(*   you can buy me a beer in return.                                         *)
(*                                                                            *)
(******************************************************************************)


type status = Free | Cross | Circle | Tie

type 'c morpion = 'c array * ref status

type rmorpion = status morpion morpion

type location = int * int

type rlocation = location * location

let loc_to_i (x, y) =
  (x - 1) + 3 * (y - 1)

let i_to_loc i =
  ( 1 + (i mod 3) ,
    1 + (i / 3)   )

exception Error of string

let get (m, s) l =
  try
    m.(loc_to_i l)
  with
  | Invalid_argument "index out of bounds" ->
    raise (Error "bad location")

let rget rm (l1, l2) =
  get (get rm l1) l2

let set (m, s) l c =
  try
    m.(loc_to_i l) <- c
  with
  | Invalid_argument "index out of bounds" ->
    raise (Error "bad location")

let rset rm (l1, l2) s =
  set (get rm l1) l2 s

let gets (_, rs) =
  !rs

let rgets rm l =
  gets (get rm l)

let sets (_, rs) s =
  rs := s

let rsets rm l s =
  sets (get rm l) s

let create c =
  ( Array.make 9 c , Free )

let rcreate () =
  let rm = create (create Free) in
  for i = 1 to 9 - 1 do
    set rm (i_to_loc i) (create Free)
  done;
  rm

