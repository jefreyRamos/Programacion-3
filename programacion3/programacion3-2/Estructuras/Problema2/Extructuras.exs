defmodule Estructuras do
  def main do
    "Ingrese los datos del cliente: "
    |> Cliente.ingresar(:clientes)
    |> Cliente.generar_mensaje_clientes(&generar_mensaje/1)
    |> Util.mostrarMensaje()
  end

  def generar_mensaje(cliente) do
    altura = cliente.altura |> Float.round(2)

    "Hola #{cliente.nombre}, tu edad es de #{cliente.edad} años y " <>
      "tienes una altura de #{altura} mts.\n"
  end
end

Estructuras.main()
