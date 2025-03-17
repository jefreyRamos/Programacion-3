defmodule ClasificacionEdad do
  def categoria(edad) do
    cond do
      edad < 12 -> "Niño"
      edad < 18 -> "Adolescente"
      edad < 60 -> "Adulto"
      true -> "Adulto mayor"
    end
  end
end

IO.puts ClasificacionEdad.categoria(25)
