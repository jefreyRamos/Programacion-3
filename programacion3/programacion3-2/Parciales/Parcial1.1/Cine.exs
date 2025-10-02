defmodule Cine do
  def salas_cine do
    %{"Sala 1" => 100, "Sala 2" => 80, "Sala 3" => 50}
  end
  def reservar_sillas(salas, numero_sala, cantidad) do
    cond do
      Map.has_key?(salas, numero_sala) == false ->
        {:error, "La sala #{numero_sala} no existe."}
      cantidad > salas[numero_sala] ->
        {:error, "No hay suficientes sillas disponibles en la sala #{numero_sala}."}
      true ->
        nuevas_sillas = salas[numero_sala] - cantidad
        nuevas_salas = Map.put(salas, numero_sala, nuevas_sillas)
        {:ok, nuevas_salas}
    end
  end

end
