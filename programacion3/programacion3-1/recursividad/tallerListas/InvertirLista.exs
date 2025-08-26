defmodule InvertirListas do
  def invertir([]), do: []
  def invertir([h | t]), do: invertir(t) ++ [h]
end
IO.inspect(s.invertir([1, 2, 3, 4, 5]))
