defmodule Concurrencia do
  # Suma recursiva de elementos debajo de la diagonal
  def sum_below(matrix), do: sum_below(matrix, 1, 0, 0)
  defp sum_below(_m, i, _j, acc) when i >= length(_m), do: acc
  defp sum_below(m, i, j, acc) when j < i do
    sum_below(m, i, j+1, acc + Enum.at(Enum.at(m, i), j))
  end
  defp sum_below(m, i, _j, acc), do: sum_below(m, i+1, 0, acc)

  # Promedio de elementos arriba de la diagonal
  def avg_above(matrix) do
    n = length(matrix)
    total = avg_above(matrix, 0, 1, 0)
    count = div(n*(n-1), 2)
    total / count
  end
  defp avg_above(_m, i, j, acc) when i >= length(_m) - 1, do: acc
  defp avg_above(m, i, j, acc) when j < length(m) do
    avg_above(m, i, j+1, acc + Enum.at(Enum.at(m, i), j))
  end
  defp avg_above(m, i, _j, acc), do: avg_above(m, i+1, i+2, acc)

  # Punto de entrada
  def main(matrix) do
    # Inicia tareas
    t1 = Task.async(fn -> sum_below(matrix) end)
    t2 = Task.async(fn -> avg_above(matrix) end)

    # Espera resultados
    a = Task.await(t1)
    b = Task.await(t2)

    # Operaciones S3 y S4
    c = a * b
    IO.puts("El resultado c = a * b es: #{c}")
  end
end
m = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9]
]
Concurrencia.main(m)
