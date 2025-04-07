defmodule Recursividad1 do
  @doc """
  Este modulo permite realizar las principales operaciones en funcion a recursividad
  """
  def sumar(1), do: 1
  def sumar(n) do
    n + sumar(n - 1)
  end

end
IO.puts(Recursividad1.sumar(5))
