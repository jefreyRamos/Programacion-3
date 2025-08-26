defmodule Factorial do
  @doc """
  Calcula el factorial de un número de forma recursiva.
  """
  def calcular(0), do: 1
  def calcular(n) when n > 0, do: n * calcular(n - 1)
end

IO.puts Factorial.calcular(5)
