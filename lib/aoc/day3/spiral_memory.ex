defmodule Aoc.Day3.SpiralMemory do
  def steps_back_from_square(n) do
    steps = take_step([{1, 0, 0}], "right", 1, 1, n)
    [{_n, x, y} | _] = steps
    abs(x) + abs(y)
  end

  def take_steps_until_value(n) do
    :ets.new(:coordinates, [:named_table])
    :ets.insert(:coordinates, {{0, 0}, 1})
    take_step_and_sum([{1, 1, 0}], "up", 1, 1, n)
  end

  def take_step([{n, _, _}] = steps, _direction, _iteration, _left_in_iteration, last_step)
      when n == last_step do
    steps
  end

  def take_step(steps, direction, iteration, 0, last_step) do
    case direction do
      "right" ->
        take_step(steps, "up", iteration, iteration, last_step)
      "up" ->
        take_step(steps, "left", iteration + 1, iteration + 1, last_step)
      "left" ->
        take_step(steps, "down", iteration, iteration, last_step)
      "down" ->
        take_step(steps, "right", iteration + 1, iteration + 1, last_step)
    end
  end

  def take_step([{n, x, y}], direction, iteration, left_in_iteration, last_step) do
    case direction do
      "right" ->
        take_step([{n + 1, x + 1, y}], "right", iteration, left_in_iteration - 1, last_step)
      "up" ->
        take_step([{n + 1, x, y + 1}], "up", iteration, left_in_iteration - 1, last_step)
      "left" ->
        take_step([{n + 1, x - 1, y}], "left", iteration, left_in_iteration - 1, last_step)
      "down" ->
        take_step([{n + 1, x, y - 1}], "down", iteration, left_in_iteration - 1, last_step)
    end
  end

  def take_step_and_sum([{n, _x, _y}], _direction, _iteration, _left_in_iteration, last_step)
      when n > last_step do
        n
  end

  def take_step_and_sum(steps, direction, iteration, 0, last_step) do
    case direction do
      "right" ->
        take_step_and_sum(steps, "up", iteration, iteration, last_step)
      "up" ->
        take_step_and_sum(steps, "left", iteration + 1, iteration + 1, last_step)
      "left" ->
          take_step_and_sum(steps, "down", iteration, iteration, last_step)
      "down" ->
        take_step_and_sum(steps, "right", iteration + 1, iteration + 1, last_step)
      end
  end

  def take_step_and_sum([{n, x, y}], direction, iteration, left_in_iteration, last_step) do
    case direction do
      "right" ->
        :ets.insert(:coordinates, {{x, y}, sum_of_neighbours({n, x, y})})
        take_step_and_sum([{sum_of_neighbours({n, x, y}), x + 1, y}], "right", iteration, left_in_iteration - 1, last_step)
      "up" ->
        :ets.insert(:coordinates, {{x, y}, sum_of_neighbours({n, x, y})})
        take_step_and_sum([{sum_of_neighbours({n, x, y}), x, y + 1}], "up", iteration, left_in_iteration - 1, last_step)
      "left" ->
        :ets.insert(:coordinates, {{x, y}, sum_of_neighbours({n, x, y})})
        take_step_and_sum([{sum_of_neighbours({n, x, y}), x - 1, y}], "left", iteration, left_in_iteration - 1, last_step)
      "down" ->
        :ets.insert(:coordinates, {{x, y}, sum_of_neighbours({n, x, y})})
        take_step_and_sum([{sum_of_neighbours({n, x, y}), x, y - 1}], "down", iteration, left_in_iteration - 1, last_step)
    end
  end

  def sum_of_neighbours(coordinate) do
    {_, a, b} = coordinate
    for x <- -1..1, y <- -1..1, {x, y} != {0, 0} do
      get_value_for_coordinate({a+x, b+y})
    end
    |> Enum.sum
  end

  def get_value_for_coordinate({x, y}) do
    case :ets.lookup(:coordinates, {x, y}) do
      [{{_x, _y}, value}] ->
       value
      [] ->
        0
    end
  end
end
