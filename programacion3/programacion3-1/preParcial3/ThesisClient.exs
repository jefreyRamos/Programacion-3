defmodule ThesisClient do
  def main do
    # Conectar al nodo servidor (ej. :server@host)
    Node.connect(:"server@host")

    # Obtener listados
    theses = ThesisServer.list_theses()
    IO.puts("Tesis disponibles:")
    Enum.each(theses, fn t -> IO.puts("#{t.id}. #{t.titulo} (#{t.fecha})") end)

    # Leer selección
    sel = IO.gets("Seleccione título: ") |> String.trim()

    # Solicitar autores
    case ThesisServer.get_authors(sel) do
      {:ok, authors} ->
        IO.puts("Autores asociados:")
        Enum.each(authors, fn a ->
          IO.puts("#{a.nombre} #{a.apellidos} - #{a.cedula} (#{a.programa}, #{a.titulo})")
        end)
      {:error, :not_found} -> IO.puts("Tesis no encontrada.")
    end
  end
end
