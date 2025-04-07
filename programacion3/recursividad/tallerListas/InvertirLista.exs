defmodule InvertirLista do
  def invertir([]), do: []
  def invertir([h | t]), do: invertir(t) ++ [h]
end
IO.inspect(InvertirLista.invertir([1, 2, 3, 4, 5]))
