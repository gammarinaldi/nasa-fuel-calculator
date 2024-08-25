defmodule NasaFuelCalculator.FuelCalculator do
  @spec calculate_fuel(integer, list) :: {:error, String.t()} | integer
  def calculate_fuel(mass, instructions) do
    Enum.reduce(instructions, 0, fn {action, planet}, acc ->
      get_gravity(planet)
      |> case do
        :error ->
          {:error, "Unknown gravity planet #{String.capitalize(planet)}"}

        gravity ->
          fuel =
            get_params(action)
            |> calculate_total_fuel(mass, gravity)
        
          fuel + acc
      end
    end)
  end

  defp calculate_total_fuel({multiplier, constant}, mass, gravity) do
    fuel = floor(mass * gravity * multiplier - constant)

    if fuel <= 0 do
      0
    else
      fuel + calculate_total_fuel({multiplier, constant}, fuel, gravity)
    end
  end

  defp get_gravity("earth"), do: 9.807
  defp get_gravity("moon"), do: 1.62
  defp get_gravity("mars"), do: 3.711
  defp get_gravity(_), do: :error

  defp get_params(:launch), do: {0.042, 33}
  defp get_params(:land), do: {0.033, 42}
end
