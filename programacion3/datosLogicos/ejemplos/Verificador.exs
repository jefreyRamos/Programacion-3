defmodule Verificador do
  def mayor_de_edad?(edad) do
    edad >= 18
  end
end

IO.puts Verificador.mayor_de_edad?(20)  # true
IO.puts Verificador.mayor_de_edad?(16)  # false
