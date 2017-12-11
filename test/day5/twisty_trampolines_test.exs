defmodule Aoc.Day5.TwistyTrampolinesTest do
  use ExUnit.Case, Async: true

  setup _context do
    maze = [0, 3, 0, 1, -3]
    start_position = 1
    {:ok, [maze: maze, start_position: start_position]}
  end

  test "it should indicate how many steps it takes to escape the maze", context do
    start_position = 0
    {:escaped, steps} = Aoc.Day5.TwistyTrampolines.jump(context.maze, start_position)
    assert steps == 5
  end

  test "it should indicate how many steps it takes to escape the advanced maze", context do
    start_position = 0
    {:escaped, steps} = Aoc.Day5.TwistyTrampolines.jump_2(context.maze, start_position)
    assert steps == 10
  end

  test "it should indicate how many steps it takes to escape based on an input file" do
    {:ok, input} = File.read("test/fixtures/input_day5.txt")

    {:escaped, steps} =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Aoc.Day5.TwistyTrampolines.jump(0)

    assert 315_613 == steps
  end

  @tag :input
  @tag timeout: 600_000
  test "it should indicate how many steps it takes to escape advanced based on an input file" do
    {:ok, input} = File.read("test/fixtures/input_day5.txt")

    {:escaped, steps} =
      input
      |> String.trim()
      |> String.split("\n")
      |> Enum.map(&String.to_integer/1)
      |> Aoc.Day5.TwistyTrampolines.jump_2(0)

    assert 315_613 == steps
  end
end
