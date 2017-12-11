defmodule Aoc.Day4.PassPhrasesTest do
  use ExUnit.Case, Async: true

  test "it should detect an incorrect passphrase based on duplicate words" do
    invalid_phrase = "this is an invalid phrase this"
    assert false == Aoc.Day4.PassPhrases.valid?(invalid_phrase)
  end

  test " it should detect a valid pass phrase" do
    valid_phrase = "Hi this pass phrase is valid"
    assert true == Aoc.Day4.PassPhrases.valid?(valid_phrase)
  end

  test "should be able to count the number of valid passphrases from an input file" do
    {:ok, input} = File.read("test/fixtures/input_day4.txt")

    assert 451 == Aoc.Day4.PassPhrases.count_valid_phrases(input)
  end

  test "should be able to detect even more secure pass phrases with anagrams" do
    invalid_phrase = "hallo ollah"
    assert false == Aoc.Day4.PassPhrases.even_more_valid?(invalid_phrase)
  end

  @tag :input
  test "should be able to count the number of valid passphrases(including anagrams) from an input file" do
    {:ok, input} = File.read("test/fixtures/input_day4.txt")

    assert 223 == Aoc.Day4.PassPhrases.count_valid_phrases(input, anagrams: true)
  end
end
