defmodule Aoc.Day3.SpiralMemoryTest do
  use ExUnit.Case, async: true

  @tag timeout: 600_000
  test "it should return the number of steps required to return to the gate" do
    assert 0 == Aoc.Day3.SpiralMemory.steps_back_from_square(1)
    assert 3 == Aoc.Day3.SpiralMemory.steps_back_from_square(12)
    assert 2 == Aoc.Day3.SpiralMemory.steps_back_from_square(23)
    assert 31 == Aoc.Day3.SpiralMemory.steps_back_from_square(1024)
    # assert 326 == Aoc.Day3.SpiralMemory.steps_back_from_square(361527)
  end

  # test "it should be able to calculate all adjacent values from a coordinate" do
  # assert 1 == Aoc.Day3.SpiralMemory.sum_of_neighbours(2)
  # assert 2 == Aoc.Day3.SpiralMemory.sum_of_neighbours(3)
  # assert 25 == Aoc.Day3.SpiralMemory.sum_of_neighbours(25)
  # end

  # test "it should report the first value above the input value" do
  # assert 361600 == Aoc.Day3.SpiralMemory.above_input_value
  # end
end
