defmodule CalcularPeaje do
  def main do
    placa =
      "Ingrese la placa del vehiculo: "
      |> Util.ingresar(:texto)

    vehiculo =
      "Ingrese el tipo de vehiculo: "
      |> Util.ingresar(:texto)
      |> validar_tipo()

    toneladas =
      "Ingrese el peso del vehiculo en toneladas: "
      |> Util.ingresar(:entero)

    tarifa = calcular_tarifa(vehiculo, toneladas)

    generar_mensaje(placa, vehiculo, tarifa)
    |> Util.mostrar_mensaje()
  end

  defp validar_tipo(vehiculo) do
    tipo_normalizado = String.downcase(String.trim(vehiculo))

    case tipo_normalizado do
      "carro" -> "carro"
      "moto" -> "coto"
      "camion" -> "camion"
      _ ->
        IO.puts(:standard_error, "Error: Solo se permite carro, moto o camion\n")

        "Ingrese el tipo de vehículo (Carro, Moto, Camion): "
        |> Util.ingresar(:texto)
        |> validar_tipo()
    end
  end

  defp calcular_tarifa("carro", _toneladas), do: 10000
  defp calcular_tarifa("moto", _toneladas), do: 5000
  defp calcular_tarifa("camion", toneladas), do: 20000 + (toneladas * 2000)

  defp generar_mensaje(placa, vehiculo, tarifa) do
    "El vehiculo #{placa} (#{vehiculo}) debe pagar $#{tarifa}"
  end
end

CalcularPeaje.main()
