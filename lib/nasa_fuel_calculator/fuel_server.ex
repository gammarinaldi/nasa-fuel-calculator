defmodule NasaFuelCalculator.FuelServer do
  use GenServer

  alias NasaFuelCalculator.FuelCalculator

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  def calculate_fuel(mass, instructions) do
    GenServer.call(__MODULE__, {:calculate_fuel, mass, instructions})
  end

  @impl true
  def init(state) do
    {:ok, state}
  end

  @impl true
  def handle_call({:calculate_fuel, mass, instructions}, _from, state) do
    fuel = FuelCalculator.calculate_fuel(mass, instructions)

    {:reply, fuel, state}
  rescue
    reason -> {:reply, {:error, reason}, state}
  end
end
