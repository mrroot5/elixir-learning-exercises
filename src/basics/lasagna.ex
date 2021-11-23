defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(time_in_oven) do
    expected_minutes_in_oven() - time_in_oven
  end

  def preparation_time_in_minutes(lasagna_layers) do
    minutes_to_prepare = 2
    lasagna_layers * minutes_to_prepare
  end

  def total_time_in_minutes(lasagna_layers, time_in_oven) do
    preparation_time_in_minutes(lasagna_layers) + time_in_oven
  end

  def alarm, do: "Ding!"
end

IO.puts(Lasagna.total_time_in_minutes(2, 10))

# defmodule LasagnaTest do
#   use ExUnit.Case
#   doctest Lasagna

#   test "greets the world" do
#     assert Lasagna.expected_minutes_in_oven() == 40
#   end
# end
