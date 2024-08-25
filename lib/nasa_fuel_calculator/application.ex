defmodule NasaFuelCalculator.Application do
  use Application

  def start(_type, _args) do
    children = [
      {NasaFuelCalculator.FuelServer, []}
    ]

    opts = [strategy: :one_for_one, name: NasaFuelCalculator.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
