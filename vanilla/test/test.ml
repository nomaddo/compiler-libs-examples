let f x =
  (x, x)

let g (x, y) =
  Printf.printf "%d %d " x y

let _ =
  123 |> f |> g
