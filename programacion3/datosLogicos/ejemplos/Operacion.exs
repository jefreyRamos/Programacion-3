defmodule Operacion do
  def resultado(respuesta) do
    case respuesta do
      {:ok, valor} -> "Operación exitosa: #{valor}"
      {:error, motivo} -> "Error en la operación: #{motivo}"
      _ -> "Respuesta inesperada"
    end
  end
end

# Uso:
IO.puts Operacion.resultado({:ok, 42})
