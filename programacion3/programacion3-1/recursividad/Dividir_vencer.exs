defmodule Dividir_vencer do
  @doc """
  Este modulo permite realizar las principales operaciones en funcion a dividir y vencer
  """
  def dividir_vencer (lista) do
    dividir_vencer(lista, 0, length(lista)-1)
    end
    def dividir_vencer(lista, inicio, fin) do
    if(inicio == fin) do
      Enum.at(lista, inicio)
    else
      mitad div (inicio + fin, 2)
      izquierda dividir_vencer (inicio, mitad)
      derecha dividir_vencer (mitad + 1, fin)
      izquierda + derecha
    end
end
