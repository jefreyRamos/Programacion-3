defmodule InvertirCadena do
  @doc """
  Invierte una cadena de texto utilizando recursividad convirtiendo la cadena en una lista de caracteres.
  """
  def main do
    cadena = "Hola Mundo"
    lista = String.to_charlist(cadena)
    IO.puts("Cadena original: #{cadena}")
    cadena_invertida = invertir(lista)  # Llama a la función recursiva
    IO.puts("Cadena invertida: #{List.to_string(cadena_invertida)}")  # Convierte la lista invertida a cadena
  end

  # Caso base: si la lista está vacía, retorna una lista vacía
  def invertir([]), do: []

  # Caso recursivo: divide la lista en cabeza y resto
  def invertir([cabeza | resto]) do
    invertir(resto) ++ [cabeza]  # Llama recursivamente y concatena la cabeza al final
  end
end

InvertirCadena.main()
