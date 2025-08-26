defmodule EntradaReales do
  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> Util.ingresar(:real)

    porcentaje_descuento =
      "Ingrese el porcentaje de descuento (0.0 a 1.0): "
      |> Util.ingresar(:real)

    valor_descuento = calcular_valor_descuento(valor_producto, porcentaje_descuento)
    valor_final = calcular_valor_final(valor_producto, valor_descuento)

    generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje()
  end

  defp calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  defp calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  defp generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = Float.round(valor_descuento, 1)
    valor_final = Float.round(valor_final, 1)

    "Valor de descuento de $#{valor_descuento} y el valor final de $#{valor_final}"
  end
end

EntradaReales.main()
