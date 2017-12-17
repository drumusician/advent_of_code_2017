defmodule Aoc.Day6.MemoryReallocation do
  def find_infinite_loop(input) do
    :ets.new(:memory, [:named_table])
    input
    |> _find_infinite_loop(1)
  end

  defp _find_infinite_loop(input, runs) do
    {max, offset} = get_max(input)
    input = redistribute(input, max, offset)
    case :ets.match(:memory, {:"$1", input}) do
      [[run]] ->
        {runs,  runs - run}
      _ ->
        :ets.insert(:memory, {runs, input})
        _find_infinite_loop(input, runs + 1)
    end
  end

  def redistribute(input, max, offset) do
    input
    |> set_offset_to_zero(offset - 1)
    |> update_input(max, offset)
  end

  def update_input(input, max, _offset) when max == 0 do
    input
  end

  def update_input(input, max, offset) when max > 0 do
    input = List.update_at(input, offset, &(&1 + 1))

    cond do
      offset == (length(input) - 1) ->
        update_input(input, max - 1, 0)

      true ->
        update_input(input, max - 1, offset + 1)
    end
  end

  def set_offset_to_zero(input, offset) do
    List.replace_at(input, offset, 0)
  end

  def get_max(input) do
    max = Enum.max(input)
    offset = Enum.find_index(input, &(&1 == max))
    offset = cond do
      offset == (length(input) -1) ->
        0
      true ->
        offset + 1
    end
    {max, offset}
  end
end
