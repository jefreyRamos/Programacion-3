defmodule Inventario do
  def actualizar_inventario(inventario, producto, cantidad) do
    case Map.fetch(inventario, producto) do
      {:ok, stock} when stock >= cantidad -> Map.put(inventario, producto, stock - cantidad)
      {:ok, _} -> IO.puts("Stock insuficiente") && inventario
      :error -> IO.puts("Producto no encontrado") && inventario
    end
  end
end
