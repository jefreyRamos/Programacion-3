defmodule EntradaEnteros do
  def main do
    valor_total = "Ingrese valor total de la factura: "
    |> ingresar(:entero)

    valor_entregado = "Ingrese valor entregado para el pago: "
    |> ingresar(:entero)

    calcular_devuelta(valor_entregado, valor_total)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp ingresar(mensaje, :entero) do
    mensaje
    |> Util.ingresar(:texto)
    |> String.to_integer()
  end

  defp calcular_devuelta(valor_pago, valor_total) do
    valor_pago - valor_total
  end

  defp generar_mensaje(devuelta) do
    "El valor de devuelta es $ #{devuelta}"
  end
end
EntradaEnteros.main()
