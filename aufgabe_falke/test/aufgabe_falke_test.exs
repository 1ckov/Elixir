defmodule AufgabeFalkeTest do
  use ExUnit.Case
  doctest AufgabeFalke

  test "greets the world" do
    assert AufgabeFalke.hello() == :world
  end
end
