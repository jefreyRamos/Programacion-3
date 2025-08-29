defmodule ConvercionTemperatura do
  def main do
    nombre =
      "Ingrese su nombre: "
      |> Util.ingresar(:texto)

    temperatura =
      "Ingrese la temperatura en celcius: "
      |> Util.ingresar(:real)

    conversionFahrenheit = calcular_fahrenheit(temperatura)
    conversionKelvin = calcular_kelvin(temperatura)

    generar_mensaje(nombre, conversionFahrenheit, conversionKelvin)
    |> Util.mostrar_mensaje()
  end

  defp calcular_fahrenheit(temperatura) do
    (temperatura * 9/5) + 32
  end

  defp calcular_kelvin(temperatura) do
    temperatura + 273.15
  end

  defp generar_mensaje(nombre, conversionFahrenheit, conversionKelvin) do
    conversionFahrenheit_redondeado = Float.round(conversionFahrenheit, 1)
    conversionKelvin_redondeado = Float.round(conversionKelvin, 1)
    "#{nombre}, la temperatura es:
    -#{conversionFahrenheit_redondeado}°F
    -#{conversionKelvin_redondeado}K"
  end
end

ConvercionTemperatura.main()
