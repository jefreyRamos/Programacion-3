defmodule Proyecto do
  def evaluar_proyecto(calificaciones, estudiante) do
    if Map.has_key?(calificaciones, estudiante) do
      notas = Map.get(calificaciones, estudiante)
      suma = Enum.reduce(notas, 0, fn x, acc -> x + acc end)
      promedio = suma / length(notas)
      if promedio >= 6 do
        {promedio, "Aprobado"}
      else
        {promedio, "Reprobado"}
      end
    else
      {0, "No encontrado"}
    end
  end
end
calificaciones = %{
  "Juan" => [7, 8, 6],
  "Ana" => [5, 4, 6],
  "Pedro" => [9, 8, 9]
}
evaluacion = Proyecto.evaluar_proyecto(calificaciones, "Juan")
IO.inspect(evaluacion)
