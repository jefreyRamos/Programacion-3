# --- ESTRUCTURAS ---
defmodule Cliente do
  defstruct nombre: "", edad: 0, altura: 0.0
end

defmodule Habitacion do
  defstruct numero: "", tipo: ""
end

defmodule Reserva do
  defstruct codigo: "", fecha_reserva: "", fecha_entrada: "",
            total: 0.0, tipo: :sencilla,
            cliente: %Cliente{}, habitaciones: []
end

# --- MÓDULO HOTEL (guardar en CSV) ---
defmodule Hotel do
  @csv "reservas.csv"

  def guardar_reserva(reserva) do
    cliente = "#{reserva.cliente.nombre}-#{reserva.cliente.edad}-#{reserva.cliente.altura}"

    habitaciones = Enum.map(reserva.habitaciones, fn h ->
      "#{h.numero}-#{h.tipo}"
    end)
    |> Enum.join("|")

    fila = [
      reserva.codigo,
      reserva.fecha_reserva,
      reserva.fecha_entrada,
      Float.to_string(reserva.total),
      Atom.to_string(reserva.tipo),
      cliente,
      habitaciones
    ]
    |> Enum.join(",")

    File.write!(@csv, fila <> "\n", [:append])
    IO.puts("Reserva guardada en #{@csv}")
  end
end
 
# --- MÓDULO CONSULTAS (leer y filtrar) ---
defmodule Consultas do
  @csv "reservas.csv"

  def cargar_reservas do
    File.stream!(@csv)
    |> Stream.map(&String.trim/1)
    |> Enum.map(&parsear_reserva/1)
  end

  def buscar_reservas_por_nombre(nombre) do
    nombre = String.downcase(nombre)

    cargar_reservas()
    |> Enum.filter(fn r -> String.downcase(r.cliente.nombre) == nombre end)
    |> imprimir_reservas()
  end

  defp parsear_reserva(linea) do
    [codigo, fecha_reserva, fecha_entrada, total, tipo, cliente_raw, habitaciones_raw] =
      String.split(linea, ",")

    [nombre, edad, altura] = String.split(cliente_raw, "-")
    cliente = %Cliente{
      nombre: nombre,
      edad: String.to_integer(edad),
      altura: String.to_float(altura)
    }

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

# --- MÓDULO FILTRO CON DIVIDE Y VENCERÁS ---
defmodule FiltroReservas do
  def contar_mayores(reservas, valor), do: dividir_y_contar(reservas, valor)

  defp dividir_y_contar([], _), do: 0

  defp dividir_y_contar([%Reserva{total: total}], valor) do
    if total > valor, do: 1, else: 0
  end

  defp dividir_y_contar(lista, valor) do
    mitad = div(length(lista), 2)
    {izq, der} = Enum.split(lista, mitad)
    dividir_y_contar(izq, valor) + dividir_y_contar(der, valor)
  end
end

# --- BLOQUE PRINCIPAL DE EJECUCIÓN ---
defmodule Main do
  def run do
    IO.puts("\n1. Crear nueva reserva")
    IO.puts("2. Buscar reservas por cliente")
    IO.puts("3. Contar reservas con total mayor a un valor")
    opcion = IO.gets("Seleccione una opción: ") |> String.trim()

    case opcion do
      "1" -> crear_reserva()
      "2" ->
        nombre = IO.gets("Ingrese el nombre del cliente: ") |> String.trim()
        Consultas.buscar_reservas_por_nombre(nombre)
      "3" ->
        valor = IO.gets("Ingrese valor mínimo de total a pagar: ")
                |> String.trim() |> String.to_float()
        reservas = Consultas.cargar_reservas()
        resultado = FiltroReservas.contar_mayores(reservas, valor)
        IO.puts("Reservas con total mayor a #{valor}: #{resultado}")
      _ ->
        IO.puts("Opción no válida")
    end
  end

  defp crear_reserva do
    codigo = pedir("Código de reserva: ")
    fecha_reserva = pedir("Fecha de la reserva: ")
    fecha_entrada = pedir("Fecha de entrada: ")
    total = pedir("Total a pagar: ") |> String.to_float()
    tipo = pedir("Tipo de habitación (sencilla o doble): ") |> String.to_atom()
    nombre = pedir("Nombre del cliente: ")
    edad = pedir("Edad del cliente: ") |> String.to_integer()
    altura = pedir("Altura del cliente: ") |> String.to_float()

    cliente = %Cliente{nombre: nombre, edad: edad, altura: altura}

    habitaciones = pedir("Ingrese habitaciones (ej: 101-sencilla|102-doble): ")
      |> String.split("|")
      |> Enum.map(fn hab ->
        [num, tipo] = String.split(hab, "-")
        %Habitacion{numero: num, tipo: tipo}
      end)

    reserva = %Reserva{
      codigo: codigo,
      fecha_reserva: fecha_reserva,
      fecha_entrada: fecha_entrada,
      total: total,
      tipo: tipo,
      cliente: cliente,
      habitaciones: habitaciones
    }

    Hotel.guardar_reserva(reserva)
  end

  defp pedir(texto), do: IO.gets(texto) |> String.trim()
end

Main.run()
