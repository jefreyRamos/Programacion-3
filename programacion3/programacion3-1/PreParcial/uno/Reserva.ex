defmodule Reserva do
  defstruct codigo: "", fecha_reserva: "", fecha_entrada: "", total: 0.0, tipo: :sencilla,
            cliente: %Cliente{}, habitaciones: []
end
