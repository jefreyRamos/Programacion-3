defmodule Reserva do

  defstruct :codigo, :fecha_reserva, :fecha_ingreso, :total, :tipo_habitacion, :cliente, :habitaciones


  @type t :: %__MODULE__{
          codigo: "",
          fecha_reserva: Date.t(),
          fecha_ingreso: Date.t(),
          total: 0.0,
          tipo_habitacion: Habitacion.tipo_habitacion(),
          cliente: Cliente.t(),
          habitaciones: [Habitacion.t()]
        }

def crear(codigo, fecha_reserva, fecha_ingreso, total ) do
  %Reserva{
    codigo: codigo,
    fecha_reserva: fecha_reserva,
    fecha_ingreso: fecha_ingreso,
    total: total, tipo_habitacion: tipo_habitacion, cliente: cliente, habitaciones: habitaciones
  }
end

def ingresar(mensaje) do

  mensaje
  |> Util.mostrarMensaje()

  codigo= "Ingrese el codigo de la reserva: "
  |> Util.ingresar(:texto)

  fecha_reserva= "Ingrese la fecha de reserva (YYYY-MM-DD): "
  |> Util.ingresar(:texto)
  |> String.to_date()

  fecha_ingreso= "Ingrese la fecha de ingreso (YYYY-MM-DD): "
  |> Util.ingresar(:texto)
  |> String.to_date()

  total= "Ingrese el total de la reserva: "
  |> Util.ingresar(:decimal)

  tipo_habitacion= "Ingrese el tipo de habitacion (sencilla o doble): "
  |> Util.ingresar(:texto)
  |> String.downcase()
  |> String.to_atom()

  cliente= Cliente.ingresar("Ingrese los datos del cliente: ")

  cantidad= "Ingrese la cantidad de habitaciones: "
  |> Util.ingresar(:entero)

  habitaciones=
    1..cantidad
    |> Enum.map(fn i ->
      Habitacion.ingresar("Habitacion ##{i}")
    end)

  crear(codigo, fecha_reserva, fecha_ingreso, total, tipo_habitacion, cliente, habitaciones)
  end



end
