defmodule Aoc.Day3.SpiralMemoryTest do
  use ExUnit.Case, async: true

  test "it should return the number of steps required to return to the gate" do
    assert 0 == Aoc.Day3.SpiralMemory.steps_back_from_square(1)
    assert 3 == Aoc.Day3.SpiralMemory.steps_back_from_square(12)
    assert 2 == Aoc.Day3.SpiralMemory.steps_back_from_square(23)
    assert 31 == Aoc.Day3.SpiralMemory.steps_back_from_square(1024)
    assert 326 == Aoc.Day3.SpiralMemory.steps_back_from_square(361527)
  end

  test "it should report the first value above the input value" do
    assert 363010 == Aoc.Day3.SpiralMemory.take_steps_until_value(361527)
  end
end
