defmodule Util do
  # Funcion que se encarga de mostrar mensaje en el terminal
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  # Función para ingresar texto
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  # Función para ingresar enteros con validación
  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número entero\n"
        |> mostrar_error()

        mensaje
        |> ingresar(:entero)
    end
  end

  # Mostrar mensajes de error
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
