defmodule Tienda do
  def inventario do
    %{"manzanas" => 50, "naranjas" => 30, "platanos" => 20}
  end
  def actualizar_inventario(inventario, producto, cantidad) do
    cond do
      Map.has_key?(inventario, producto) == false ->
        {:error, "el producto #{producto} no existe"}
      cantidad < 0 && abs(cantidad) > inventario[producto] ->
        {:error, "no hay suficientes #{producto} en inventario"}
      true ->
        nueva_cantidad = inventario[producto] + cantidad
        nuevo_inventario = Map.put(inventario, producto, nueva_cantidad)
        {:ok, nuevo_inventario}
    end
  end
end
