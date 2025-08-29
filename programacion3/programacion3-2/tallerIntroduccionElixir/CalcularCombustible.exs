defmodule ConsumoCombustible do
  def main do
    nombre =
      "Ingrese el nombre del conductor: "
      |> Util.ingresar(:texto)

    distancia =
      "Ingrese la distancia recorrida en kilómetros: "
      |> Util.ingresar(:real)

    litros =
      "Ingrese la cantidad de combustible consumido en litros: "
      |> Util.ingresar(:real)

    rendimiento = calcular_rendimiento(distancia, litros)

    generar_mensaje(nombre, rendimiento)
    |> Util.mostrar_mensaje()
  end

  defp calcular_rendimiento(distancia, litros) do
    distancia / litros
  end

  defp generar_mensaje(nombre, rendimiento) do
    rendimiento_redondeado = Float.round(rendimiento, 2)
    "#{nombre}, el rendimiento de su vehículo es #{rendimiento_redondeado} km/L"
  end
end

ConsumoCombustible.main()
