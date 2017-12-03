defmodule Aoc.InverseCaptchaTest do
  use ExUnit.Case, Async: true

  test "sums sequence of two identical numbers" do
    assert 3 == Aoc.InverseCaptcha.calculate(1122)
  end

  test "sums sequence of 4 the same numbers" do
    assert 4 == Aoc.InverseCaptcha.calculate(1111)
  end

  test "sums sequence of 4 sequenced numbers" do
    assert 0 == Aoc.InverseCaptcha.calculate(1234)
  end

  test "sums sequence when input is text" do
    assert 4 == Aoc.InverseCaptcha.calculate("1111")
  end

  test "sums sequence from test input" do
    test_input =
      File.read!("test/fixtures/input_day1.txt")
      |> String.trim()

    assert 995 == Aoc.InverseCaptcha.calculate(test_input)
  end
end
