defmodule Consultas do
  @csv "reservas.csv"

  def buscar_reservas_por_nombre(nombre) do
    nombre = String.downcase(nombre)

    File.stream!(@csv)
    |> Stream.map(&String.trim/1)
    |> Stream.filter(fn linea ->
      String.downcase(linea) |> String.contains?(nombre <> "-")
    end)
    |> Enum.map(&parsear_reserva/1)
    |> imprimir_reservas()
  end

  defp parsear_reserva(linea) do
    [codigo, fecha_reserva, fecha_entrada, total, tipo, cliente_raw, habitaciones_raw] =
      String.split(linea, ",")

    [nombre, edad, altura] = String.split(cliente_raw, "-")
    cliente = %Cliente{nombre: nombre, edad: String.to_integer(edad), altura: String.to_float(altura)}

    habitaciones =
      String.split(habitaciones_raw, "|")
      |> Enum.map(fn h ->
        [num, tipo] = String.split(h, "-")
        %Habitacion{numero: num, tipo: tipo}
      end)

    %Reserva{
      codigo: codigo,
      fecha_reserva: fecha_reserva,
      fecha_entrada: fecha_entrada,
      total: String.to_float(total),
      tipo: String.to_atom(tipo),
      cliente: cliente,
      habitaciones: habitaciones
    }
  end

  defp imprimir_reservas([]) do
    IO.puts("No se encontraron reservas para ese cliente.")
  end

  defp imprimir_reservas(reservas) do
    IO.puts("\nReservas encontradas:\n")

    Enum.each(reservas, fn r ->
      IO.puts("Código: #{r.codigo}")
      IO.puts("Fecha reserva: #{r.fecha_reserva}")
      IO.puts("Fecha entrada: #{r.fecha_entrada}")
      IO.puts("Total: $#{r.total}")
      IO.puts("Tipo habitación: #{r.tipo}")
      IO.puts("Cliente: #{r.cliente.nombre}, #{r.cliente.edad} años, #{r.cliente.altura} m")
      IO.puts("Habitaciones:")
      Enum.each(r.habitaciones, fn h ->
        IO.puts("  - #{h.numero} (#{h.tipo})")
      end)
      IO.puts(String.duplicate("-", 30))
    end)
  end
end
