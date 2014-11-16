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

(**
*)

type status = Free | Cross | Circle | Tie
(**
   The different cell status possible.
*)

type 'c morpion
(**
   The type of the morpion.
*)

type rmorpion = status morpion morpion
(**
   The type of the recursive morpion.
*)

type location = int * int
(**
   The type of a location in the morpion.
*)

type rlocation = location * location
(**
   The type of a location in the recursive morpion.
   If [(loc1, loc2)] has type [rlocation], then loc1 is the position in the
   big morpion, and loc2 in the little morpion in big morpion's cell.
*)

val get : 'c morpion -> location -> 'c
(**
   [get m l] returns the cell of the morpion [m] located at location [l].
*)

val rget : rmorpion -> rlocation -> status
(**
   [rget rm rl] returns the cell of the recursive morpion [rm] located at
   rlocation [rl].
*)

val set : 'c morpion -> location -> 'c -> unit
(**
   [set m l c] sets the cell of morpion [m] located at [l] to [c].
*)

val rset : rmorpion -> rlocation -> status -> unit
(**
   [rset rm rl s] sets the cell of the recursive morpion [rm] located at
   rlocation [rl] to status [s].
*)

