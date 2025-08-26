defmodule ListaDetalle do
  def analizar(lista) do
    case lista do
      [] -> "La lista está vacía"
      [elemento] -> "La lista tiene un solo elemento: #{elemento}"
      [primer, segundo | _resto] -> "Los dos primeros elementos son: #{primer} y #{segundo}"
    end
  end
end

# Uso:
IO.puts ListaDetalle.analizar([10, 20, 30, 40])
