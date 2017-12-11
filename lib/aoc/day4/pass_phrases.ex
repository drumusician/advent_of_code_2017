defmodule Aoc.Day4.PassPhrases do
  def count_valid_phrases(input) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.count(fn x -> valid?(x) == true end)
  end

  def count_valid_phrases(input, anagrams: true) do
    input
    |> String.trim()
    |> String.split("\n")
    |> Enum.count(fn x -> even_more_valid?(x) == true end)
  end

  def even_more_valid?(pass_phrase) do
    word_list =
      pass_phrase
      |> String.split()
      |> Enum.map(fn x -> String.to_charlist(x) |> Enum.sort() end)
      |> Enum.sort()

    length(word_list) == Enum.dedup(word_list) |> length
  end

  def valid?(pass_phrase) do
    word_list =
      pass_phrase
      |> String.split()
      |> Enum.sort()

    length(word_list) == Enum.dedup(word_list) |> length
  end
end
