defmodule Aoc.Day6.MemoryReallocation do
  def find_infinite_loop(input) do
    input
    |> _find_infinite_loop(0)
  end

  defp _find_infinite_loop([input | _] = full_input, runs) do
    {max, offset} = get_max(input)
    input = redistribute(input, max, offset)
    cond do
      Enum.member?(full_input, input) ->
        runs
      true ->
        _find_infinite_loop(full_input, runs + 1)
    end
  end

  def redistribute(input, max, offset) do
    input
    |> set_offset_to_zero(offset)
    |> update_input(max, offset)
  end

  defp update_input(input, max, _offset) when max == 0 do
    input
  end

  defp update_input(input, max, offset) when max > 0 do
    input = List.update_at(input, offset, &(&1 + 1))

    cond do
      offset > length(input) - 1 ->
        update_input(input, max - 1, 0)

      true ->
        update_input(input, max - 1, offset + 1)
    end
  end

  defp set_offset_to_zero(input, offset) do
    List.replace_at(input, offset, 0)
  end

  defp get_max(input) do
    max = Enum.max(input)
    offset = Enum.find_index(input, &(&1 == max))
    {max, offset}
  end
end
