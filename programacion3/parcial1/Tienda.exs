defmodule Tienda do
  def calcular_descuentos(productos, porcentaje) do
    if productos == [] do
      {[], 0}
    else
      lista_descuentos = for {nombre, precio} <- productos do
        {nombre, precio - (precio * porcentaje / 100)}
      end
      total_descuento = Enum.reduce(productos, 0, fn {_nombre, precio}, acc ->
        acc + (precio * porcentaje / 100)
      end)
      {lista_descuentos, total_descuento}
    end
  end
end
productos = [{"Laptop", 1000}, {"Mouse", 50}, {"Teclado", 80}]
resultado = Tienda.calcular_descuentos(productos, 10)
IO.inspect(resultado)
