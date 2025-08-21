defmodule NReinas do
  @n 8  # Cambia este valor para usar otro N

  def resolver do
    soluciones = colocar_reinas(0, [], [])
    mostrar_soluciones(soluciones)
  end

  # Recursivamente construye todas las soluciones válidas
  defp colocar_reinas(fila, parcial, soluciones) when fila == @n do
    [Enum.reverse(parcial) | soluciones]
  end

  defp colocar_reinas(fila, parcial, soluciones) do
    Enum.reduce(0..(@n - 1), soluciones, fn columna, acc ->
      if posicion_valida?(fila, columna, parcial) do
        colocar_reinas(fila + 1, [{fila, columna} | parcial], acc)
      else
        acc
      end
    end)
  end

  # Verifica que no haya ataques entre reinas
  defp posicion_valida?(_fila, _columna, []), do: true

  defp posicion_valida?(fila, columna, reinas) do
    Enum.all?(reinas, fn {f2, c2} ->
      columna != c2 and abs(fila - f2) != abs(columna - c2)
    end)
  end

  # Muestra todas las soluciones encontradas
  defp mostrar_soluciones([]) do
    IO.puts("No se encontró ninguna solución.")
  end

  defp mostrar_soluciones([solucion | _]) do
    IO.puts("Primera solución encontrada:")
    imprimir_tablero(solucion)
  end

  defp imprimir_tablero(reinas) do
    reinas = Enum.into(reinas, %{})

    for fila <- 0..(@n - 1) do
      for col <- 0..(@n - 1) do
        if Map.get(reinas, fila) == col do
          IO.write(" Q ")
        else
          IO.write(" . ")
        end
      end
      IO.puts("")
    end
  end
end

# Ejecutar
NReinas.resolver()
