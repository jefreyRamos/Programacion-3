defmodule InventarioLibrerias do
  def main do
    titulo =
      "Ingrese el titulo del libro: "
      |> Util.ingresar(:texto)

    unidadesDisponibles =
      "Ingrese la cantidad de unidades disponibles: "
      |> Util.ingresar(:entero)

    valor =
      "Ingrese el precio unitario: "
      |>Util.ingresar(:real)

    valorTotal = calcular_valorTotal(unidadesDisponibles,valor)

    generar_mensaje(titulo, unidadesDisponibles, valorTotal)
    |> Util.mostrar_mensaje()
  end

  defp calcular_valorTotal(unidadesDisponibles,valor) do
    unidadesDisponibles * valor
  end

  defp generar_mensaje(titulo, unidadesDisponibles, valorTotal) do
    "El libro #{titulo} tiene #{unidadesDisponibles} unidades, con un valor total de $#{valorTotal}"
  end
end

InventarioLibrerias.main()
