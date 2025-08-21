defmodule Util do
  def mostrarMensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end
end
