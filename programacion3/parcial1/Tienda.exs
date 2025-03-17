defmodule Tienda do
  def calcular_descuentos(productos, porcentaje) do
    case productos do
      [] -> {[], 0}
      _ ->
        lista_descuentos = Enum.map(productos, fn {nombre, precio} -> {nombre, precio * (1 - porcentaje / 100)} end)
        total_descuento = Enum.sum(for {_n, p} <- productos, do: p * porcentaje / 100)
        {lista_descuentos, total_descuento}
    end
  end
end
