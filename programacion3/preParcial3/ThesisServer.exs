defmodule ThesisServer do
  
  use GenServer

  ## API pública
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end
  def list_theses, do: GenServer.call(__MODULE__, :list)
  def get_authors(title), do: GenServer.call(__MODULE__, {:authors, title})

  ## Callbacks
  def init(_) do
    # Carga manual de datos en memoria
    authors = [
      %Author{nombre: "Ana", apellidos: "Pérez", cedula: "1001", programa: "Sistemas", titulo: "Ing. Sistemas"},
      %Author{nombre: "Luis", apellidos: "Gómez", cedula: "1002", programa: "Sistemas", titulo: "Ing. Sistemas"},
      %Author{nombre: "María", apellidos: "López", cedula: "1003", programa: "Sistemas", titulo: "Ing. Sistemas"},
      %Author{nombre: "José", apellidos: "Ramírez", cedula: "1004", programa: "Sistemas", titulo: "Ing. Sistemas"},
      %Author{nombre: "Carmen", apellidos: "Suárez", cedula: "1005", programa: "Sistemas", titulo: "Ing. Sistemas"}
    ]
    theses = [
      %Thesis{id: 1, fecha: ~D[2025-02-10], titulo: "Elixir en Distribuidos", descripcion: "Uso de Elixir para...", autores: ["1001", "1002"]},
      %Thesis{id: 2, fecha: ~D[2025-03-05], titulo: "Concurrency en Elixir", descripcion: "Modelos de concurrencia...", autores: ["1003", "1004"]},
      %Thesis{id: 3, fecha: ~D[2025-04-01], titulo: "GenServer Avanzado", descripcion: "Implementaciones con GenServer...", autores: ["1002", "1005"]}
    ]
    {:ok, %{authors: authors, theses: theses}}
  end

  def handle_call(:list, _from, state) do
    {:reply, state.theses, state}
  end

  def handle_call({:authors, title}, _from, state) do
    case Enum.find(state.theses, &(&1.titulo == title)) do
      nil -> {:reply, {:error, :not_found}, state}
      %Thesis{autores: cedulas} ->
        authors = Enum.filter(state.authors, &(&1.cedula in cedulas))
        {:reply, {:ok, authors}, state}
    end
  end
end
