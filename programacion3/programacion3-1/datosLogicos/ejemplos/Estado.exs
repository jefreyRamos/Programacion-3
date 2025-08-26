defmodule Estado do
  def evaluar(temperatura) do
    mensaje = if temperatura > 30 do
      "Día caluroso"
    else
      "Temperatura moderada"
    end
    "El estado del día: #{mensaje}"
  end
end

# Uso:
IO.puts Estado.evaluar(32)
