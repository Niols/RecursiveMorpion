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

type 'c morpion = 'c array

type rmorpion = status morpion morpion

type location = int * int

type rlocation = location * location


let loc_to_i (x, y) =
  


exception Error of string

let get m l =
  try
    m.(loc_to_i l)
  with
  | Invalid_argument "index out of bounds" ->
    raise (Error "bad location")

let rget rm (l1, l2) =
  get (get rm l1) l2
