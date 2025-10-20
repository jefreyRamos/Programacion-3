defmodule NReinas do
  def main do
    n =
      "Ingrese el número de reinas: "
      |> Util.ingresar(:entero)

    IO.puts("\n=== PROBLEMA DE LAS #{n} REINAS ===")
    resolver(n)
  end

  def resolver(n) do
    colocar_reinas(n, 0, [])
  end

  defp colocar_reinas(n, fila, tablero) when fila == n do
    IO.puts("\nSolución encontrada:")
    mostrar_tablero(Enum.reverse(tablero), n)
  end

  defp colocar_reinas(n, fila, tablero) do
    for col <- 0..(n - 1),
        es_valido?(fila, col, tablero),
        do: colocar_reinas(n, fila + 1, [{fila, col} | tablero])
  end

  defp es_valido?(fila, col, tablero) do
    Enum.all?(tablero, fn {f, c} ->
      c != col and abs(c - col) != abs(f - fila)
    end)
  end

  defp mostrar_tablero(tablero, n) do
    for fila <- 0..(n - 1) do
      for col <- 0..(n - 1) do
        if Enum.member?(tablero, {fila, col}), do: IO.write(" Q "), else: IO.write(" x ")
      end
      IO.puts("")
    end
  end
end

NReinas.main()
