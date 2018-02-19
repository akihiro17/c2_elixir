defmodule Lexer do
  defstruct code: ""

  def next_token(%Lexer{code: code}) when code != "" do
    String.graphemes(code)
    |> _next_token([])
    |> Enum.reverse
  end

  defp _next_token([ch | rest], tokens) when "0" <= ch and ch <= "9" do
    _next_token(rest, [Token.integer_literal(ch) | tokens])
  end

  defp _next_token([ch | rest], tokens) when ch == "+" do
    _next_token(rest, [Token.plus(ch) | tokens])
  end

  defp _next_token([ch | rest], tokens) when ch == "-" do
    _next_token(rest, [Token.minus(ch) | tokens])
  end

  defp _next_token([ch | rest], tokens) when ch == "*" do
    _next_token(rest, [Token.asterisk(ch) | tokens])
  end

  defp _next_token([ch | rest], tokens) when ch == "/" do
    _next_token(rest, [Token.slash(ch) | tokens])
  end

  defp _next_token([ch | rest], tokens) when ch == " " do
    _next_token(rest, tokens)
  end

  defp _next_token([], tokens) do
    tokens
  end
end
