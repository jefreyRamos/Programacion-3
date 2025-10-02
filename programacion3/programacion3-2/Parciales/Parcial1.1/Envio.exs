defmodule Envio do
  def calcular_envio(peso, tipo_cliente, servicio) do
    base = tarifa_base(peso)
    descuento = aplicar_descuento(base, tipo_cliente)
    subtotal = base - descuento
    recargo = aplicar_recargo(subtotal, servicio)
    total = subtotal - recargo

    IO.puts "la tarifa base es $#{base}"
    IO.puts "el descuento para #{tipo_cliente} es de #{descuento}"
    IO.puts "el subtotal es $#{subtotal}"
    IO.puts "el recargo es de $#{recargo} para #{servicio}"
    IO.puts "el total a pagar es de $#{total}"
    %{base: base, descuento: descuento, subtotal: subtotal, recargo: recargo, total: total}
  end

  def calcular_envio(_,_,_), do: IO.puts("error el peso debe de ser mayor a 0")

  defp tarifa_base(peso) do
    cond do
      peso <= 1 -> 8000
      peso <= 5 -> 12000
      peso > 5 -> 20000
    end
  end

  defp aplicar_descuento(base, "corporativo"), do: trunc(base * 0.15)
  defp aplicar_descuento(base, "estudiante"), do: trunc(base * 0.10)
  defp aplicar_descuento(base, "regular"), do: 0

  defp aplicar_recargo(subtotal, "express"), do: trunc(subtotal * 0.15)
  defp aplicar_recargo(subtotal, "estandar"), do: 0

end
