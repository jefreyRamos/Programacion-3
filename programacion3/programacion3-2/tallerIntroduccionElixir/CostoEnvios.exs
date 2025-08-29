defmodule CostoEnvios do
  def main do
    nombre =
      "Ingrese el nombre del cliente: "
      |> Util.ingresar(:texto)

    peso =
      "Ingrese el peso del paquete en kg: "
      |> Util.ingresar(:real)

    tipo =
      "Ingrese el tipo de envio (Economico, Expres o Internacional)"
      |> Util.ingresar(:texto)
      |> validar_tipo()

    tarifa = calcular_tarifa(peso, tipo)

    generar_mensaje(nombre, peso, tipo, tarifa)
    |> Util.mostrar_mensaje()
  end

  defp validar_tipo(tipo) do
    tipo_permitido = String.downcase(String.trim(tipo))

    case tipo_permitido do
      "economico" -> "economico"
      "expres" -> "expres"
      "internacional" -> "internacional"
      _ ->
        IO.puts(:standard_error, "Error: solo se permite Economico, expres o Internancional\n")

        "Ingrese el tipo de envio (Economico, Expres o Internacional)"
        |> Util.ingresar(:texto)
        |> validar_tipo()
    end
  end

  defp calcular_tarifa(_peso, "economico"), do: 5000
  defp calcular_tarifa(_peso, "expres"), do: 8000
  defp calcular_tarifa(peso, "internacional") do
    if peso <= 5 do
      12000
    else
      15000
    end
  end

  defp generar_mensaje(nombre, peso, tipo, tarifa) do
    "#{nombre}, el peso de tu envio es #{peso}, este es #{tipo} y tu tarifa a pagar es: $#{tarifa}"
  end
end

CostoEnvios.main()
