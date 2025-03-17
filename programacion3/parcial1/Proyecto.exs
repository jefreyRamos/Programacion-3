defmodule Proyecto do
  def evaluar_proyecto(calificaciones, estudiante) do
    case Map.get(calificaciones, estudiante) do
      nil -> {0, "No encontrado"}
      notas ->
        promedio = Enum.sum(notas) / length(notas)
        estado = if promedio >= 6, do: "Aprobado", else: "Reprobado"
        {promedio, estado}
    end
  end
end
