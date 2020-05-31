defmodule TextAnalysisTest do
  use ExUnit.Case
  doctest TextAnalysis

  test "greets the world" do
    assert TextAnalysis.hello() == :world
  end
end
