defmodule SaltoCaballo do
  @n 8

  @moves [
    {2, 1}, {1, 2}, {-1, 2}, {-2, 1},
    {-2, -1}, {-1, -2}, {1, -2}, {2, -1}
  ]

  def create_board do
    for _ <- 1..@n do
      for _ <- 1..@n do
        -1
      end
    end
  end

  def valid_move?(x, y, board) do
    x in 0..(@n - 1) and y in 0..(@n - 1) and Enum.at(Enum.at(board, x), y) == -1
  end

  # Función auxiliar para actualizar una posición del tablero
  defp update_board(board, x, y, value) do
    List.update_at(board, x, fn row ->
      List.update_at(row, y, fn _ -> value end)
    end)
  end

  def solve do
    board = create_board()
    board = update_board(board, 0, 0, 0)
    case solve_util(0, 0, 1, board) do
      {:ok, solution} ->
        IO.puts("Solución encontrada:")
        print_board(solution)

      :error ->
        IO.puts("No se encontró solución.")
    end
  end

  defp solve_util(_x, _y, move_count, board) when move_count == @n * @n do
    {:ok, board}
  end

  defp solve_util(x, y, move_count, board) do
    Enum.reduce_while(@moves, :error, fn {dx, dy}, acc ->
      next_x = x + dx
      next_y = y + dy

      if valid_move?(next_x, next_y, board) do
        new_board = update_board(board, next_x, next_y, move_count)

        case solve_util(next_x, next_y, move_count + 1, new_board) do
          {:ok, result} -> {:halt, {:ok, result}}
          :error -> {:cont, acc}
        end
      else
        {:cont, acc}
      end
    end)
  end

  defp print_board(board) do
    for row <- board do
      row
      |> Enum.map(&String.pad_leading(Integer.to_string(&1), 2, "0"))
      |> Enum.join(" ")
      |> IO.puts()
    end
  end
end

SaltoCaballo.solve()
