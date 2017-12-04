defmodule Aoc.Day2.EvenlyDivisibleChecksum do
  def checksum(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.map(&find_evenly_divisible/1)
    |> Enum.sum()
  end

  def find_evenly_divisible(line) do
    line
    |> convert_line_to_list
    |> Enum.sort()
    |> Enum.reverse()
    |> evenly_divisible
    |> Enum.filter(fn x -> length(x) == 2 end)
    |> Enum.map(fn [x, y] -> x / y end)
    |> List.first()
    |> round
  end

  defp evenly_divisible(list) do
    for y <- list do
      Enum.filter(list, fn x -> rem(y, x) == 0 end)
    end
  end

  defp convert_line_to_list(line) do
    line
    |> String.trim()
    |> String.split("\t")
    |> Enum.map(&String.to_integer/1)
  end
end
