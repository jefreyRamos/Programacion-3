defmodule Descuento do
  @anio_fundacion 1991

  def aplica_descuento?(cedula) when rem(cedula, @anio_fundacion) == 0, do: true
  def aplica_descuento?(_), do: false
end

IO.puts "Cliente con cédula 3982: #{Descuento.aplica_descuento?(3982)}"
IO.puts "Cliente con cédula 5000: #{Descuento.aplica_descuento?(5000)}"
