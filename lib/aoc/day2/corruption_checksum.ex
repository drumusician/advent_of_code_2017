defmodule Aoc.Day2.CorruptionChecksum do
  def checksum(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&max_diff/1)
    |> Enum.sum()
  end

  def max_diff(line) do
    values = convert_line_to_list(line)
    Enum.max(values) - Enum.min(values)
  end

  defp convert_line_to_list(line) do
    line
    |> String.trim()
    |> String.split("\t")
    |> Enum.map(&String.to_integer/1)
  end
end
