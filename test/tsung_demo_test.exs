defmodule TsungDemoTest do
  use ExUnit.Case
  doctest TsungDemo

  test "greets the world" do
    assert TsungDemo.hello() == :world
  end
end
