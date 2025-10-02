defmodule Seguridad do
  def validar_contraseña(contraseña) do
    errores =
      []
      |> validar_longitud(contraseña)
      |> validar_mayuscula(contraseña)
      |> validar_espacio(contraseña)
      |> validar_numero(contraseña)
    if errores == [] do
      {:ok, "Contraseña válida"}
    else
      {:error, "errores en la contraseña: #{Enum.join(errores, ", ")}"}
    end
  end

  defp validar_longitud(errores, contraseña) do
    if String.length(contraseña) < 8 do
      ["La contraseña debe tener al menos 8 caracteres" | errores]
    else
      errores
    end
  end
  defp validar_mayuscula(errores, contraseña) do
    if contraseña == String.downcase(contraseña) do
      ["La contraseña debe contener al menos una letra mayúscula" | errores]
    else
      errores
    end
  end
  defp validar_espacio(errores, contraseña) do
    if String.contains?(contraseña, " ") do
      ["La contraseña no debe contener espacios" | errores]
    else
      errores
    end
  end

end
