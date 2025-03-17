defmodule Util do
  def mostrarMensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end

  def ingresar(mensaje, :texto) do  ## :texto es un atomo que se utiliza como mensaje de retorno
    ## Llama la clase java para realizar la funcion
    case System.cmd("java", ["-cp", ".", "Mensaje", "input", mensaje]) do
      {output, 0} -> ## pattern matching / switch case
        IO.puts("Texto ingresado correctamente.")
        IO.puts("Entrada: #{output}")
        String.trim(output) # Retorna la entrada sin espacios extra
      {error, code} ->
        IO.puts("Error al ingresar el texto. Código: #{code}")
        IO.puts("Detalles: #{error}")
        ni
      end
  end

  def mostrarError(mensaje) do
    IO.puts(:standard_error, mensaje)
  end

  defp ingresar(mensaje, parser, tipoDato) do
    try do
      mensaje
      |>ingresar(:texto)
      |>parser.()
    rescue
      ArgumentError ->
        "Error, se espera que ingrese un número #{tipoDato} \n"
        |> mostrarError()

        mensaje
        |> ingresar(parser, tipoDato)

      end
  end

    def ingresar(mensaje, :entero), do: ingresar(mensaje, &String.to_integer/1, :entero)
    def ingresar(mensaje, :real), do: ingresar(mensaje, &String.to_float/1, :real)
end
