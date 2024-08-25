defmodule NasaFuelCalculator do
  alias NasaFuelCalculator.FuelServer

  @spec run(integer, list) :: String.t()
  def run(mass, instructions) do
    case FuelServer.calculate_fuel(mass, instructions) do
      {:error, reason} -> IO.puts("Error: #{reason}")
      fuel -> IO.puts("Total fuel required: #{fuel}")
    end
  end
end
