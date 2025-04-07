defmodule Maximo do
  def encontrar_max([]), do: nil
  def encontrar_max([unico]), do: unico

  def encontrar_max(lista) do
    mitad = div(length(lista), 2)
    {izquierda, derecha} = Enum.split(lista, mitad)
    max_izq = encontrar_max(izquierda)
    max_der = encontrar_max(derecha)
    max(max_izq, max_der)
  end
end

IO.puts Maximo.encontrar_max([3, 8, 2, 10, 5])
