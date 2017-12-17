defmodule Aoc.Day6.MemoryReallocationTest do
  use ExUnit.Case, Async: true
  
  
  test "it should calculate the number of steps required to discover the infinite loop and the size of the loop" do
    input = [10, 3, 15, 10, 5, 15, 5, 15, 9, 2, 5, 8, 5, 2, 3, 6]
    {number_of_steps, size_of_loop} = Aoc.Day6.MemoryReallocation.find_infinite_loop(input)
    assert number_of_steps == 14029
    assert size_of_loop == 2765
  end
end
