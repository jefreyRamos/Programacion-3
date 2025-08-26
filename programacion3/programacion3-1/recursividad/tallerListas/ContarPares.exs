defmodule ContarPares do
  def contar_pares([]), do: 0
  def contar_pares([h | t]) do
    if rem(h, 2) == 0 do
      1 + contar_pares(t)
    else
      contar_pares(t)
    end
  end
end

IO.inspect(ContarPares.contar_pares([1, 2, 3, 4, 5, 6, 8]))
