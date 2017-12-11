defmodule Aoc.Day2.EvenlyDivisibleChecksumTest do
  use ExUnit.Case, async: true

  test "it can calculate the checksum by summing up the evenly divisible numbers per line" do
    input = "5\t9\t2\t8\n9\t4\t7\t3\n3\t8\t6\t5\n"
    assert 9 == Aoc.Day2.EvenlyDivisibleChecksum.checksum(input)
  end

  @tag :input
  test "it can calculate the checksum from an input file" do
    {:ok, input} = File.read("test/fixtures/input_day2.txt")
    assert 308 == Aoc.Day2.EvenlyDivisibleChecksum.checksum(input)
  end
end
