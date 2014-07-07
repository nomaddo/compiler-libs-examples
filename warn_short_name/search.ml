(* The Main file to find short names  *)

open TypedtreeIter
open Typedtree

type cell = {name:string; loc:Location.t}
type table = cell list

let table : table ref = ref []
let (@|) f x = f x
let (>>) e lref = lref := e :: !lref

module Iter = struct
  include DefaultIteratorArgument
  let entry_table_of_strloc strloc =
    let open Asttypes in
    if String.length strloc.txt <= 2
    then begin
      let name = strloc.txt in
      let loc = strloc.loc in
      {name; loc} >> table
    end

  let rec enter_pattern pat =
    match pat.pat_desc with
    | Tpat_var (_, strloc) ->
      entry_table_of_strloc strloc
    | Tpat_alias (_ , _, strloc) ->
      entry_table_of_strloc strloc
    | _ -> ()
end

let print_table (table : table) =
  let ppf = Format.std_formatter in
  let print {name; loc} =
    Format.printf "%s " name;
    Location.print_loc ppf loc;
    Format.printf "@." in
  if List.length table > 0
  then begin
    print_endline "following name(s) are too short:\n";
    List.iter print table
  end

module M = MakeIterator(Iter)
