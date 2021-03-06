use Mix.Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :excon, Excon.Repo,
  username: "postgres",
  password: "postgres",
  database: "excon_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :excon, Excon.GitApi.Client, get_api_adapter: Excon.GitApi.ClientMock

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :excon, ExconWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
