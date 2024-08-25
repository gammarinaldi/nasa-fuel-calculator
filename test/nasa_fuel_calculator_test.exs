defmodule NasaFuelCalculatorTest do
  use ExUnit.Case
  alias NasaFuelCalculator.FuelCalculator

  test "calculates fuel for the Apollo 11 mission" do
    mass = 28801

    instructions = [
      {:launch, "earth"},
      {:land, "moon"},
      {:launch, "moon"},
      {:land, "earth"}
    ]

    expected_fuel = 36778

    fuel = FuelCalculator.calculate_fuel(mass, instructions)

    assert fuel == expected_fuel
  end

  test "calculates fuel for a mission to Mars" do
    mass = 14606

    instructions = [
      {:launch, "earth"},
      {:land, "mars"},
      {:launch, "mars"},
      {:land, "earth"}
    ]

    expected_fuel = 21060

    fuel = FuelCalculator.calculate_fuel(mass, instructions)

    assert fuel == expected_fuel
  end

  test "calculates fuel for a passenger ship" do
    mass = 75432

    instructions = [
      {:launch, "earth"},
      {:land, "moon"},
      {:launch, "moon"},
      {:land, "mars"},
      {:launch, "mars"},
      {:land, "earth"}
    ]

    expected_fuel = 121785

    fuel = FuelCalculator.calculate_fuel(mass, instructions)

    assert fuel == expected_fuel
  end

  test "returns error for unknown path in the mission" do
    mass = 28801

    instructions = [
      {:launch, "earth"},
      {:land, "moon"},
      {:launch, "moon"},
      {:land, "jupiter"}
    ]

    assert {:error, "Unknown gravity planet Jupiter"} = FuelCalculator.calculate_fuel(mass, instructions)
  end
end
