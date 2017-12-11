defmodule Aoc.Day5.TwistyTrampolines do
  def jump(_maze, position, steps) when position < 0, do: {:escaped, steps}

  def jump(maze, position, steps \\ 0) do
    new_maze = List.update_at(maze, position, &(&1 + 1))
    jump_size = Enum.at(maze, position)
    new_position = position + jump_size

    maze_length = length(maze) - 1

    cond do
      new_position > maze_length ->
        jump(new_maze, -1, steps + 1)

      true ->
        jump(new_maze, new_position, steps + 1)
    end
  end

  def jump_2(_maze, position, steps) when position < 0, do: {:escaped, steps}

  def jump_2(maze, position, steps \\ 0) do
    value = Enum.at(maze, position)
    new_maze = adjust_maze(maze, position, value)
    new_position = position + value

    maze_length = length(maze) - 1

    cond do
      new_position > maze_length ->
        jump_2(new_maze, -1, steps + 1)

      true ->
        jump_2(new_maze, new_position, steps + 1)
    end
  end

  def adjust_maze(maze, position, value) do
    cond do
      value > 2 ->
        List.update_at(maze, position, &(&1 - 1))

      true ->
        List.update_at(maze, position, &(&1 + 1))
    end
  end
end
