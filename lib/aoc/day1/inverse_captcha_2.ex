defmodule Aoc.Day1.InverseCaptchaTwo do
  def calculate(input) when is_list(input) do
    input
    |> Enum.with_index()
    |> Enum.reduce(0, fn {x, i}, acc ->
         cond do
           x == Enum.at(input, i - half_input_length(input)) ->
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

  defp half_input_length(input) do
    (length(input) / 2)
    |> round
  end
end
