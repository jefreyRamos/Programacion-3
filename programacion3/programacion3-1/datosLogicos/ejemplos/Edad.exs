defmodule Edad do
  def categoria(edad) when edad < 12, do: "Niño"
  def categoria(edad) when edad < 18, do: "Adolescente"
  def categoria(edad) when edad < 60, do: "Adulto"
  def categoria(_), do: "Adulto mayor"  # Cláusula de respaldo
end

IO.puts Edad.categoria(8)   # "Niño"
IO.puts Edad.categoria(16)  # "Adolescente"
IO.puts Edad.categoria(40)  # "Adulto"
IO.puts Edad.categoria(70)  # "Adulto mayor"
