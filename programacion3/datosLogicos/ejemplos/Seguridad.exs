defmodule Seguridad do
  def verificar_contraseña(contraseña) do
    unless String.length(contraseña) >= 8 do
      "Contraseña demasiado corta. Debe tener al menos 8 caracteres."
    else
      "Contraseña aceptable."
    end
  end
end

# Uso:
IO.puts Seguridad.verificar_contraseña("abc123")  # "Contraseña demasiado corta."
IO.puts Seguridad.verificar_contraseña("segura123")  # "Contraseña aceptable."
