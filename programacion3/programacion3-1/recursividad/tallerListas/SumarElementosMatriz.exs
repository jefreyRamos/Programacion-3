defmodule SumarElementosMatriz do
  def suma_matriz([]), do: 0
  def suma_matriz([fila | resto]), do: suma_fila(fila) + suma_matriz(resto)

  defp suma_fila([]), do: 0
  defp suma_fila([h | t]), do: h + suma_fila(t)
end
IO.inspect(SumarElementosMatriz.suma_matriz([[1, 2, 3], [4, 5, 6], [7, 8, 9]]))
