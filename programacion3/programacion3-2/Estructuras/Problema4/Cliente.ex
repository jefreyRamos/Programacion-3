defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0

  def crear(nombre, edad, altura) do
    %Cliente{nombre: nombre, edad: edad, altura: altura}
  end

  def generar_mensaje_clientes(lista_clientes, parser) do
    lista_clientes
    |> Enum.map(parser)
    |> Enum.join("\n")
  end

  def leer_csv(nombre) do
    nombre
    |> File.stream!()
    |> Stream.drop(1) # ignora encabezados
    |> Enum.map(&convertir_cadena_cliente/1)
  end

  def convertir_cadena_cliente(cadena) do
    [nombre, edad, altura] =
      cadena
      |> String.split(",")
      |> Enum.map(&String.trim/1)

    edad = String.to_integer(edad)
    altura = String.to_float(altura)

    Cliente.crear(nombre, edad, altura)
  end
end

