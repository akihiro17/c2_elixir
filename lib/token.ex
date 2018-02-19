defmodule Token do
  defstruct type: "", literal: ""

  def integer_literal(literal) do
    %Token{type: "int_literal", literal: literal}
  end

  def plus(literal) do
    %Token{type: "plus", literal: literal}
  end

  def minus(literal) do
    %Token{type: "minus", literal: literal}
  end

  def asterisk(literal) do
    %Token{type: "asterisk", literal: literal}
  end

  def slash(literal) do
    %Token{type: "slash", literal: literal}
  end
end
