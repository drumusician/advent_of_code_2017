defmodule Aoc.InverseCaptcha do
  def calculate(input) when is_list(input) do
    input
    |> Enum.with_index()
    |> Enum.reduce(0, fn {x, i}, acc ->
         cond do
           x == Enum.at(input, i - 1) ->
             acc + x

           true ->
             acc
         end
       end)
  end

  def calculate(input) when is_integer(input) do
    input
    |> Integer.digits()
    |> calculate
  end

  def calculate(input) when is_bitstring(input) do
    input
    |> String.to_integer()
    |> calculate
  end
end
