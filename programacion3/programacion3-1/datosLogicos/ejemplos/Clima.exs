defmodule Clima do
  def descripcion(temperatura) do
    cond do
      temperatura < -10 -> "Extremadamente frío"
      temperatura >= -10 and temperatura < 0 -> "Muy frío"
      temperatura >= 0 and temperatura < 15 -> "Frío"
      temperatura >= 15 and temperatura < 25 -> "Templado"
      temperatura >= 25 and temperatura < 35 -> "Caluroso"
      temperatura >= 35 -> "Extremadamente caluroso"
    end
  end
end

# Uso:
IO.puts Clima.descripcion(28)
