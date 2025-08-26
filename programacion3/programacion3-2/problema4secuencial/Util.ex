defmodule Util do
  # Función que muestra mensajes en la terminal
  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  # Ingresar texto
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  # Ingresar enteros con validación
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

  # Ingresar reales (floats) con validación
  def ingresar(mensaje, :real) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_float()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número real\n"
        |> mostrar_error()

        mensaje
        |> ingresar(:real)
    end
  end

  # Mostrar errores en la salida estándar de error
  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end
