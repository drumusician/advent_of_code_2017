defmodule Aoc.InverseCaptcha do
  def calculate(input) when is_list(input) do
    acc = 0

    for n <- 0..length(input) do
      acc = acc + sum(acc, Enum.at(input, n), Enum.at(input, n - 1))
    end
    |> Enum.reduce(0, fn x, acc -> acc + x end)
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

  defp sum(total, digit, former_digit) do
    cond do
      digit == former_digit ->
        digit

      true ->
        0
    end
  end
end
