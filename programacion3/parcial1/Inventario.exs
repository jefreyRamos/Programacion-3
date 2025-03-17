defmodule Inventario do
  def actualizar_inventario(inventario, producto, cantidad) do
    if Map.has_key?(inventario, producto) do
      stock = Map.get(inventario, producto)
      if stock >= cantidad do
        Map.put(inventario, producto, stock - cantidad)
      else
        IO.puts("Stock insuficiente")
        inventario
      end
    else
      IO.puts("Producto no encontrado")
      inventario
    end
  end
end
inventario = %{"Laptop" => 10, "Mouse" => 5, "Teclado" => 3}
nuevo_inventario = Inventario.actualizar_inventario(inventario, "Laptop", 2)
IO.inspect(nuevo_inventario)
