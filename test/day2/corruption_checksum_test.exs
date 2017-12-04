defmodule Aoc.Day2.CorruptionChecksumTest do
  use ExUnit.Case, async: true

  test "it can calculate the difference between the smallest and largest vaue in a line" do
    line = "5\t1\t9\t5\n"
    assert 8 == Aoc.Day2.CorruptionChecksum.max_diff(line)
  end

  test "it can calculate the checksum by adding up the max_diffs in a sheet" do
    input = "5\t1\t9\t5\n7\t5\t3\n2\t4\t6\t8\n"
    assert 18 == Aoc.Day2.CorruptionChecksum.checksum(input)
  end

  test "it can calculate the checksum from an input file" do
    {:ok, input} = File.read("test/fixtures/input_day2.txt")
    assert 58975 == Aoc.Day2.CorruptionChecksum.checksum(input)
  end
end
