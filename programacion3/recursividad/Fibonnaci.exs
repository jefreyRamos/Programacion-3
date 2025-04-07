defmodule Fibonacci do
  def calcular(0), do: 0
  def calcular(1), do: 1

  def calcular(n) do
    calcular(n - 1) + calcular(n - 2)
  end
end

IO.puts Fibonacci.calcular(6)
