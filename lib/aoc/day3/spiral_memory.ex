defmodule Aoc.Day3.SpiralMemory do
  def steps_back_from_square(n) do
    steps = take_step([{1, 0, 0}], "right", 1, 1, n)
    [{_n, x, y} | _] = steps
    abs(x) + abs(y)
  end

  def take_step(steps, _direction, _iteration, _left_in_iteration, last_step)
      when last_step == length(steps) do
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

  def take_step([{n, x, y} | _] = steps, direction, iteration, left_in_iteration, last_step) do
    case direction do
      "right" ->
        take_step(
          [{n + 1, x + 1, y} | steps],
          "right",
          iteration,
          left_in_iteration - 1,
          last_step
        )

      "up" ->
        take_step([{n + 1, x, y + 1} | steps], "up", iteration, left_in_iteration - 1, last_step)

      "left" ->
        take_step(
          [{n + 1, x - 1, y} | steps],
          "left",
          iteration,
          left_in_iteration - 1,
          last_step
        )

      "down" ->
        take_step(
          [{n + 1, x, y - 1} | steps],
          "down",
          iteration,
          left_in_iteration - 1,
          last_step
        )
    end
  end
end
