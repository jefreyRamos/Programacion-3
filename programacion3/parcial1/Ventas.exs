defmodule Ventas do
  def analizar_ventas(ventas) do
    valores = Map.values(ventas)
    if valores == [] do
      {0, 0, "No hay datos"}
    else
      total = Enum.sum(valores)
      promedio = total / length(valores)
      mejor_dia = Enum.reduce(ventas, {"", 0}, fn {dia, venta}, {mejor_dia, max} ->
        if venta > max, do: {dia, venta}, else: {mejor_dia, max}
      end) |> elem(0)
      {total, promedio, mejor_dia}
    end
  end
end
ventas = %{"Lunes" => 5, "Martes" => 8, "Miércoles" => 3, "Jueves" => 10}
resultado = Ventas.analizar_ventas(ventas)
IO.inspect(resultado)
