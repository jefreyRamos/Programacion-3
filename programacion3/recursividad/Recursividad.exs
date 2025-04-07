defmodule Recursividad do
  @doc """
  Este modulo permite realizar las principales operaciones en funcion a recursividad
  """
  def sumar(n) do
    if n == 1 do
      1
    else
      n + sumar(n - 1)
    end
  end
end
IO.puts(Recursividad.sumar(5))
