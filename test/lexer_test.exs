defmodule LexerTest do
  use ExUnit.Case

  test "binary operator" do
    tests = [
      %{input: "2 + 3", left: "2", operator: "+", right: "3"},
      %{input: "2 - 3", left: "2", operator: "-", right: "3"},
      %{input: "2 * 3", left: "2", operator: "*", right: "3"},
      %{input: "2 / 3", left: "2", operator: "/", right: "3"}
    ]

    tests
    |> Enum.each(fn(t) ->
      l = %Lexer{code: t.input}
      tokens = Lexer.next_token(l)

      assert length(tokens) == 3

      left = Enum.at(tokens, 0)
      assert left.literal == t.left

      op = Enum.at(tokens, 1)
      assert op.literal == t.operator

      right = Enum.at(tokens, 2)
      assert right.literal == t.right
    end
    )
  end
end
