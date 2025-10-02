defmodule Matrioshka do
  def abrir_y_cerrar(n), do: abrir(n, 1)

  defp abrir(max, actual) when actual > max do
    :ok
  end

  # Paso recursivo
  defp abrir(max, actual) do
    IO.puts("Abriendo Matrioshka #{actual}")
    abrir(max, actual + 1)
    IO.puts("Cerrando Matrioshka #{actual}")
  end
end
