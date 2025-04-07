defmodule Factorial do
  def calcular(0), do: 1

  def calcular(n) do
    n * calcular(n - 1)
  end
end

IO.puts Factorial.calcular(3)
