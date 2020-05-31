defmodule VorlesungProcessesTest do
  use ExUnit.Case
  doctest VorlesungProcesses

  test "greets the world" do
    assert VorlesungProcesses.hello() == :world
  end
end
