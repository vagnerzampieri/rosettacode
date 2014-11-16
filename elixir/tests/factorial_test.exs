Code.require_file "../factorial.exs", __DIR__

ExUnit.start

defmodule Tests do
  use ExUnit.Case

  test "factorial 2 should be 2" do
    assert Factorial.calc(2) == 2
  end

  test "factorial 5 should be 120" do
    assert Factorial.calc(5) == 120
  end

  test "factorial 15 should be 1307674368000" do
    assert Factorial.calc(15) == 1307674368000
  end
end
