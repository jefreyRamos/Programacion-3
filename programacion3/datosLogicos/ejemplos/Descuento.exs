defmodule Descuento do
  def obtener_descuento(antiguedad) when antiguedad < 1, do: 0
  def obtener_descuento(antiguedad) when antiguedad in 1..2, do: 10
  def obtener_descuento(antiguedad) when antiguedad in 3..6, do: 14
  def obtener_descuento(_antiguedad), do: 17
end

IO.puts "Cliente con 0 años de antigüedad: #{Descuento.obtener_descuento(0)}%"
IO.puts "Cliente con 2 años de antigüedad: #{Descuento.obtener_descuento(2)}%"
IO.puts "Cliente con 4 años de antigüedad: #{Descuento.obtener_descuento(4)}%"
IO.puts "Cliente con 7 años de antigüedad: #{Descuento.obtener_descuento(7)}%"
