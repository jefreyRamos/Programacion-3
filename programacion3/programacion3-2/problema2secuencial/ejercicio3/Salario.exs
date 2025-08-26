[nombre, horas_str, valor_str] = System.argv()

horas = String.to_integer(horas_str)
valor_hora = String.to_integer(valor_str)

extras = max(horas - 160, 0)
horas_normales = horas - extras

salario_base = horas_normales * valor_hora
salario_extras = extras * round(valor_hora * 1.25)
salario_neto = salario_base + salario_extras

"Empleado #{nombre} tiene un salario neto de $#{salario_neto}"
|> IO.puts()
