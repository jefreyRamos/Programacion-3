defmodule CalcularSalario do
  def main do
    nombre =
      "Ingrese el nombre del empleado: "
      |>Util.ingresar(:texto)

    salarioBase =
      "Ingrese el salario base del empleado: "
      |>Util.ingresar(:real)

    horasExtras =
      "Ingrese el numero de horas extras: "
      |>Util.ingresar(:entero)

    salarioTotal = calcular_salarioTotal(salarioBase, horasExtras)

    generar_mensaje(nombre, salarioTotal)
    |> Util.mostrar_mensaje()
  end

  defp calcular_salarioTotal(salarioBase, horasExtras) do
    valorHora = salarioBase / 160
    valorHoraExtra = valorHora * 1.5
    pagoExtras = valorHoraExtra * horasExtras
    salarioBase + pagoExtras
  end

  defp generar_mensaje(nombre, salarioTotal) do
    "El salario total de #{nombre} es de $#{salarioTotal}"
  end
end

CalcularSalario.main()
