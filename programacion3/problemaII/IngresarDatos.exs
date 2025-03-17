defmodule IngresarDatos do
  def main do
  "Ingrese nombre del empleado: "
  |> Util.ingresar(:texto)
  |> generar_mensaje()
  |> Util.mostrarMensaje()
  end
  defp generar_mensaje(nombre) do
  "Bienvenido #{nombre} a la empresa Once Ltda"
  end
end

IngresarDatos.main()
