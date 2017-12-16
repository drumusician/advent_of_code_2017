defmodule Aoc.Day6.MemoryReallocationTest do
  use ExUnit.Case, Async: true
  
  @tag :skip
  test "it should calculate the number of steps required to discover the infinite loop" do
    input = [10, 3, 15, 10, 5, 15, 5, 15, 9, 2, 5, 8, 5, 2, 3, 6]
    assert 14 == Aoc.Day6.MemoryReallocation.find_infinite_loop(input)
  end
end
