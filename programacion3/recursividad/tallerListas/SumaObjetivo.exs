defmodule SumaObjetivo do
  def suma_objetivo([], 0), do: true
  def suma_objetivo([], _), do: false
  def suma_objetivo([h | t], objetivo) do
    suma_objetivo(t, objetivo - h) or suma_objetivo(t, objetivo)
  end
end
IO.inspect(SumaObjetivo.suma_objetivo([2, 3, 5], 9)) # true
