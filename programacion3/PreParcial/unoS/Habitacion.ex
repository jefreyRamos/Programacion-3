defmodule Habitacion do

  defstruct :tipo, :numero

  @type tipo_habitacion :: :sencilla | :doble
  @type t :: %__MODULE__{
          tipo: tipo_habitacion,
          numero: 0
        }

  def crear(tipo, numero) when tipo in [:sencilla, :doble] and is_integer(numero) do

    %Habitacion{
      tipo: tipo,
      numero: numero
    }
  end

  def crear(_,_) ,do: raise ArgumentError, "Tipo de habitacion no valido o numero de habitacion no valido"

  def ingresar(mensaje) do
    mensaje
    |> Util.mostrarMensaje()

    tipo = "Ingrese el tipo de habitacion (sencilla o doble): "
    |> Util.ingresar(:texto)
    |> String.downcase()
    |> String.to_atom()

    numero = "Ingrese el numero de habitacion: "
    |> Util.ingresar(:entero)

    crear(tipo, numero)
  end

end
