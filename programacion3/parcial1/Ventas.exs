defmodule Ventas do
  def analizar_ventas(ventas) do
    case Map.values(ventas) do
      [] -> {0, 0, "No hay datos"}
      valores ->
        total = Enum.sum(valores)
        promedio = total / length(valores)
        mejor_dia = ventas |> Enum.max_by(fn {_k, v} -> v end) |> elem(0)
        {total, promedio, mejor_dia}
    end
  end
end
