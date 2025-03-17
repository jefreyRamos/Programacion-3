defmodule ConsumoCombustible do
  def calcular do
    IO.puts("Ingrese su nombre: ")
    nombre = IO.read(:line) |> String.trim()

    IO.puts("Ingrese la distancia recorrida (km): ")
    distancia = IO.read(:line) |> String.trim() |> String.to_float()

    IO.puts("Ingrese la cantidad de combustible consumido (L): ")
    litros = IO.read(:line) |> String.trim() |> String.to_float()

    rendimiento = distancia / litros
    IO.puts("#{nombre}, el rendimiento de su vehículo es de #{Float.round(rendimiento, 2)} km/L")
  end
end

ConsumoCombustible.calcular()
            