# NasaFuelCalculator

This application aims to calculate fuel to launch from one planet of the solar system and land on another planet of the solar system, depending on the flight route.

## How to run the test suite
```
mix test
```
## Explain the circumstances under which a Supervisor would restart a crashed GenServer and how many restarts would be attempted.
GenServer crashed because of an unhandled exception or runtime error, it would be restarted when `child_spec/1` option`:restart` set to `:permanent` (default), the child process will always restarted.
The number of restart attempts is determined by the crashed GenServer `child_spec/1` option `:shutdown`, defaults to `5_000`.
