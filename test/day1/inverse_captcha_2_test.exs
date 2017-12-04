defmodule Aoc.Day1.InverseCaptchaTwoTest do
  use ExUnit.Case, Async: true

  test "all four digits match two items ahead" do
    assert 6 == Aoc.Day1.InverseCaptchaTwo.calculate(1212)
  end

  test "symmetrical list will return 0" do
    assert 0 == Aoc.Day1.InverseCaptchaTwo.calculate(1221)
  end

  test "one digits matches and is calculated" do
    assert 4 == Aoc.Day1.InverseCaptchaTwo.calculate(123_425)
  end

  test "multiple digits match" do
    assert 12 == Aoc.Day1.InverseCaptchaTwo.calculate(123_123)
  end

  test "multiple digits matches and is calculated" do
    assert 4 == Aoc.Day1.InverseCaptchaTwo.calculate(12_131_415)
  end

  test "sums sequence from test input" do
    test_input =
      File.read!("test/fixtures/input_day1.txt")
      |> String.trim()

    assert 1130 == Aoc.Day1.InverseCaptchaTwo.calculate(test_input)
  end
end
